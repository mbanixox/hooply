import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hooply/core/constants/app_constants.dart';
import 'package:hooply/core/database/app_database.dart';
import 'package:hooply/features/game/presentation/providers/game_setup_provider.dart';
import 'package:hooply/features/player/presentation/providers/player_provider.dart';
import 'package:hooply/features/team/presentation/providers/team_provider.dart';
import 'package:hooply/routes/route_names.dart';

class GameSetupScreen extends ConsumerStatefulWidget {
  const GameSetupScreen({super.key});

  @override
  ConsumerState<GameSetupScreen> createState() => _GameSetupScreenState();
}

class _GameSetupScreenState extends ConsumerState<GameSetupScreen> {
  Team? _selectedTeam;
  final Set<int> _selectedPlayers = {};
  final _opponentController = TextEditingController();
  int _step = 0;

  /*
    The game setup page has two main steps:
      0 - Select Team
      1 - Select Starting Lineup
  */

  @override
  void dispose() {
    _opponentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_step == 0 ? 'Select Team' : 'Select Starting Lineup'),
      ),
      body: _step == 0 ? _buildTeamSelection() : _buildLineupSelection(),
    );
  }

  Widget _buildTeamSelection() {
    final teamsAsync = ref.watch(teamsProvider);

    return teamsAsync.when(
      data: (teams) {
        if (teams.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.group_outlined, size: 80, color: Colors.grey),
                const SizedBox(height: 16),
                const Text('No teams available'),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () => context.go(RouteNames.teamList),
                  child: const Text('Create a Team'),
                ),
              ],
            ),
          );
        }

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: teams.length,
                itemBuilder: (context, index) {
                  final team = teams[index];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        child: const Icon(
                          Icons.sports_basketball,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(team.name),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        setState(() {
                          _selectedTeam = team;
                          _step = 1;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );
  }

  Widget _buildLineupSelection() {
    if (_selectedTeam == null) return const SizedBox();

    final playersAsync = ref.watch(teamPlayersProvider(_selectedTeam!.id));

    return playersAsync.when(
      data: (players) {
        if (players.length < AppConstants.playersOnCourt) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.people_outline,
                    size: 80,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Need at least ${AppConstants.playersOnCourt} players',
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Current: ${players.length} player${players.length == 1 ? '' : 's'}',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => context.go('/teams/${_selectedTeam!.id}'),
                    child: const Text('Add Players'),
                  ),
                ],
              ),
            ),
          );
        }

        return Column(
          children: [
            // Opponent Name Input
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _opponentController,
                decoration: const InputDecoration(
                  labelText: 'Opponent Name (Optional)',
                  hintText: 'e.g., Warriors, Scrimmage',
                  prefixIcon: Icon(Icons.group),
                ),
                textCapitalization: TextCapitalization.words,
              ),
            ),

            // Selection Counter
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select ${AppConstants.playersOnCourt} players to start',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    '${_selectedPlayers.length}/${AppConstants.playersOnCourt}',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Player Selection
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: players.length,
                itemBuilder: (context, index) {
                  final player = players[index];
                  final isSelected = _selectedPlayers.contains(player.id);

                  return Card(
                    color: isSelected
                        ? Theme.of(
                            context,
                          ).colorScheme.primary.withValues(alpha: 0.1)
                        : null,
                    child: CheckboxListTile(
                      value: isSelected,
                      onChanged: (value) {
                        setState(() {
                          if (value == true) {
                            if (_selectedPlayers.length <
                                AppConstants.playersOnCourt) {
                              _selectedPlayers.add(player.id);
                            }
                          } else {
                            _selectedPlayers.remove(player.id);
                          }
                        });
                      },
                      secondary: CircleAvatar(
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
                      title: Text(player.name),
                      subtitle: Text(player.position),
                    ),
                  );
                },
              ),
            ),

            // Start Game Button
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed:
                        _selectedPlayers.length == AppConstants.playersOnCourt
                        ? () => _startGame(players)
                        : null,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                    ),
                    child: Text(
                      'Start Game',
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );
  }

  Future<void> _startGame(List<Player> allPlayers) async {
    if (_selectedTeam == null) return;

    try {
      final gameId = await ref
          .read(gameSetupProvider.notifier)
          .createGame(
            teamId: _selectedTeam!.id,
            opponentName: _opponentController.text.trim().isEmpty
                ? 'Practice'
                : _opponentController.text.trim(),
            selectedPlayerIds: _selectedPlayers.toList(),
            allPlayers: allPlayers,
          );

      if (mounted) {
        context.go('/game/live/$gameId');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error starting game: $e')));
      }
    }
  }
}
