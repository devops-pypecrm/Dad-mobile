// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkin_history_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CheckInHistoryState {
  List<CheckIn> get items => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  String get sortOrder => throw _privateConstructorUsedError;
  bool get isLoadingPage => throw _privateConstructorUsedError;

  /// Create a copy of CheckInHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckInHistoryStateCopyWith<CheckInHistoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckInHistoryStateCopyWith<$Res> {
  factory $CheckInHistoryStateCopyWith(
    CheckInHistoryState value,
    $Res Function(CheckInHistoryState) then,
  ) = _$CheckInHistoryStateCopyWithImpl<$Res, CheckInHistoryState>;
  @useResult
  $Res call({
    List<CheckIn> items,
    int page,
    String sortOrder,
    bool isLoadingPage,
  });
}

/// @nodoc
class _$CheckInHistoryStateCopyWithImpl<$Res, $Val extends CheckInHistoryState>
    implements $CheckInHistoryStateCopyWith<$Res> {
  _$CheckInHistoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckInHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? page = null,
    Object? sortOrder = null,
    Object? isLoadingPage = null,
  }) {
    return _then(
      _value.copyWith(
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<CheckIn>,
            page: null == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                      as int,
            sortOrder: null == sortOrder
                ? _value.sortOrder
                : sortOrder // ignore: cast_nullable_to_non_nullable
                      as String,
            isLoadingPage: null == isLoadingPage
                ? _value.isLoadingPage
                : isLoadingPage // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CheckInHistoryStateImplCopyWith<$Res>
    implements $CheckInHistoryStateCopyWith<$Res> {
  factory _$$CheckInHistoryStateImplCopyWith(
    _$CheckInHistoryStateImpl value,
    $Res Function(_$CheckInHistoryStateImpl) then,
  ) = __$$CheckInHistoryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<CheckIn> items,
    int page,
    String sortOrder,
    bool isLoadingPage,
  });
}

/// @nodoc
class __$$CheckInHistoryStateImplCopyWithImpl<$Res>
    extends _$CheckInHistoryStateCopyWithImpl<$Res, _$CheckInHistoryStateImpl>
    implements _$$CheckInHistoryStateImplCopyWith<$Res> {
  __$$CheckInHistoryStateImplCopyWithImpl(
    _$CheckInHistoryStateImpl _value,
    $Res Function(_$CheckInHistoryStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckInHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? page = null,
    Object? sortOrder = null,
    Object? isLoadingPage = null,
  }) {
    return _then(
      _$CheckInHistoryStateImpl(
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<CheckIn>,
        page: null == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int,
        sortOrder: null == sortOrder
            ? _value.sortOrder
            : sortOrder // ignore: cast_nullable_to_non_nullable
                  as String,
        isLoadingPage: null == isLoadingPage
            ? _value.isLoadingPage
            : isLoadingPage // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$CheckInHistoryStateImpl extends _CheckInHistoryState {
  const _$CheckInHistoryStateImpl({
    final List<CheckIn> items = const <CheckIn>[],
    this.page = 1,
    this.sortOrder = 'desc',
    this.isLoadingPage = false,
  }) : _items = items,
       super._();

  final List<CheckIn> _items;
  @override
  @JsonKey()
  List<CheckIn> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final String sortOrder;
  @override
  @JsonKey()
  final bool isLoadingPage;

  @override
  String toString() {
    return 'CheckInHistoryState(items: $items, page: $page, sortOrder: $sortOrder, isLoadingPage: $isLoadingPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckInHistoryStateImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.isLoadingPage, isLoadingPage) ||
                other.isLoadingPage == isLoadingPage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_items),
    page,
    sortOrder,
    isLoadingPage,
  );

  /// Create a copy of CheckInHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckInHistoryStateImplCopyWith<_$CheckInHistoryStateImpl> get copyWith =>
      __$$CheckInHistoryStateImplCopyWithImpl<_$CheckInHistoryStateImpl>(
        this,
        _$identity,
      );
}

abstract class _CheckInHistoryState extends CheckInHistoryState {
  const factory _CheckInHistoryState({
    final List<CheckIn> items,
    final int page,
    final String sortOrder,
    final bool isLoadingPage,
  }) = _$CheckInHistoryStateImpl;
  const _CheckInHistoryState._() : super._();

  @override
  List<CheckIn> get items;
  @override
  int get page;
  @override
  String get sortOrder;
  @override
  bool get isLoadingPage;

  /// Create a copy of CheckInHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckInHistoryStateImplCopyWith<_$CheckInHistoryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
