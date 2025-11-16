import 'package:hooply/core/constants/app_constants.dart';
import 'package:hooply/core/database/app_database.dart';
import 'package:hooply/features/game/data/game_repository.dart';
import 'package:hooply/features/game/data/player_stats_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_setup_provider.g.dart';

@riverpod
class GameSetup extends _$GameSetup {
  @override
  FutureOr<void> build() {
    // No initial state needed
  }

  Future<int> createGame({
    required int teamId,
    required String opponentName,
    required List<int> selectedPlayerIds,
    required List<Player> allPlayers,
  }) async {
    // Create the game
    final gameId = await ref
        .read(gameRepositoryProvider)
        .createGame(
          teamId: teamId,
          opponentName: opponentName,
          quarterDuration: AppConstants.defaultQuarterDuration,
        );

    // Initialize stats for all players
    final statsRepo = ref.read(playerStatsRepositoryProvider);

    for (final player in allPlayers) {
      await statsRepo.initializePlayerStats(
        gameId: gameId,
        playerId: player.id,
        isOnCourt: selectedPlayerIds.contains(player.id),
      );
    }

    return gameId;
  }
}
