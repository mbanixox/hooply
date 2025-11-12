// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ThemeMode)
const themeModeProvider = ThemeModeProvider._();

final class ThemeModeProvider
    extends $AsyncNotifierProvider<ThemeMode, material.ThemeMode> {
  const ThemeModeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themeModeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themeModeHash();

  @$internal
  @override
  ThemeMode create() => ThemeMode();
}

String _$themeModeHash() => r'6744481addd805197d7cb746620f9a20f88b5894';

abstract class _$ThemeMode extends $AsyncNotifier<material.ThemeMode> {
  FutureOr<material.ThemeMode> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<material.ThemeMode>, material.ThemeMode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<material.ThemeMode>, material.ThemeMode>,
              AsyncValue<material.ThemeMode>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
