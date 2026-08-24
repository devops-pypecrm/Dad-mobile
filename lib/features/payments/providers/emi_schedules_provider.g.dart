// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emi_schedules_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$emiSchedulesHash() => r'68c23382c8bc0ffc68b744c8b36de6f64cb70d00';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$EmiSchedules
    extends BuildlessAutoDisposeAsyncNotifier<List<EmiScheduleSummary>> {
  late final String status;

  FutureOr<List<EmiScheduleSummary>> build({String status = 'active'});
}

/// See also [EmiSchedules].
@ProviderFor(EmiSchedules)
const emiSchedulesProvider = EmiSchedulesFamily();

/// See also [EmiSchedules].
class EmiSchedulesFamily extends Family<AsyncValue<List<EmiScheduleSummary>>> {
  /// See also [EmiSchedules].
  const EmiSchedulesFamily();

  /// See also [EmiSchedules].
  EmiSchedulesProvider call({String status = 'active'}) {
    return EmiSchedulesProvider(status: status);
  }

  @override
  EmiSchedulesProvider getProviderOverride(
    covariant EmiSchedulesProvider provider,
  ) {
    return call(status: provider.status);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'emiSchedulesProvider';
}

/// See also [EmiSchedules].
class EmiSchedulesProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          EmiSchedules,
          List<EmiScheduleSummary>
        > {
  /// See also [EmiSchedules].
  EmiSchedulesProvider({String status = 'active'})
    : this._internal(
        () => EmiSchedules()..status = status,
        from: emiSchedulesProvider,
        name: r'emiSchedulesProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$emiSchedulesHash,
        dependencies: EmiSchedulesFamily._dependencies,
        allTransitiveDependencies:
            EmiSchedulesFamily._allTransitiveDependencies,
        status: status,
      );

  EmiSchedulesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.status,
  }) : super.internal();

  final String status;

  @override
  FutureOr<List<EmiScheduleSummary>> runNotifierBuild(
    covariant EmiSchedules notifier,
  ) {
    return notifier.build(status: status);
  }

  @override
  Override overrideWith(EmiSchedules Function() create) {
    return ProviderOverride(
      origin: this,
      override: EmiSchedulesProvider._internal(
        () => create()..status = status,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        status: status,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<
    EmiSchedules,
    List<EmiScheduleSummary>
  >
  createElement() {
    return _EmiSchedulesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EmiSchedulesProvider && other.status == status;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, status.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin EmiSchedulesRef
    on AutoDisposeAsyncNotifierProviderRef<List<EmiScheduleSummary>> {
  /// The parameter `status` of this provider.
  String get status;
}

class _EmiSchedulesProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          EmiSchedules,
          List<EmiScheduleSummary>
        >
    with EmiSchedulesRef {
  _EmiSchedulesProviderElement(super.provider);

  @override
  String get status => (origin as EmiSchedulesProvider).status;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
