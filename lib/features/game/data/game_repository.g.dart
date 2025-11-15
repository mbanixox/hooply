// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(gameRepository)
const gameRepositoryProvider = GameRepositoryProvider._();

final class GameRepositoryProvider
    extends $FunctionalProvider<GameRepository, GameRepository, GameRepository>
    with $Provider<GameRepository> {
  const GameRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gameRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gameRepositoryHash();

  @$internal
  @override
  $ProviderElement<GameRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GameRepository create(Ref ref) {
    return gameRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GameRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GameRepository>(value),
    );
  }
}

String _$gameRepositoryHash() => r'72698f13147e639c242f260fe9a0d0387643a44a';
