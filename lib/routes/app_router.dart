import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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
        path: '/teams/:id',
        name: RouteNames.teamDetails,
        pageBuilder: (context, state) {
          final teamId = int.parse(state.pathParameters['id']!);
          return NoTransitionPage(child: TeamDetailScreen(teamId: teamId));
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
