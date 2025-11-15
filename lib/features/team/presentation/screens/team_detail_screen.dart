import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooply/features/player/presentation/providers/player_provider.dart';
import 'package:hooply/features/player/presentation/widgets/add_player_dialog.dart';
import 'package:hooply/features/player/presentation/widgets/player_list_item.dart';
import 'package:hooply/features/team/presentation/providers/team_provider.dart';

class TeamDetailScreen extends ConsumerWidget {
  final int teamId;

  const TeamDetailScreen({super.key, required this.teamId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teamAsync = ref.watch(teamByIdProvider(teamId));
    final playersAsync = ref.watch(teamPlayersProvider(teamId));

    return Scaffold(
      appBar: AppBar(
        title: teamAsync.when(
          data: (team) => Text(team?.name ?? "Team Detail"),
          loading: () => const CircularProgressIndicator(),
          error: (_, __) => const Text("Error"),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AddPlayerDialog(teamId: teamId),
              );
            },
          ),
        ],
      ),
      body: teamAsync.when(
        data: (team) {
          if (team == null) {
            return _buildEmptyState(context, teamId);
          }

          return playersAsync.when(
            data: (players) {
              if (players.isEmpty) {
                return const Center(
                  child: Text("No players found for this team"),
                );
              }

              return Column(
                children: [
                  // Team Stats Header
                  Container(
                    padding: const EdgeInsets.all(20),
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: 0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _StatItem(
                          icon: Icons.people,
                          label: 'Players',
                          value: '${players.length}',
                        ),
                        _StatItem(
                          icon: Icons.sports_basketball,
                          label: 'Games',
                          value: '0', // TODO: Add game count
                        ),
                      ],
                    ),
                  ),

                  // Players List
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: players.length,
                      itemBuilder: (context, index) {
                        return PlayerListItem(
                          player: players[index],
                          teamId: teamId,
                        );
                      },
                    ),
                  ),
                ],
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: Colors.red),
                  const SizedBox(height: 16),
                  Text('Error loading players: $error'),
                ],
              ),
            ),
          );
        },

        loading: () => const Center(child: CircularProgressIndicator()),

        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 16),
              Text("Error loading team: $error"),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AddPlayerDialog(teamId: teamId),
          );
        },
        icon: const Icon(Icons.person_add),
        label: const Text('Add Player'),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, int teamId) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.people_outline, size: 80, color: Colors.grey[400]),
            const SizedBox(height: 24),
            Text(
              'No Players Yet',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(color: Colors.grey[600]),
            ),
            const SizedBox(height: 8),
            Text(
              'Add players to build your roster',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey[500]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AddPlayerDialog(teamId: teamId),
                );
              },
              icon: const Icon(Icons.person_add),
              label: const Text('Add Player'),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _StatItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 32, color: Theme.of(context).colorScheme.primary),
        const SizedBox(height: 8),
        Text(
          value,
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
        ),
      ],
    );
  }
}
