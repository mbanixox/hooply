import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooply/core/database/app_database.dart';
import 'package:hooply/features/player/presentation/providers/player_provider.dart';

class PlayerBenchCard extends ConsumerWidget {
  final int gameId;
  final PlayerGameStat stat;
  final bool isSelected;

  const PlayerBenchCard({
    super.key,
    required this.gameId,
    required this.stat,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerAsync = ref.watch(playerProvider(stat.playerId));

    return playerAsync.when(
      data: (player) {
        if (player == null) return const SizedBox();

        return Card(
          color: isSelected
              ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.3)
              : null,
          child: Container(
            width: 80,
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey[400],
                  child: Text(
                    '${player.jerseyNumber}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  player.name.split(' ').last,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: isSelected ? FontWeight.bold : null,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                if (isSelected) ...[
                  const SizedBox(height: 2),
                  Icon(
                    Icons.check_circle,
                    size: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ],
              ],
            ),
          ),
        );
      },
      loading: () => const SizedBox(width: 80),
      error: (_, __) => const SizedBox(width: 80),
    );
  }
}
