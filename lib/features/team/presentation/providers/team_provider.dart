import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooply/core/database/app_database.dart';
import 'package:hooply/features/team/data/team_repository.dart';

// Provider to watch all teams with real-time updates
final teamsProvider = StreamProvider<List<Team>>((ref) {
  final repository = ref.watch(teamRepositoryProvider);
  return repository.watchAllTeams();
});

// Provider to get teams with player counts
final teamsWithPlayerCountProvider = StreamProvider<List<TeamWithPlayerCount>>((
  ref,
) {
  final repository = ref.watch(teamRepositoryProvider);
  return repository.watchTeamsWithPlayerCount();
});

// Provider family to get a specific team by ID
final teamByIdProvider = FutureProvider.family<Team?, int>((ref, id) {
  final repository = ref.watch(teamRepositoryProvider);
  return repository.getTeamById(id);
});
