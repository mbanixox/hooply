import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooply/core/database/app_database.dart';
import 'package:hooply/features/team/data/team_repository.dart';
import 'package:hooply/features/team/presentation/providers/team_provider.dart';
import 'package:hooply/features/team/presentation/widgets/edit_team_dialog.dart';

class TeamCard extends ConsumerWidget {
  final Team team;
  final int playerCount;

  const TeamCard({super.key, required this.team, required this.playerCount});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      child: InkWell(
        onTap: () {
          // TODO: Navigate to team detail
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Opening ${team.name}")));
        },
        borderRadius: BorderRadius.circular(16.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.sports_basketball,
                  color: Theme.of(context).colorScheme.primary,
                  size: 28.0,
                ),
              ),

              const SizedBox(width: 16.0),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      team.name,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      "$playerCount ${playerCount == 1 ? 'player' : 'players'}",
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),

              // Actions
              PopupMenuButton<String>(
                onSelected: (value) async {
                  if (value == "edit") {
                    showDialog(
                      context: context,
                      builder: (context) => EditTeamDialog(team: team),
                    );
                  } else if (value == "delete") {
                    final confirm = await showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text(
                          "Delete Team",
                          style: TextStyle(
                            fontSize: 21.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        content: Text(
                          "Are you sure you want to delete '${team.name}'? This will also delete all players and games associated with this team.",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, false),
                            child: const Text("Cancel"),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.red,
                            ),
                            onPressed: () => Navigator.pop(context, true),
                            child: const Text("Delete"),
                          ),
                        ],
                      ),
                    );

                    if (confirm == true && context.mounted) {
                      await ref
                          .read(teamRepositoryProvider)
                          .deleteTeam(team.id);

                      // Invalidate the provider to refresh the list
                      ref.invalidate(teamsWithPlayerCountProvider);

                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Team '${team.name}' deleted."),
                          ),
                        );
                      }
                    }
                  }
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: "edit",
                    child: Row(
                      children: [
                        Icon(Icons.edit),
                        SizedBox(width: 8.0),
                        Text("Edit"),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: "delete",
                    child: Row(
                      children: [
                        Icon(Icons.delete, color: Colors.red),
                        SizedBox(width: 8.0),
                        Text("Delete", style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
