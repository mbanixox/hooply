import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hooply/features/home/presentation/screens/home_screen.dart';
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
    ],
  );
});
