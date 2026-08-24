// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accounts_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AccountsPage _$AccountsPageFromJson(Map<String, dynamic> json) {
  return _AccountsPage.fromJson(json);
}

/// @nodoc
mixin _$AccountsPage {
  List<Account> get accounts => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get pages => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  /// Serializes this AccountsPage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AccountsPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountsPageCopyWith<AccountsPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountsPageCopyWith<$Res> {
  factory $AccountsPageCopyWith(
    AccountsPage value,
    $Res Function(AccountsPage) then,
  ) = _$AccountsPageCopyWithImpl<$Res, AccountsPage>;
  @useResult
  $Res call({List<Account> accounts, int page, int pages, int total});
}

/// @nodoc
class _$AccountsPageCopyWithImpl<$Res, $Val extends AccountsPage>
    implements $AccountsPageCopyWith<$Res> {
  _$AccountsPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountsPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accounts = null,
    Object? page = null,
    Object? pages = null,
    Object? total = null,
  }) {
    return _then(
      _value.copyWith(
            accounts: null == accounts
                ? _value.accounts
                : accounts // ignore: cast_nullable_to_non_nullable
                      as List<Account>,
            page: null == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                      as int,
            pages: null == pages
                ? _value.pages
                : pages // ignore: cast_nullable_to_non_nullable
                      as int,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AccountsPageImplCopyWith<$Res>
    implements $AccountsPageCopyWith<$Res> {
  factory _$$AccountsPageImplCopyWith(
    _$AccountsPageImpl value,
    $Res Function(_$AccountsPageImpl) then,
  ) = __$$AccountsPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Account> accounts, int page, int pages, int total});
}

/// @nodoc
class __$$AccountsPageImplCopyWithImpl<$Res>
    extends _$AccountsPageCopyWithImpl<$Res, _$AccountsPageImpl>
    implements _$$AccountsPageImplCopyWith<$Res> {
  __$$AccountsPageImplCopyWithImpl(
    _$AccountsPageImpl _value,
    $Res Function(_$AccountsPageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AccountsPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accounts = null,
    Object? page = null,
    Object? pages = null,
    Object? total = null,
  }) {
    return _then(
      _$AccountsPageImpl(
        accounts: null == accounts
            ? _value._accounts
            : accounts // ignore: cast_nullable_to_non_nullable
                  as List<Account>,
        page: null == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int,
        pages: null == pages
            ? _value.pages
            : pages // ignore: cast_nullable_to_non_nullable
                  as int,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountsPageImpl implements _AccountsPage {
  const _$AccountsPageImpl({
    required final List<Account> accounts,
    required this.page,
    required this.pages,
    required this.total,
  }) : _accounts = accounts;

  factory _$AccountsPageImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountsPageImplFromJson(json);

  final List<Account> _accounts;
  @override
  List<Account> get accounts {
    if (_accounts is EqualUnmodifiableListView) return _accounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accounts);
  }

  @override
  final int page;
  @override
  final int pages;
  @override
  final int total;

  @override
  String toString() {
    return 'AccountsPage(accounts: $accounts, page: $page, pages: $pages, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountsPageImpl &&
            const DeepCollectionEquality().equals(other._accounts, _accounts) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_accounts),
    page,
    pages,
    total,
  );

  /// Create a copy of AccountsPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountsPageImplCopyWith<_$AccountsPageImpl> get copyWith =>
      __$$AccountsPageImplCopyWithImpl<_$AccountsPageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountsPageImplToJson(this);
  }
}

abstract class _AccountsPage implements AccountsPage {
  const factory _AccountsPage({
    required final List<Account> accounts,
    required final int page,
    required final int pages,
    required final int total,
  }) = _$AccountsPageImpl;

  factory _AccountsPage.fromJson(Map<String, dynamic> json) =
      _$AccountsPageImpl.fromJson;

  @override
  List<Account> get accounts;
  @override
  int get page;
  @override
  int get pages;
  @override
  int get total;

  /// Create a copy of AccountsPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountsPageImplCopyWith<_$AccountsPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
