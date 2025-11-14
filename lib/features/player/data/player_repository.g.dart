// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(playerRepository)
const playerRepositoryProvider = PlayerRepositoryProvider._();

final class PlayerRepositoryProvider
    extends
        $FunctionalProvider<
          PlayerRepository,
          PlayerRepository,
          PlayerRepository
        >
    with $Provider<PlayerRepository> {
  const PlayerRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'playerRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$playerRepositoryHash();

  @$internal
  @override
  $ProviderElement<PlayerRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PlayerRepository create(Ref ref) {
    return playerRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlayerRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PlayerRepository>(value),
    );
  }
}

String _$playerRepositoryHash() => r'7c36996c4059f094e528b8b56a882a801630853f';
