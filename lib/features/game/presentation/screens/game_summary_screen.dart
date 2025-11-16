import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hooply/core/database/app_database.dart';
import 'package:hooply/features/game/data/game_repository.dart';
import 'package:hooply/features/game/data/player_stats_repository.dart';
import 'package:hooply/features/player/presentation/providers/player_provider.dart';
import 'package:hooply/features/team/presentation/providers/team_provider.dart';

class GameSummaryScreen extends ConsumerWidget {
  final int gameId;

  const GameSummaryScreen({super.key, required this.gameId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameAsync = ref.watch(gameRepositoryProvider).getGame(gameId);
    final statsAsync = ref
        .watch(playerStatsRepositoryProvider)
        .getGameStats(gameId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Summary'),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () => context.go('/'),
          ),
        ],
      ),
      body: FutureBuilder(
        future: Future.wait([gameAsync, statsAsync]),
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError || !snapshot.hasData) {
            return const Center(child: Text('Error loading game summary'));
          }

          final game = snapshot.data![0] as Game?;
          final stats = snapshot.data![1] as List<PlayerGameStat>;

          if (game == null) {
            return const Center(child: Text('Game not found'));
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                // Game Header
                _buildGameHeader(context, ref, game),

                // Team Stats
                _buildTeamStats(context, stats),

                // Player Stats Table
                _buildPlayerStatsTable(context, ref, stats),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildGameHeader(BuildContext context, WidgetRef ref, Game game) {
    final teamAsync = ref.watch(teamByIdProvider(game.teamId));

    return Container(
      padding: const EdgeInsets.all(20),
      color: Theme.of(context).colorScheme.primary,
      child: teamAsync.when(
        data: (team) {
          final totalScore = _calculateTeamScore(game);

          return Column(
            children: [
              Text(
                team?.name ?? 'Team',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'vs ${game.opponentName}',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white.withValues(alpha: 0.9),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Final Score',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white.withValues(alpha: 0.8),
                ),
              ),
              Text(
                '$totalScore',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${game.currentQuarter} Quarter${game.currentQuarter > 1 ? 's' : ''}',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white.withValues(alpha: 0.8),
                ),
              ),
            ],
          );
        },
        loading: () => const CircularProgressIndicator(),
        error: (_, __) => const SizedBox(),
      ),
    );
  }

  Widget _buildTeamStats(BuildContext context, List<PlayerGameStat> stats) {
    final teamStats = _calculateTeamStats(stats);

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Team Statistics',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _TeamStatCard(
                  label: 'FG%',
                  value: '${teamStats['fgPercentage'].toStringAsFixed(1)}%',
                  subtitle:
                      '${teamStats['fgMade']}/${teamStats['fgAttempted']}',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _TeamStatCard(
                  label: '3PT%',
                  value: '${teamStats['threePercentage'].toStringAsFixed(1)}%',
                  subtitle:
                      '${teamStats['threeMade']}/${teamStats['threeAttempted']}',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _TeamStatCard(
                  label: 'FT%',
                  value: '${teamStats['ftPercentage'].toStringAsFixed(1)}%',
                  subtitle:
                      '${teamStats['ftMade']}/${teamStats['ftAttempted']}',
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _TeamStatCard(
                  label: 'Rebounds',
                  value: '${teamStats['totalRebounds']}',
                  subtitle:
                      'O:${teamStats['offRebounds']} D:${teamStats['defRebounds']}',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _TeamStatCard(
                  label: 'Assists',
                  value: '${teamStats['assists']}',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _TeamStatCard(
                  label: 'Turnovers',
                  value: '${teamStats['turnovers']}',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPlayerStatsTable(
    BuildContext context,
    WidgetRef ref,
    List<PlayerGameStat> stats,
  ) {
    // Sort by points
    final sortedStats = List<PlayerGameStat>.from(stats)
      ..sort((a, b) {
        final aPoints =
            (a.twoPointMade * 2) + (a.threePointMade * 3) + a.freeThrowMade;
        final bPoints =
            (b.twoPointMade * 2) + (b.threePointMade * 3) + b.freeThrowMade;
        return bPoints.compareTo(aPoints);
      });

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Player Statistics',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ...sortedStats.map((stat) => _PlayerStatRow(stat: stat)),
        ],
      ),
    );
  }

  int _calculateTeamScore(Game game) {
    // This is a placeholder - in reality you'd sum from player stats
    return 0; // Will be calculated from stats
  }

  Map<String, dynamic> _calculateTeamStats(List<PlayerGameStat> stats) {
    int fgMade = 0, fgAttempted = 0;
    int threeMade = 0, threeAttempted = 0;
    int ftMade = 0, ftAttempted = 0;
    int offRebounds = 0, defRebounds = 0;
    int assists = 0, turnovers = 0;

    for (final stat in stats) {
      fgMade += stat.twoPointMade + stat.threePointMade;
      fgAttempted += stat.twoPointAttempted + stat.threePointAttempted;
      threeMade += stat.threePointMade;
      threeAttempted += stat.threePointAttempted;
      ftMade += stat.freeThrowMade;
      ftAttempted += stat.freeThrowAttempted;
      offRebounds += stat.offensiveRebounds;
      defRebounds += stat.defensiveRebounds;
      assists += stat.assists;
      turnovers += stat.turnovers;
    }

    return {
      'fgMade': fgMade,
      'fgAttempted': fgAttempted,
      'fgPercentage': fgAttempted > 0 ? (fgMade / fgAttempted * 100) : 0.0,
      'threeMade': threeMade,
      'threeAttempted': threeAttempted,
      'threePercentage': threeAttempted > 0
          ? (threeMade / threeAttempted * 100)
          : 0.0,
      'ftMade': ftMade,
      'ftAttempted': ftAttempted,
      'ftPercentage': ftAttempted > 0 ? (ftMade / ftAttempted * 100) : 0.0,
      'offRebounds': offRebounds,
      'defRebounds': defRebounds,
      'totalRebounds': offRebounds + defRebounds,
      'assists': assists,
      'turnovers': turnovers,
    };
  }
}

class _TeamStatCard extends StatelessWidget {
  final String label;
  final String value;
  final String? subtitle;

  const _TeamStatCard({
    required this.label,
    required this.value,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              label,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 4),
              Text(
                subtitle!,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _PlayerStatRow extends ConsumerWidget {
  final PlayerGameStat stat;

  const _PlayerStatRow({required this.stat});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerAsync = ref.watch(playerProvider(stat.playerId));

    final points =
        (stat.twoPointMade * 2) +
        (stat.threePointMade * 3) +
        stat.freeThrowMade;
    final rebounds = stat.offensiveRebounds + stat.defensiveRebounds;
    final fgPercentage = stat.twoPointAttempted + stat.threePointAttempted > 0
        ? ((stat.twoPointMade + stat.threePointMade) /
              (stat.twoPointAttempted + stat.threePointAttempted) *
              100)
        : 0.0;

    return playerAsync.when(
      data: (player) {
        if (player == null) return const SizedBox();

        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ExpansionTile(
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
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                Text('PTS: $points'),
                const SizedBox(width: 16),
                Text('REB: $rebounds'),
                const SizedBox(width: 16),
                Text('AST: ${stat.assists}'),
              ],
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _StatDetailRow(
                      label: 'Field Goals',
                      value:
                          '${stat.twoPointMade + stat.threePointMade}/${stat.twoPointAttempted + stat.threePointAttempted}',
                      percentage: fgPercentage,
                    ),
                    _StatDetailRow(
                      label: '2-Pointers',
                      value: '${stat.twoPointMade}/${stat.twoPointAttempted}',
                      percentage: stat.twoPointAttempted > 0
                          ? (stat.twoPointMade / stat.twoPointAttempted * 100)
                          : 0.0,
                    ),
                    _StatDetailRow(
                      label: '3-Pointers',
                      value:
                          '${stat.threePointMade}/${stat.threePointAttempted}',
                      percentage: stat.threePointAttempted > 0
                          ? (stat.threePointMade /
                                stat.threePointAttempted *
                                100)
                          : 0.0,
                    ),
                    _StatDetailRow(
                      label: 'Free Throws',
                      value: '${stat.freeThrowMade}/${stat.freeThrowAttempted}',
                      percentage: stat.freeThrowAttempted > 0
                          ? (stat.freeThrowMade / stat.freeThrowAttempted * 100)
                          : 0.0,
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _QuickStat(
                          label: 'REB-O',
                          value: stat.offensiveRebounds,
                        ),
                        _QuickStat(
                          label: 'REB-D',
                          value: stat.defensiveRebounds,
                        ),
                        _QuickStat(label: 'BLK', value: stat.blocks),
                        _QuickStat(label: 'STL', value: stat.steals),
                        _QuickStat(label: 'TO', value: stat.turnovers),
                        _QuickStat(label: 'FOUL', value: stat.fouls),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      loading: () => const SizedBox(height: 60),
      error: (_, __) => const SizedBox(),
    );
  }
}

class _StatDetailRow extends StatelessWidget {
  final String label;
  final String value;
  final double percentage;

  const _StatDetailRow({
    required this.label,
    required this.value,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Row(
            children: [
              Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(width: 8),
              Text(
                '(${percentage.toStringAsFixed(1)}%)',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _QuickStat extends StatelessWidget {
  final String label;
  final int value;

  const _QuickStat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$value',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 10)),
      ],
    );
  }
}
