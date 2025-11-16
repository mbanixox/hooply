import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooply/core/database/app_database.dart';
import 'package:hooply/features/player/presentation/providers/player_provider.dart';

class PlayerOnCourtCard extends ConsumerWidget {
  final int gameId;
  final PlayerGameStat stat;
  final bool isSelected;
  final VoidCallback onTap;

  const PlayerOnCourtCard({
    super.key,
    required this.gameId,
    required this.stat,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerAsync = ref.watch(playerProvider(stat.playerId));

    return playerAsync.when(
      data: (player) {
        if (player == null) return const SizedBox();

        final points =
            (stat.twoPointMade * 2) +
            (stat.threePointMade * 3) +
            stat.freeThrowMade;
        final totalRebounds = stat.offensiveRebounds + stat.defensiveRebounds;

        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          color: isSelected
              ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.1)
              : null,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  // Jersey Number
                  CircleAvatar(
                    backgroundColor: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey,
                    child: Text(
                      '${player.jerseyNumber}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Player Name
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          player.name,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          player.position,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),

                  // Quick Stats
                  _StatChip(label: 'PTS', value: points),
                  const SizedBox(width: 8),
                  _StatChip(label: 'REB', value: totalRebounds),
                  const SizedBox(width: 8),
                  _StatChip(label: 'AST', value: stat.assists),
                ],
              ),
            ),
          ),
        );
      },
      loading: () => const SizedBox(
        height: 60,
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (_, __) => const SizedBox(),
    );
  }
}

class _StatChip extends StatelessWidget {
  final String label;
  final int value;

  const _StatChip({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$value',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.grey[600],
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
