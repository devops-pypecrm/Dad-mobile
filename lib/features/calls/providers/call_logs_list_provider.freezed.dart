// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'call_logs_list_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CallLogsListState {
  List<CallLog> get calls => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get pages => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;
  String? get search => throw _privateConstructorUsedError;

  /// Create a copy of CallLogsListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CallLogsListStateCopyWith<CallLogsListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallLogsListStateCopyWith<$Res> {
  factory $CallLogsListStateCopyWith(
    CallLogsListState value,
    $Res Function(CallLogsListState) then,
  ) = _$CallLogsListStateCopyWithImpl<$Res, CallLogsListState>;
  @useResult
  $Res call({
    List<CallLog> calls,
    int page,
    int pages,
    bool isLoadingMore,
    String? search,
  });
}

/// @nodoc
class _$CallLogsListStateCopyWithImpl<$Res, $Val extends CallLogsListState>
    implements $CallLogsListStateCopyWith<$Res> {
  _$CallLogsListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CallLogsListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calls = null,
    Object? page = null,
    Object? pages = null,
    Object? isLoadingMore = null,
    Object? search = freezed,
  }) {
    return _then(
      _value.copyWith(
            calls: null == calls
                ? _value.calls
                : calls // ignore: cast_nullable_to_non_nullable
                      as List<CallLog>,
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
abstract class _$$CallLogsListStateImplCopyWith<$Res>
    implements $CallLogsListStateCopyWith<$Res> {
  factory _$$CallLogsListStateImplCopyWith(
    _$CallLogsListStateImpl value,
    $Res Function(_$CallLogsListStateImpl) then,
  ) = __$$CallLogsListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<CallLog> calls,
    int page,
    int pages,
    bool isLoadingMore,
    String? search,
  });
}

/// @nodoc
class __$$CallLogsListStateImplCopyWithImpl<$Res>
    extends _$CallLogsListStateCopyWithImpl<$Res, _$CallLogsListStateImpl>
    implements _$$CallLogsListStateImplCopyWith<$Res> {
  __$$CallLogsListStateImplCopyWithImpl(
    _$CallLogsListStateImpl _value,
    $Res Function(_$CallLogsListStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CallLogsListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calls = null,
    Object? page = null,
    Object? pages = null,
    Object? isLoadingMore = null,
    Object? search = freezed,
  }) {
    return _then(
      _$CallLogsListStateImpl(
        calls: null == calls
            ? _value._calls
            : calls // ignore: cast_nullable_to_non_nullable
                  as List<CallLog>,
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

class _$CallLogsListStateImpl extends _CallLogsListState {
  const _$CallLogsListStateImpl({
    final List<CallLog> calls = const <CallLog>[],
    this.page = 1,
    this.pages = 1,
    this.isLoadingMore = false,
    this.search,
  }) : _calls = calls,
       super._();

  final List<CallLog> _calls;
  @override
  @JsonKey()
  List<CallLog> get calls {
    if (_calls is EqualUnmodifiableListView) return _calls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_calls);
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
    return 'CallLogsListState(calls: $calls, page: $page, pages: $pages, isLoadingMore: $isLoadingMore, search: $search)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CallLogsListStateImpl &&
            const DeepCollectionEquality().equals(other._calls, _calls) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.search, search) || other.search == search));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_calls),
    page,
    pages,
    isLoadingMore,
    search,
  );

  /// Create a copy of CallLogsListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CallLogsListStateImplCopyWith<_$CallLogsListStateImpl> get copyWith =>
      __$$CallLogsListStateImplCopyWithImpl<_$CallLogsListStateImpl>(
        this,
        _$identity,
      );
}

abstract class _CallLogsListState extends CallLogsListState {
  const factory _CallLogsListState({
    final List<CallLog> calls,
    final int page,
    final int pages,
    final bool isLoadingMore,
    final String? search,
  }) = _$CallLogsListStateImpl;
  const _CallLogsListState._() : super._();

  @override
  List<CallLog> get calls;
  @override
  int get page;
  @override
  int get pages;
  @override
  bool get isLoadingMore;
  @override
  String? get search;

  /// Create a copy of CallLogsListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CallLogsListStateImplCopyWith<_$CallLogsListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
