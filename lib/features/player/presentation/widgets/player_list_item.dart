import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooply/core/constants/app_constants.dart';
import 'package:hooply/core/database/app_database.dart';
import 'package:hooply/features/player/data/player_repository.dart';
import 'package:hooply/features/player/presentation/providers/player_provider.dart';
import 'package:hooply/features/player/presentation/widgets/edit_player_dialog.dart';

class PlayerListItem extends ConsumerWidget {
  final Player player;
  final int teamId;

  const PlayerListItem({super.key, required this.player, required this.teamId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Text(
            '${player.jerseyNumber}',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          player.name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(
          '${player.position} - ${AppConstants.positionNames[player.position]}',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) async {
            if (value == 'edit') {
              showDialog(
                context: context,
                builder: (context) =>
                    EditPlayerDialog(player: player, teamId: teamId),
              );
            } else if (value == 'delete') {
              final confirm = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Delete Player'),
                  content: Text(
                    'Are you sure you want to remove ${player.name} from the team?',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      style: TextButton.styleFrom(foregroundColor: Colors.red),
                      child: const Text('Delete'),
                    ),
                  ],
                ),
              );

              if (confirm == true && context.mounted) {
                await ref
                    .read(playerRepositoryProvider)
                    .deletePlayer(player.id);
                ref.invalidate(teamPlayersProvider(teamId));
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${player.name} removed')),
                  );
                }
              }
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'edit',
              child: Row(
                children: [Icon(Icons.edit), SizedBox(width: 8), Text('Edit')],
              ),
            ),
            const PopupMenuItem(
              value: 'delete',
              child: Row(
                children: [
                  Icon(Icons.delete, color: Colors.red),
                  SizedBox(width: 8),
                  Text('Delete', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
