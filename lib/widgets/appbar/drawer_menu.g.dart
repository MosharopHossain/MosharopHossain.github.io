// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drawer_menu.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DrawerMenuController)
const drawerMenuControllerProvider = DrawerMenuControllerProvider._();

final class DrawerMenuControllerProvider
    extends $AsyncNotifierProvider<DrawerMenuController, bool> {
  const DrawerMenuControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'drawerMenuControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$drawerMenuControllerHash();

  @$internal
  @override
  DrawerMenuController create() => DrawerMenuController();
}

String _$drawerMenuControllerHash() =>
    r'6cfeac7b1871d8951002739ef848fe0de6bc3962';

abstract class _$DrawerMenuController extends $AsyncNotifier<bool> {
  FutureOr<bool> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool>, bool>,
              AsyncValue<bool>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
