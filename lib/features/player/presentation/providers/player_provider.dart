import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooply/core/database/app_database.dart';
import 'package:hooply/features/player/data/player_repository.dart';

// Watch all players for a team
final teamPlayersProvider = StreamProvider.family<List<Player>, int>((
  ref,
  teamId,
) {
  final repository = ref.watch(playerRepositoryProvider);
  return repository.watchTeamPlayers(teamId);
});

// Get single player
final playerProvider = FutureProvider.family<Player?, int>((ref, id) {
  final repository = ref.watch(playerRepositoryProvider);
  return repository.getPlayer(id);
});
