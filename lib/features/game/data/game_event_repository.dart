import 'package:drift/drift.dart';
import 'package:hooply/core/database/app_database.dart';
import 'package:hooply/core/providers/database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_event_repository.g.dart';

@riverpod
GameEventRepository gameEventRepository(Ref ref) {
  final database = ref.watch(databaseProvider);
  return GameEventRepository(database);
}

class GameEventRepository {
  final AppDatabase _db;

  GameEventRepository(this._db);

  // Record an event
  Future<int> recordEvent({
    required int gameId,
    required int playerId,
    required String eventType,
    required int quarter,
    required int quarterSeconds,
  }) {
    return _db
        .into(_db.gameEvents)
        .insert(
          GameEventsCompanion.insert(
            gameId: gameId,
            playerId: playerId,
            eventType: eventType,
            quarter: quarter,
            quarterSeconds: quarterSeconds,
            timestamp: DateTime.now(),
          ),
        );
  }

  // Get last event for undo
  Future<GameEvent?> getLastEvent(int gameId) {
    return (_db.select(_db.gameEvents)
          ..where((e) => e.gameId.equals(gameId))
          ..orderBy([
            (e) =>
                OrderingTerm(expression: e.timestamp, mode: OrderingMode.desc),
          ])
          ..limit(1))
        .getSingleOrNull();
  }

  // Delete event (for undo)
  Future<int> deleteEvent(int id) {
    return (_db.delete(_db.gameEvents)..where((e) => e.id.equals(id))).go();
  }

  // Get all events for a game
  Stream<List<GameEvent>> watchGameEvents(int gameId) {
    return (_db.select(_db.gameEvents)
          ..where((e) => e.gameId.equals(gameId))
          ..orderBy([
            (e) =>
                OrderingTerm(expression: e.timestamp, mode: OrderingMode.desc),
          ]))
        .watch();
  }
}
