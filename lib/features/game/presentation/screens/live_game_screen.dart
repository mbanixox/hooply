import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hooply/core/database/app_database.dart';
import 'package:hooply/features/game/presentation/providers/game_controller_provider.dart';
import 'package:hooply/features/game/presentation/providers/game_provider.dart';
import 'package:hooply/features/game/widgets/player_on_court_card.dart';
import 'package:hooply/features/game/widgets/substitution_dialog.dart';
import 'package:hooply/features/player/presentation/providers/player_provider.dart';

class LiveGameScreen extends ConsumerStatefulWidget {
  final int gameId;

  const LiveGameScreen({super.key, required this.gameId});

  @override
  ConsumerState<LiveGameScreen> createState() => _LiveGameScreenState();
}

class _LiveGameScreenState extends ConsumerState<LiveGameScreen> {
  int? _selectedPlayerId;
  bool _isStatPanelExpanded = false;

  @override
  Widget build(BuildContext context) {
    final gameAsync = ref.watch(currentGameProvider(widget.gameId));
    final statsAsync = ref.watch(gameStatsProvider(widget.gameId));

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, dynamic result) async {
        if (didPop) return;

        final confirm = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Exit Game?'),
            content: const Text(
              'The game is still in progress. Are you sure you want to exit?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Exit'),
              ),
            ],
          ),
        );

        if (confirm == true && context.mounted) {
          context.go('/');
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: gameAsync.when(
            data: (game) {
              if (game == null) {
                return const Center(child: Text('Game not found'));
              }

              return statsAsync.when(
                data: (allStats) {
                  final onCourtStats = allStats
                      .where((s) => s.isOnCourt)
                      .toList();
                  final benchStats = allStats
                      .where((s) => !s.isOnCourt)
                      .toList();

                  return GestureDetector(
                    onTap: () {
                      if (_isStatPanelExpanded) {
                        setState(() {
                          _isStatPanelExpanded = false;
                        });
                      }
                    },
                    child: Column(
                      children: [
                        // Game Header
                        _buildGameHeader(game),

                        // Players on Court
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'On Court (${onCourtStats.length})',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.swap_horiz),
                                      onPressed:
                                          onCourtStats.isNotEmpty &&
                                              benchStats.isNotEmpty
                                          ? () => _showSubstitutionDialog(
                                              onCourtStats,
                                              benchStats,
                                            )
                                          : null,
                                      tooltip: 'Substitute',
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  itemCount: onCourtStats.length,
                                  itemBuilder: (context, index) {
                                    final stat = onCourtStats[index];
                                    return PlayerOnCourtCard(
                                      gameId: widget.gameId,
                                      stat: stat,
                                      isSelected:
                                          _selectedPlayerId == stat.playerId,
                                      onTap: () {
                                        setState(() {
                                          _selectedPlayerId = stat.playerId;
                                          _isStatPanelExpanded = true;
                                        });
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Stat Buttons (if player selected)
                        if (_selectedPlayerId != null && _isStatPanelExpanded)
                          _buildStatButtons(game),
                      ],
                    ),
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, s) => Center(child: Text('Error: $e')),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, s) => Center(child: Text('Error: $e')),
          ),
        ),
      ),
    );
  }

  Widget _buildGameHeader(Game game) {
    final totalSeconds = game.currentQuarterSeconds;
    final minutes = totalSeconds ~/ 60;
    final seconds = totalSeconds % 60;
    final timeString =
        '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Timer and Quarter
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Q${game.currentQuarter}',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                timeString,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Opponent
          Text(
            'vs ${game.opponentName}',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.white.withValues(alpha: 0.9),
            ),
          ),
          const SizedBox(height: 12),

          // Control Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Timer Control
              ElevatedButton.icon(
                onPressed: () {
                  if (game.isTimerRunning) {
                    ref
                        .read(gameControllerProvider.notifier)
                        .pauseTimer(game.id);
                  } else {
                    ref
                        .read(gameControllerProvider.notifier)
                        .startTimer(game.id);
                  }
                },
                icon: Icon(
                  game.isTimerRunning ? Icons.pause : Icons.play_arrow,
                ),
                label: Text(game.isTimerRunning ? 'Pause' : 'Start'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(width: 12),

              // Undo Button
              OutlinedButton.icon(
                onPressed: () {
                  ref
                      .read(gameControllerProvider.notifier)
                      .undoLastAction(game.id);
                },
                icon: const Icon(Icons.undo),
                label: const Text('Undo'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.white),
                ),
              ),
              const SizedBox(width: 12),

              // End Game Button
              OutlinedButton.icon(
                onPressed: () => _showEndGameDialog(game.id),
                icon: const Icon(Icons.stop),
                label: const Text('End'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatButtons(Game game) {
    final selectedPlayerAsync = _selectedPlayerId != null
        ? ref.watch(playerProvider(_selectedPlayerId!))
        : null;

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Record Stat',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(width: 8),
              if (selectedPlayerAsync != null)
                selectedPlayerAsync.when(
                  data: (player) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 10,
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.primary,
                          child: Text(
                            '${player?.jerseyNumber ?? ""}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          player?.name ?? 'Unknown',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ],
                    ),
                  ),
                  loading: () => const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                  error: (_, __) => const SizedBox(),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _StatButton(
                label: '2PT',
                color: Colors.green,
                onMade: () => _recordStat('2pt_made', true),
                onMissed: () => _recordStat('2pt_made', false),
              ),
              _StatButton(
                label: '3PT',
                color: Colors.blue,
                onMade: () => _recordStat('3pt_made', true),
                onMissed: () => _recordStat('3pt_made', false),
              ),
              _StatButton(
                label: 'FT',
                color: Colors.orange,
                onMade: () => _recordStat('ft_made', true),
                onMissed: () => _recordStat('ft_made', false),
              ),
              _QuickStatButton(
                label: 'AST',
                icon: Icons.sports_handball,
                onPressed: () => _recordStat('assist', true),
              ),
              _QuickStatButton(
                label: 'REB-O',
                icon: Icons.arrow_upward,
                onPressed: () => _recordStat('rebound_off', true),
              ),
              _QuickStatButton(
                label: 'REB-D',
                icon: Icons.arrow_downward,
                onPressed: () => _recordStat('rebound_def', true),
              ),
              _QuickStatButton(
                label: 'BLK',
                icon: Icons.block,
                onPressed: () => _recordStat('block', true),
              ),
              _QuickStatButton(
                label: 'STL',
                icon: Icons.flash_on,
                onPressed: () => _recordStat('steal', true),
              ),
              _QuickStatButton(
                label: 'TO',
                icon: Icons.warning,
                color: Colors.red,
                onPressed: () => _recordStat('turnover', true),
              ),
              _QuickStatButton(
                label: 'FOUL',
                icon: Icons.pan_tool,
                color: Colors.red,
                onPressed: () => _recordStat('foul', true),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _recordStat(String statType, bool isMade) {
    if (_selectedPlayerId == null) return;

    ref
        .read(gameControllerProvider.notifier)
        .recordStat(
          gameId: widget.gameId,
          playerId: _selectedPlayerId!,
          statType: statType,
          isMade: isMade,
        );
  }

  void _showSubstitutionDialog(
    List<PlayerGameStat> onCourt,
    List<PlayerGameStat> bench,
  ) {
    showDialog(
      context: context,
      builder: (context) => SubstitutionDialog(
        gameId: widget.gameId,
        onCourtStats: onCourt,
        benchStats: bench,
      ),
    );
  }

  Future<void> _showEndGameDialog(int gameId) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('End Game?'),
        content: const Text('Are you sure you want to end this game?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('End Game'),
          ),
        ],
      ),
    );

    if (confirm == true && mounted) {
      await ref.read(gameControllerProvider.notifier).endGame(gameId);
      if (mounted) {
        context.go('/');
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Game ended and saved!')));
      }
    }
  }
}

class _StatButton extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onMade;
  final VoidCallback onMissed;

  const _StatButton({
    required this.label,
    required this.color,
    required this.onMade,
    required this.onMissed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onMade,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 4),
        OutlinedButton(
          onPressed: onMissed,
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: color),
            foregroundColor: color,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          ),
          child: const Text('Miss', style: TextStyle(fontSize: 12)),
        ),
      ],
    );
  }
}

class _QuickStatButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color? color;
  final VoidCallback onPressed;

  const _QuickStatButton({
    required this.label,
    required this.icon,
    this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Theme.of(context).colorScheme.secondary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}
