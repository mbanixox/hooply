import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooply/features/team/presentation/providers/team_provider.dart';
import 'package:hooply/features/team/presentation/widgets/create_team_dialog.dart';
import 'package:hooply/features/team/presentation/widgets/team_card.dart';
import 'package:hooply/shared/widgets/bottom_nav_scaffold.dart';

class TeamListScreen extends ConsumerWidget {
  const TeamListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teamsAsync = ref.watch(teamsWithPlayerCountProvider);

    return BottomNavScaffold(
      currentIndex: 1,
      appBar: AppBar(
        title: const Text("Teams"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const CreateTeamDialog(),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: teamsAsync.when(
          data: (teams) {
            if (teams.isEmpty) {
              return _buildEmptyState(context);
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: teams.length,
              itemBuilder: (context, index) {
                final teamData = teams[index];
                return TeamCard(
                  team: teamData.team,
                  playerCount: teamData.playerCount,
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 48.0, color: Colors.red),
                const SizedBox(height: 16.0),
                Text("Error loading teams: $error"),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () => ref.invalidate(teamsWithPlayerCountProvider),
                  child: const Text("Retry"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildEmptyState(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.group_outlined, size: 80, color: Colors.grey[400]),
          const SizedBox(height: 24),
          Text(
            "No Teams Yet",
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(color: Colors.grey[600]),
          ),
          const SizedBox(height: 8),
          Text(
            "Create your first team to get started",
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.grey[500]),
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const CreateTeamDialog(),
              );
            },
            icon: const Icon(Icons.add),
            label: const Text("Create Team"),
          ),
        ],
      ),
    ),
  );
}
