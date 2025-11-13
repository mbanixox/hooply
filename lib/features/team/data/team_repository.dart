import 'package:drift/drift.dart';
import 'package:hooply/core/database/app_database.dart';
import 'package:hooply/core/providers/database_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'team_repository.g.dart';

@riverpod
TeamRepository teamRepository(Ref ref) {
  final database = ref.watch(databaseProvider);
  return TeamRepository(database);
}

class TeamRepository {
  final AppDatabase _db;

  TeamRepository(this._db);

  // Get all teams (stream - real-time updates)
  Stream<List<Team>> watchAllTeams() {
    return _db.select(_db.teams).watch();
  }

  // Get all teams (future - one-time fetch)
  Future<List<Team>> getAllTeams() {
    return _db.select(_db.teams).get();
  }

  // Get team by ID
  Future<Team?> getTeamById(int id) {
    return (_db.select(
      _db.teams,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  // Create a new team
  Future<int> createTeam(String name) {
    return _db
        .into(_db.teams)
        .insert(TeamsCompanion.insert(name: name, createdAt: DateTime.now()));
  }

  // Update a team
  Future<bool> updateTeam(int id, String name) {
    return _db
        .update(_db.teams)
        .replace(Team(id: id, name: name, createdAt: DateTime.now()));
  }

  // Delete a team
  Future<int> deleteTeam(int id) {
    return (_db.delete(_db.teams)..where((t) => t.id.equals(id))).go();
  }

  // Get team with player count
  Future<List<TeamWithPlayerCount>> getTeamsWithPlayerCount() async {
    final query = _db.select(_db.teams).join([
      leftOuterJoin(_db.players, _db.players.teamId.equalsExp(_db.teams.id)),
    ]);

    final results = await query.get();

    final teamMap = <int, TeamWithPlayerCount>{};

    for (final row in results) {
      final team = row.readTable(_db.teams);
      final player = row.readTableOrNull(_db.players);

      if (!teamMap.containsKey(team.id)) {
        teamMap[team.id] = TeamWithPlayerCount(team: team, playerCount: 0);
      }

      if (player != null) {
        teamMap[team.id] = TeamWithPlayerCount(
          team: team,
          playerCount: teamMap[team.id]!.playerCount + 1,
        );
      }
    }

    return teamMap.values.toList();
  }
}

class TeamWithPlayerCount {
  final Team team;
  final int playerCount;

  TeamWithPlayerCount({required this.team, required this.playerCount});
}
