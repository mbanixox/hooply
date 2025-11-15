import 'package:drift/drift.dart';
import 'package:hooply/core/constants/app_constants.dart';
import 'package:hooply/core/database/app_database.dart';
import 'package:hooply/core/providers/database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_repository.g.dart';

@riverpod
GameRepository gameRepository(Ref ref) {
  final database = ref.watch(databaseProvider);
  return GameRepository(database);
}

class GameRepository {
  final AppDatabase _db;

  GameRepository(this._db);

  // Get all games
  Stream<List<Game>> watchAllGames() {
    return (_db.select(_db.games)..orderBy([
          (g) => OrderingTerm(expression: g.gameDate, mode: OrderingMode.desc),
        ]))
        .watch();
  }

  // Get games for a team
  Stream<List<Game>> watchTeamGames(int teamId) {
    return (_db.select(_db.games)
          ..where((g) => g.teamId.equals(teamId))
          ..orderBy([
            (g) =>
                OrderingTerm(expression: g.gameDate, mode: OrderingMode.desc),
          ]))
        .watch();
  }

  // Get single game
  Future<Game?> getGame(int id) {
    return (_db.select(
      _db.games,
    )..where((g) => g.id.equals(id))).getSingleOrNull();
  }

  // Get in-progress game
  Future<Game?> getInProgressGame() {
    return (_db.select(_db.games)
          ..where((g) => g.status.equals(AppConstants.gameStatusInProgress)))
        .getSingleOrNull();
  }

  // Create game
  Future<int> createGame({
    required int teamId,
    required String opponentName,
    required int quarterDuration,
  }) {
    return _db
        .into(_db.games)
        .insert(
          GamesCompanion.insert(
            teamId: teamId,
            opponentName: opponentName,
            gameDate: DateTime.now(),
            status: AppConstants.gameStatusInProgress,
            quarterDuration: quarterDuration,
            currentQuarter: 1,
            currentQuarterSeconds: 0,
            isTimerRunning: false,
            createdAt: DateTime.now(),
          ),
        );
  }

  // Update game
  Future<bool> updateGame(Game game) {
    return _db.update(_db.games).replace(game);
  }

  // Complete game
  Future<void> completeGame(int gameId) async {
    final game = await getGame(gameId);
    if (game != null) {
      await _db
          .update(_db.games)
          .replace(
            game.copyWith(
              status: AppConstants.gameStatusCompleted,
              isTimerRunning: false,
            ),
          );
    }
  }

  // Delete game
  Future<int> deleteGame(int id) {
    return (_db.delete(_db.games)..where((g) => g.id.equals(id))).go();
  }
}
