import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooply/core/database/app_database.dart';
import 'package:hooply/features/game/data/game_event_repository.dart';
import 'package:hooply/features/game/data/game_repository.dart';
import 'package:hooply/features/game/data/player_stats_repository.dart';

// Watch current game
final currentGameProvider = StreamProvider.family<Game?, int>((ref, gameId) {
  final repo = ref.watch(gameRepositoryProvider);
  return repo.watchAllGames().map((games) {
    try {
      return games.firstWhere((g) => g.id == gameId);
    } catch (e) {
      return null;
    }
  });
});

// Watch game stats
final gameStatsProvider = StreamProvider.family<List<PlayerGameStat>, int>((
  ref,
  gameId,
) {
  final repo = ref.watch(playerStatsRepositoryProvider);
  return repo.watchGameStats(gameId);
});

// Watch game events
final gameEventsProvider = StreamProvider.family<List<GameEvent>, int>((
  ref,
  gameId,
) {
  final repo = ref.watch(gameEventRepositoryProvider);
  return repo.watchGameEvents(gameId);
});
