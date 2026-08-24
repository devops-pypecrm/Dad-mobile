// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$accountDetailHash() => r'e7d8a6609a2931af445dde9d6d9aae84ec7a2238';

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

/// See also [accountDetail].
@ProviderFor(accountDetail)
const accountDetailProvider = AccountDetailFamily();

/// See also [accountDetail].
class AccountDetailFamily extends Family<AsyncValue<Account>> {
  /// See also [accountDetail].
  const AccountDetailFamily();

  /// See also [accountDetail].
  AccountDetailProvider call(String id) {
    return AccountDetailProvider(id);
  }

  @override
  AccountDetailProvider getProviderOverride(
    covariant AccountDetailProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'accountDetailProvider';
}

/// See also [accountDetail].
class AccountDetailProvider extends AutoDisposeFutureProvider<Account> {
  /// See also [accountDetail].
  AccountDetailProvider(String id)
    : this._internal(
        (ref) => accountDetail(ref as AccountDetailRef, id),
        from: accountDetailProvider,
        name: r'accountDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$accountDetailHash,
        dependencies: AccountDetailFamily._dependencies,
        allTransitiveDependencies:
            AccountDetailFamily._allTransitiveDependencies,
        id: id,
      );

  AccountDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<Account> Function(AccountDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AccountDetailProvider._internal(
        (ref) => create(ref as AccountDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Account> createElement() {
    return _AccountDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AccountDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AccountDetailRef on AutoDisposeFutureProviderRef<Account> {
  /// The parameter `id` of this provider.
  String get id;
}

class _AccountDetailProviderElement
    extends AutoDisposeFutureProviderElement<Account>
    with AccountDetailRef {
  _AccountDetailProviderElement(super.provider);

  @override
  String get id => (origin as AccountDetailProvider).id;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
