import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooply/core/theme/app_theme.dart';
import 'package:hooply/core/theme/theme_provider.dart' as theme_provider;

import 'routes/app_router.dart';

class HooplyApp extends ConsumerWidget {
  const HooplyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final themeModeAsync = ref.watch(theme_provider.themeModeProvider);

    final themeMode = themeModeAsync.when(
      data: (mode) => mode,
      loading: () => ThemeMode.dark,
      error: (_, __) => ThemeMode.dark,
    );

    return MaterialApp.router(
      title: 'Hooply',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      routerConfig: router,
    );
  }
}
