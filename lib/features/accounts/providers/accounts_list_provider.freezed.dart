// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accounts_list_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AccountsListState {
  List<Account> get accounts => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get pages => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;
  String? get search => throw _privateConstructorUsedError;

  /// Create a copy of AccountsListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountsListStateCopyWith<AccountsListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountsListStateCopyWith<$Res> {
  factory $AccountsListStateCopyWith(
    AccountsListState value,
    $Res Function(AccountsListState) then,
  ) = _$AccountsListStateCopyWithImpl<$Res, AccountsListState>;
  @useResult
  $Res call({
    List<Account> accounts,
    int page,
    int pages,
    bool isLoadingMore,
    String? search,
  });
}

/// @nodoc
class _$AccountsListStateCopyWithImpl<$Res, $Val extends AccountsListState>
    implements $AccountsListStateCopyWith<$Res> {
  _$AccountsListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountsListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accounts = null,
    Object? page = null,
    Object? pages = null,
    Object? isLoadingMore = null,
    Object? search = freezed,
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
            isLoadingMore: null == isLoadingMore
                ? _value.isLoadingMore
                : isLoadingMore // ignore: cast_nullable_to_non_nullable
                      as bool,
            search: freezed == search
                ? _value.search
                : search // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AccountsListStateImplCopyWith<$Res>
    implements $AccountsListStateCopyWith<$Res> {
  factory _$$AccountsListStateImplCopyWith(
    _$AccountsListStateImpl value,
    $Res Function(_$AccountsListStateImpl) then,
  ) = __$$AccountsListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<Account> accounts,
    int page,
    int pages,
    bool isLoadingMore,
    String? search,
  });
}

/// @nodoc
class __$$AccountsListStateImplCopyWithImpl<$Res>
    extends _$AccountsListStateCopyWithImpl<$Res, _$AccountsListStateImpl>
    implements _$$AccountsListStateImplCopyWith<$Res> {
  __$$AccountsListStateImplCopyWithImpl(
    _$AccountsListStateImpl _value,
    $Res Function(_$AccountsListStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AccountsListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accounts = null,
    Object? page = null,
    Object? pages = null,
    Object? isLoadingMore = null,
    Object? search = freezed,
  }) {
    return _then(
      _$AccountsListStateImpl(
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
        isLoadingMore: null == isLoadingMore
            ? _value.isLoadingMore
            : isLoadingMore // ignore: cast_nullable_to_non_nullable
                  as bool,
        search: freezed == search
            ? _value.search
            : search // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$AccountsListStateImpl extends _AccountsListState {
  const _$AccountsListStateImpl({
    final List<Account> accounts = const <Account>[],
    this.page = 1,
    this.pages = 1,
    this.isLoadingMore = false,
    this.search,
  }) : _accounts = accounts,
       super._();

  final List<Account> _accounts;
  @override
  @JsonKey()
  List<Account> get accounts {
    if (_accounts is EqualUnmodifiableListView) return _accounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accounts);
  }

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int pages;
  @override
  @JsonKey()
  final bool isLoadingMore;
  @override
  final String? search;

  @override
  String toString() {
    return 'AccountsListState(accounts: $accounts, page: $page, pages: $pages, isLoadingMore: $isLoadingMore, search: $search)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountsListStateImpl &&
            const DeepCollectionEquality().equals(other._accounts, _accounts) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.search, search) || other.search == search));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_accounts),
    page,
    pages,
    isLoadingMore,
    search,
  );

  /// Create a copy of AccountsListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountsListStateImplCopyWith<_$AccountsListStateImpl> get copyWith =>
      __$$AccountsListStateImplCopyWithImpl<_$AccountsListStateImpl>(
        this,
        _$identity,
      );
}

abstract class _AccountsListState extends AccountsListState {
  const factory _AccountsListState({
    final List<Account> accounts,
    final int page,
    final int pages,
    final bool isLoadingMore,
    final String? search,
  }) = _$AccountsListStateImpl;
  const _AccountsListState._() : super._();

  @override
  List<Account> get accounts;
  @override
  int get page;
  @override
  int get pages;
  @override
  bool get isLoadingMore;
  @override
  String? get search;

  /// Create a copy of AccountsListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountsListStateImplCopyWith<_$AccountsListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
