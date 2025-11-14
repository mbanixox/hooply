import 'package:drift/drift.dart';
import 'package:hooply/core/database/app_database.dart';
import 'package:hooply/core/providers/database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'player_repository.g.dart';

@riverpod
PlayerRepository playerRepository(Ref ref) {
  final database = ref.watch(databaseProvider);
  return PlayerRepository(database);
}

class PlayerRepository {
  final AppDatabase _db;

  PlayerRepository(this._db);

  // Get all players for a team
  Stream<List<Player>> watchTeamPlayers(int teamId) {
    return (_db.select(_db.players)
          ..where((p) => p.teamId.equals(teamId))
          ..orderBy([(p) => OrderingTerm(expression: p.jerseyNumber)]))
        .watch();
  }

  Future<List<Player>> getTeamPlayers(int teamId) {
    return (_db.select(_db.players)
          ..where((p) => p.teamId.equals(teamId))
          ..orderBy([(p) => OrderingTerm(expression: p.jerseyNumber)]))
        .get();
  }

  // Get single player
  Future<Player?> getPlayer(int id) {
    return (_db.select(
      _db.players,
    )..where((p) => p.id.equals(id))).getSingleOrNull();
  }

  // Create player
  Future<int> createPlayer({
    required int teamId,
    required String name,
    required int jerseyNumber,
    required String position,
  }) {
    return _db
        .into(_db.players)
        .insert(
          PlayersCompanion.insert(
            teamId: teamId,
            name: name,
            jerseyNumber: jerseyNumber,
            position: position,
            createdAt: DateTime.now(),
          ),
        );
  }

  // Update player
  Future<bool> updatePlayer({
    required int id,
    required int teamId,
    required String name,
    required int jerseyNumber,
    required String position,
  }) {
    return _db
        .update(_db.players)
        .replace(
          Player(
            id: id,
            teamId: teamId,
            name: name,
            jerseyNumber: jerseyNumber,
            position: position,
            createdAt: DateTime.now(),
          ),
        );
  }

  // Delete player
  Future<int> deletePlayer(int id) {
    return (_db.delete(_db.players)..where((p) => p.id.equals(id))).go();
  }

  // Check if jersey number exists in team
  Future<bool> isJerseyNumberTaken(
    int teamId,
    int jerseyNumber, {
    int? excludePlayerId,
  }) async {
    final query = _db.select(_db.players)
      ..where(
        (p) => p.teamId.equals(teamId) & p.jerseyNumber.equals(jerseyNumber),
      );

    if (excludePlayerId != null) {
      query.where((p) => p.id.equals(excludePlayerId).not());
    }

    final result = await query.getSingleOrNull();
    return result != null;
  }
}
