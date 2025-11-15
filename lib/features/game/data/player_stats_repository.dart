import 'package:drift/drift.dart';
import 'package:hooply/core/database/app_database.dart';
import 'package:hooply/core/providers/database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'player_stats_repository.g.dart';

@riverpod
PlayerStatsRepository playerStatsRepository(Ref ref) {
  final database = ref.watch(databaseProvider);
  return PlayerStatsRepository(database);
}

class PlayerStatsRepository {
  final AppDatabase _db;

  PlayerStatsRepository(this._db);

  // Get all stats for a game
  Stream<List<PlayerGameStat>> watchGameStats(int gameId) {
    return (_db.select(
      _db.playerGameStats,
    )..where((s) => s.gameId.equals(gameId))).watch();
  }

  Future<List<PlayerGameStat>> getGameStats(int gameId) {
    return (_db.select(
      _db.playerGameStats,
    )..where((s) => s.gameId.equals(gameId))).get();
  }

  // Get stats for a specific player in a game
  Future<PlayerGameStat?> getPlayerGameStats(int gameId, int playerId) {
    return (_db.select(_db.playerGameStats)
          ..where((s) => s.gameId.equals(gameId) & s.playerId.equals(playerId)))
        .getSingleOrNull();
  }

  // Initialize stats for a player
  Future<int> initializePlayerStats({
    required int gameId,
    required int playerId,
    required bool isOnCourt,
  }) {
    return _db
        .into(_db.playerGameStats)
        .insert(
          PlayerGameStatsCompanion.insert(
            gameId: gameId,
            playerId: playerId,
            isOnCourt: isOnCourt,
            minutesPlayed: 0,
            twoPointMade: 0,
            twoPointAttempted: 0,
            threePointMade: 0,
            threePointAttempted: 0,
            freeThrowMade: 0,
            freeThrowAttempted: 0,
            assists: 0,
            offensiveRebounds: 0,
            defensiveRebounds: 0,
            blocks: 0,
            steals: 0,
            turnovers: 0,
            fouls: 0,
            plusMinus: 0,
          ),
        );
  }

  // Update stats
  Future<bool> updateStats(PlayerGameStat stats) {
    return _db.update(_db.playerGameStats).replace(stats);
  }

  // Update on-court status
  Future<void> updateOnCourtStatus(
    int gameId,
    int playerId,
    bool isOnCourt,
  ) async {
    final stats = await getPlayerGameStats(gameId, playerId);
    if (stats != null) {
      await _db
          .update(_db.playerGameStats)
          .replace(stats.copyWith(isOnCourt: isOnCourt));
    }
  }

  // Get players on court
  Future<List<PlayerGameStat>> getPlayersOnCourt(int gameId) {
    return (_db.select(
      _db.playerGameStats,
    )..where((s) => s.gameId.equals(gameId) & s.isOnCourt.equals(true))).get();
  }

  // Get players on bench
  Future<List<PlayerGameStat>> getPlayersOnBench(int gameId) {
    return (_db.select(
      _db.playerGameStats,
    )..where((s) => s.gameId.equals(gameId) & s.isOnCourt.equals(false))).get();
  }
}
