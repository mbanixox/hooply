// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_event_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(gameEventRepository)
const gameEventRepositoryProvider = GameEventRepositoryProvider._();

final class GameEventRepositoryProvider
    extends
        $FunctionalProvider<
          GameEventRepository,
          GameEventRepository,
          GameEventRepository
        >
    with $Provider<GameEventRepository> {
  const GameEventRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gameEventRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gameEventRepositoryHash();

  @$internal
  @override
  $ProviderElement<GameEventRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GameEventRepository create(Ref ref) {
    return gameEventRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GameEventRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GameEventRepository>(value),
    );
  }
}

String _$gameEventRepositoryHash() =>
    r'3f70212e517c6d0be3c275c2deb2b0bfb9906eca';
