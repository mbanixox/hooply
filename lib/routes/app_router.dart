import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hooply/features/game/presentation/screens/game_setup_screen.dart';
import 'package:hooply/features/game/presentation/screens/game_summary_screen.dart';
import 'package:hooply/features/game/presentation/screens/live_game_screen.dart';
import 'package:hooply/features/home/presentation/screens/history_screen.dart';
import 'package:hooply/features/home/presentation/screens/home_screen.dart';
import 'package:hooply/features/home/presentation/screens/settings_screen.dart';
import 'package:hooply/features/team/presentation/screens/team_detail_screen.dart';
import 'package:hooply/features/team/presentation/screens/team_list_screen.dart';
import 'package:hooply/routes/route_names.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: RouteNames.home,
    routes: [
      GoRoute(
        path: RouteNames.home,
        name: RouteNames.home,
        pageBuilder: (context, state) =>
            NoTransitionPage(child: const HomeScreen()),
      ),
      GoRoute(
        path: RouteNames.teamList,
        name: RouteNames.teamList,
        pageBuilder: (context, state) =>
            NoTransitionPage(child: const TeamListScreen()),
      ),
      GoRoute(
        path: RouteNames.teamDetails,
        name: RouteNames.teamDetails,
        pageBuilder: (context, state) {
          final teamId = int.parse(state.pathParameters['id']!);
          return NoTransitionPage(child: TeamDetailScreen(teamId: teamId));
        },
      ),
      GoRoute(
        path: RouteNames.gameSetup,
        name: RouteNames.gameSetup,
        builder: (context, state) => const GameSetupScreen(),
      ),
      GoRoute(
        path: RouteNames.gameLive,
        name: RouteNames.gameLive,
        builder: (context, state) {
          final id = int.parse(state.pathParameters['id']!);
          return LiveGameScreen(gameId: id);
        },
      ),
      GoRoute(
        path: RouteNames.gameSummary,
        name: RouteNames.gameSummary,
        builder: (context, state) {
          final id = int.parse(state.pathParameters['id']!);
          return GameSummaryScreen(gameId: id);
        },
      ),
      GoRoute(
        path: RouteNames.history,
        name: RouteNames.history,
        pageBuilder: (context, state) =>
            NoTransitionPage(child: const HistoryScreen()),
      ),
      GoRoute(
        path: RouteNames.settings,
        name: RouteNames.settings,
        pageBuilder: (context, state) =>
            NoTransitionPage(child: const SettingsScreen()),
      ),
    ],
  );
});
