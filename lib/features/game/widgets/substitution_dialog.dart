import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooply/core/database/app_database.dart';
import 'package:hooply/features/game/presentation/providers/game_controller_provider.dart';
import 'package:hooply/features/game/widgets/player_bench_card.dart';
import 'package:hooply/features/player/presentation/providers/player_provider.dart';

class SubstitutionDialog extends ConsumerStatefulWidget {
  final int gameId;
  final List<PlayerGameStat> onCourtStats;
  final List<PlayerGameStat> benchStats;

  const SubstitutionDialog({
    super.key,
    required this.gameId,
    required this.onCourtStats,
    required this.benchStats,
  });

  @override
  ConsumerState<SubstitutionDialog> createState() => _SubstitutionDialogState();
}

class _SubstitutionDialogState extends ConsumerState<SubstitutionDialog> {
  int? _playerOutId;
  int? _playerInId;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Substitution'),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Player Out Section
            Text(
              'Player Out (On Court)',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 8),
            // Constrain height for scrolling if many players
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.3,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: widget.onCourtStats.map((stat) {
                    return _PlayerSelectTile(
                      playerId: stat.playerId,
                      isSelected: _playerOutId == stat.playerId,
                      onTap: () {
                        setState(() => _playerOutId = stat.playerId);
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Player In Section (Horizontal)
            Text(
              'Player In (Bench)',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.benchStats.length,
                itemBuilder: (context, index) {
                  final stat = widget.benchStats[index];
                  final isSelected = _playerInId == stat.playerId;
                  return GestureDetector(
                    onTap: () {
                      setState(() => _playerInId = stat.playerId);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Theme.of(
                                context,
                              ).colorScheme.primary.withValues(alpha: 0.2)
                            : null,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: PlayerBenchCard(
                        gameId: widget.gameId,
                        stat: stat,
                        isSelected: isSelected,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _playerOutId != null && _playerInId != null
              ? () => _confirmSubstitution()
              : null,
          child: const Text('Substitute'),
        ),
      ],
    );
  }

  Future<void> _confirmSubstitution() async {
    if (_playerOutId == null || _playerInId == null) return;

    await ref
        .read(gameControllerProvider.notifier)
        .substitutePlayer(
          gameId: widget.gameId,
          playerInId: _playerInId!,
          playerOutId: _playerOutId!,
        );

    if (mounted) {
      Navigator.pop(context);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Substitution complete')));
    }
  }
}

class _PlayerSelectTile extends ConsumerWidget {
  final int playerId;
  final bool isSelected;
  final VoidCallback onTap;

  const _PlayerSelectTile({
    required this.playerId,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerAsync = ref.watch(playerProvider(playerId));

    return playerAsync.when(
      data: (player) {
        if (player == null) return const SizedBox();

        return Card(
          color: isSelected
              ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.2)
              : null,
          child: ListTile(
            dense: true,
            leading: CircleAvatar(
              backgroundColor: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey,
              child: Text(
                '${player.jerseyNumber}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
            title: Text(player.name, style: const TextStyle(fontSize: 14)),
            subtitle: Text(
              player.position,
              style: const TextStyle(fontSize: 12),
            ),
            trailing: isSelected
                ? Icon(
                    Icons.check_circle,
                    color: Theme.of(context).colorScheme.primary,
                  )
                : null,
            onTap: onTap,
          ),
        );
      },
      loading: () => const SizedBox(height: 50),
      error: (_, __) => const SizedBox(),
    );
  }
}
