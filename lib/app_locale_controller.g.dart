// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_locale_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppLocaleController)
const appLocaleControllerProvider = AppLocaleControllerProvider._();

final class AppLocaleControllerProvider
    extends $AsyncNotifierProvider<AppLocaleController, String> {
  const AppLocaleControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appLocaleControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appLocaleControllerHash();

  @$internal
  @override
  AppLocaleController create() => AppLocaleController();
}

String _$appLocaleControllerHash() =>
    r'76671ed7788d8740c12a1c9d65bb4202aad004a9';

abstract class _$AppLocaleController extends $AsyncNotifier<String> {
  FutureOr<String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<String>, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<String>, String>,
              AsyncValue<String>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
