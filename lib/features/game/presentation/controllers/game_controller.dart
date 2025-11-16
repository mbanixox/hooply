import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooply/core/constants/app_constants.dart';
import 'package:hooply/core/database/app_database.dart';
import 'package:hooply/features/game/data/game_event_repository.dart';
import 'package:hooply/features/game/data/game_repository.dart';
import 'package:hooply/features/game/data/player_stats_repository.dart';

class GameController extends Notifier<void> {
  Timer? _timer;

  @override
  void build() {
    ref.onDispose(() {
      _timer?.cancel();
    });
  }

  // Start/Resume Timer
  Future<void> startTimer(int gameId) async {
    final game = await ref.read(gameRepositoryProvider).getGame(gameId);
    if (game == null) return;

    await ref
        .read(gameRepositoryProvider)
        .updateGame(game.copyWith(isTimerRunning: true));

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      final currentGame = await ref
          .read(gameRepositoryProvider)
          .getGame(gameId);
      if (currentGame == null || !currentGame.isTimerRunning) {
        timer.cancel();
        return;
      }

      final newSeconds = currentGame.currentQuarterSeconds + 1;
      final quarterDurationSeconds = currentGame.quarterDuration * 60;

      if (newSeconds >= quarterDurationSeconds) {
        // Quarter ended
        await ref
            .read(gameRepositoryProvider)
            .updateGame(
              currentGame.copyWith(
                currentQuarter: currentGame.currentQuarter + 1,
                currentQuarterSeconds: 0,
                isTimerRunning: false,
              ),
            );
        timer.cancel();
      } else {
        await ref
            .read(gameRepositoryProvider)
            .updateGame(
              currentGame.copyWith(currentQuarterSeconds: newSeconds),
            );
      }
    });
  }

  // Pause Timer
  Future<void> pauseTimer(int gameId) async {
    _timer?.cancel();
    final game = await ref.read(gameRepositoryProvider).getGame(gameId);
    if (game != null) {
      await ref
          .read(gameRepositoryProvider)
          .updateGame(game.copyWith(isTimerRunning: false));
    }
  }

  // Record Stat
  Future<void> recordStat({
    required int gameId,
    required int playerId,
    required String statType,
    required bool isMade,
  }) async {
    final game = await ref.read(gameRepositoryProvider).getGame(gameId);
    if (game == null) return;

    final statsRepo = ref.read(playerStatsRepositoryProvider);
    final stats = await statsRepo.getPlayerGameStats(gameId, playerId);
    if (stats == null) return;

    PlayerGameStat updatedStats = stats;

    // Update stats based on type
    switch (statType) {
      case AppConstants.event2PtMade:
        updatedStats = stats.copyWith(
          twoPointAttempted: stats.twoPointAttempted + 1,
          twoPointMade: isMade ? stats.twoPointMade + 1 : stats.twoPointMade,
        );
        break;
      case AppConstants.event3PtMade:
        updatedStats = stats.copyWith(
          threePointAttempted: stats.threePointAttempted + 1,
          threePointMade: isMade
              ? stats.threePointMade + 1
              : stats.threePointMade,
        );
        break;
      case AppConstants.eventFTMade:
        updatedStats = stats.copyWith(
          freeThrowAttempted: stats.freeThrowAttempted + 1,
          freeThrowMade: isMade ? stats.freeThrowMade + 1 : stats.freeThrowMade,
        );
        break;
      case AppConstants.eventAssist:
        updatedStats = stats.copyWith(assists: stats.assists + 1);
        break;
      case AppConstants.eventReboundOff:
        updatedStats = stats.copyWith(
          offensiveRebounds: stats.offensiveRebounds + 1,
        );
        break;
      case AppConstants.eventReboundDef:
        updatedStats = stats.copyWith(
          defensiveRebounds: stats.defensiveRebounds + 1,
        );
        break;
      case AppConstants.eventBlock:
        updatedStats = stats.copyWith(blocks: stats.blocks + 1);
        break;
      case AppConstants.eventSteal:
        updatedStats = stats.copyWith(steals: stats.steals + 1);
        break;
      case AppConstants.eventTurnover:
        updatedStats = stats.copyWith(turnovers: stats.turnovers + 1);
        break;
      case AppConstants.eventFoul:
        updatedStats = stats.copyWith(fouls: stats.fouls + 1);
        break;
    }

    // Save updated stats
    await statsRepo.updateStats(updatedStats);

    // Record event for undo
    await ref
        .read(gameEventRepositoryProvider)
        .recordEvent(
          gameId: gameId,
          playerId: playerId,
          eventType: isMade ? statType : '${statType}_missed',
          quarter: game.currentQuarter,
          quarterSeconds: game.currentQuarterSeconds,
        );
  }

  // Undo Last Action
  Future<void> undoLastAction(int gameId) async {
    final eventRepo = ref.read(gameEventRepositoryProvider);
    final lastEvent = await eventRepo.getLastEvent(gameId);

    if (lastEvent == null) return;

    final statsRepo = ref.read(playerStatsRepositoryProvider);
    final stats = await statsRepo.getPlayerGameStats(
      gameId,
      lastEvent.playerId,
    );
    if (stats == null) return;

    PlayerGameStat updatedStats = stats;

    // Reverse the stat change
    final eventType = lastEvent.eventType;

    if (eventType.contains('2pt')) {
      updatedStats = stats.copyWith(
        twoPointAttempted: (stats.twoPointAttempted - 1).clamp(0, 999),
        twoPointMade: eventType == AppConstants.event2PtMade
            ? (stats.twoPointMade - 1).clamp(0, 999)
            : stats.twoPointMade,
      );
    } else if (eventType.contains('3pt')) {
      updatedStats = stats.copyWith(
        threePointAttempted: (stats.threePointAttempted - 1).clamp(0, 999),
        threePointMade: eventType == AppConstants.event3PtMade
            ? (stats.threePointMade - 1).clamp(0, 999)
            : stats.threePointMade,
      );
    } else if (eventType.contains('ft')) {
      updatedStats = stats.copyWith(
        freeThrowAttempted: (stats.freeThrowAttempted - 1).clamp(0, 999),
        freeThrowMade: eventType == AppConstants.eventFTMade
            ? (stats.freeThrowMade - 1).clamp(0, 999)
            : stats.freeThrowMade,
      );
    } else if (eventType == AppConstants.eventAssist) {
      updatedStats = stats.copyWith(assists: (stats.assists - 1).clamp(0, 999));
    } else if (eventType == AppConstants.eventReboundOff) {
      updatedStats = stats.copyWith(
        offensiveRebounds: (stats.offensiveRebounds - 1).clamp(0, 999),
      );
    } else if (eventType == AppConstants.eventReboundDef) {
      updatedStats = stats.copyWith(
        defensiveRebounds: (stats.defensiveRebounds - 1).clamp(0, 999),
      );
    } else if (eventType == AppConstants.eventBlock) {
      updatedStats = stats.copyWith(blocks: (stats.blocks - 1).clamp(0, 999));
    } else if (eventType == AppConstants.eventSteal) {
      updatedStats = stats.copyWith(steals: (stats.steals - 1).clamp(0, 999));
    } else if (eventType == AppConstants.eventTurnover) {
      updatedStats = stats.copyWith(
        turnovers: (stats.turnovers - 1).clamp(0, 999),
      );
    } else if (eventType == AppConstants.eventFoul) {
      updatedStats = stats.copyWith(fouls: (stats.fouls - 1).clamp(0, 999));
    }

    await statsRepo.updateStats(updatedStats);
    await eventRepo.deleteEvent(lastEvent.id);
  }

  // Substitute Players
  Future<void> substitutePlayer({
    required int gameId,
    required int playerInId,
    required int playerOutId,
  }) async {
    final statsRepo = ref.read(playerStatsRepositoryProvider);

    // Update on-court status
    await statsRepo.updateOnCourtStatus(gameId, playerInId, true);
    await statsRepo.updateOnCourtStatus(gameId, playerOutId, false);

    // TODO: Record substitution event with timestamp for minutes calculation
  }

  // End Game
  Future<void> endGame(int gameId) async {
    _timer?.cancel();
    await ref.read(gameRepositoryProvider).completeGame(gameId);
  }
}
