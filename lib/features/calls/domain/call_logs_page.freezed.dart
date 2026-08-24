// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'call_logs_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CallLogsPage _$CallLogsPageFromJson(Map<String, dynamic> json) {
  return _CallLogsPage.fromJson(json);
}

/// @nodoc
mixin _$CallLogsPage {
  List<CallLog> get calls => throw _privateConstructorUsedError;
  CallLogsPagination get pagination => throw _privateConstructorUsedError;

  /// Serializes this CallLogsPage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CallLogsPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CallLogsPageCopyWith<CallLogsPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallLogsPageCopyWith<$Res> {
  factory $CallLogsPageCopyWith(
    CallLogsPage value,
    $Res Function(CallLogsPage) then,
  ) = _$CallLogsPageCopyWithImpl<$Res, CallLogsPage>;
  @useResult
  $Res call({List<CallLog> calls, CallLogsPagination pagination});

  $CallLogsPaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class _$CallLogsPageCopyWithImpl<$Res, $Val extends CallLogsPage>
    implements $CallLogsPageCopyWith<$Res> {
  _$CallLogsPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CallLogsPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? calls = null, Object? pagination = null}) {
    return _then(
      _value.copyWith(
            calls: null == calls
                ? _value.calls
                : calls // ignore: cast_nullable_to_non_nullable
                      as List<CallLog>,
            pagination: null == pagination
                ? _value.pagination
                : pagination // ignore: cast_nullable_to_non_nullable
                      as CallLogsPagination,
          )
          as $Val,
    );
  }

  /// Create a copy of CallLogsPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CallLogsPaginationCopyWith<$Res> get pagination {
    return $CallLogsPaginationCopyWith<$Res>(_value.pagination, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CallLogsPageImplCopyWith<$Res>
    implements $CallLogsPageCopyWith<$Res> {
  factory _$$CallLogsPageImplCopyWith(
    _$CallLogsPageImpl value,
    $Res Function(_$CallLogsPageImpl) then,
  ) = __$$CallLogsPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CallLog> calls, CallLogsPagination pagination});

  @override
  $CallLogsPaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class __$$CallLogsPageImplCopyWithImpl<$Res>
    extends _$CallLogsPageCopyWithImpl<$Res, _$CallLogsPageImpl>
    implements _$$CallLogsPageImplCopyWith<$Res> {
  __$$CallLogsPageImplCopyWithImpl(
    _$CallLogsPageImpl _value,
    $Res Function(_$CallLogsPageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CallLogsPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? calls = null, Object? pagination = null}) {
    return _then(
      _$CallLogsPageImpl(
        calls: null == calls
            ? _value._calls
            : calls // ignore: cast_nullable_to_non_nullable
                  as List<CallLog>,
        pagination: null == pagination
            ? _value.pagination
            : pagination // ignore: cast_nullable_to_non_nullable
                  as CallLogsPagination,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CallLogsPageImpl implements _CallLogsPage {
  const _$CallLogsPageImpl({
    final List<CallLog> calls = const <CallLog>[],
    required this.pagination,
  }) : _calls = calls;

  factory _$CallLogsPageImpl.fromJson(Map<String, dynamic> json) =>
      _$$CallLogsPageImplFromJson(json);

  final List<CallLog> _calls;
  @override
  @JsonKey()
  List<CallLog> get calls {
    if (_calls is EqualUnmodifiableListView) return _calls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_calls);
  }

  @override
  final CallLogsPagination pagination;

  @override
  String toString() {
    return 'CallLogsPage(calls: $calls, pagination: $pagination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CallLogsPageImpl &&
            const DeepCollectionEquality().equals(other._calls, _calls) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_calls),
    pagination,
  );

  /// Create a copy of CallLogsPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CallLogsPageImplCopyWith<_$CallLogsPageImpl> get copyWith =>
      __$$CallLogsPageImplCopyWithImpl<_$CallLogsPageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CallLogsPageImplToJson(this);
  }
}

abstract class _CallLogsPage implements CallLogsPage {
  const factory _CallLogsPage({
    final List<CallLog> calls,
    required final CallLogsPagination pagination,
  }) = _$CallLogsPageImpl;

  factory _CallLogsPage.fromJson(Map<String, dynamic> json) =
      _$CallLogsPageImpl.fromJson;

  @override
  List<CallLog> get calls;
  @override
  CallLogsPagination get pagination;

  /// Create a copy of CallLogsPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CallLogsPageImplCopyWith<_$CallLogsPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CallLogsPagination _$CallLogsPaginationFromJson(Map<String, dynamic> json) {
  return _CallLogsPagination.fromJson(json);
}

/// @nodoc
mixin _$CallLogsPagination {
  int get page => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;

  /// Serializes this CallLogsPagination to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CallLogsPagination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CallLogsPaginationCopyWith<CallLogsPagination> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallLogsPaginationCopyWith<$Res> {
  factory $CallLogsPaginationCopyWith(
    CallLogsPagination value,
    $Res Function(CallLogsPagination) then,
  ) = _$CallLogsPaginationCopyWithImpl<$Res, CallLogsPagination>;
  @useResult
  $Res call({int page, int limit, int total, int totalPages});
}

/// @nodoc
class _$CallLogsPaginationCopyWithImpl<$Res, $Val extends CallLogsPagination>
    implements $CallLogsPaginationCopyWith<$Res> {
  _$CallLogsPaginationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CallLogsPagination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
    Object? total = null,
    Object? totalPages = null,
  }) {
    return _then(
      _value.copyWith(
            page: null == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                      as int,
            limit: null == limit
                ? _value.limit
                : limit // ignore: cast_nullable_to_non_nullable
                      as int,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as int,
            totalPages: null == totalPages
                ? _value.totalPages
                : totalPages // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CallLogsPaginationImplCopyWith<$Res>
    implements $CallLogsPaginationCopyWith<$Res> {
  factory _$$CallLogsPaginationImplCopyWith(
    _$CallLogsPaginationImpl value,
    $Res Function(_$CallLogsPaginationImpl) then,
  ) = __$$CallLogsPaginationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page, int limit, int total, int totalPages});
}

/// @nodoc
class __$$CallLogsPaginationImplCopyWithImpl<$Res>
    extends _$CallLogsPaginationCopyWithImpl<$Res, _$CallLogsPaginationImpl>
    implements _$$CallLogsPaginationImplCopyWith<$Res> {
  __$$CallLogsPaginationImplCopyWithImpl(
    _$CallLogsPaginationImpl _value,
    $Res Function(_$CallLogsPaginationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CallLogsPagination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? limit = null,
    Object? total = null,
    Object? totalPages = null,
  }) {
    return _then(
      _$CallLogsPaginationImpl(
        page: null == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int,
        limit: null == limit
            ? _value.limit
            : limit // ignore: cast_nullable_to_non_nullable
                  as int,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int,
        totalPages: null == totalPages
            ? _value.totalPages
            : totalPages // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CallLogsPaginationImpl implements _CallLogsPagination {
  const _$CallLogsPaginationImpl({
    this.page = 1,
    this.limit = 20,
    this.total = 0,
    this.totalPages = 1,
  });

  factory _$CallLogsPaginationImpl.fromJson(Map<String, dynamic> json) =>
      _$$CallLogsPaginationImplFromJson(json);

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int limit;
  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey()
  final int totalPages;

  @override
  String toString() {
    return 'CallLogsPagination(page: $page, limit: $limit, total: $total, totalPages: $totalPages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CallLogsPaginationImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, page, limit, total, totalPages);

  /// Create a copy of CallLogsPagination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CallLogsPaginationImplCopyWith<_$CallLogsPaginationImpl> get copyWith =>
      __$$CallLogsPaginationImplCopyWithImpl<_$CallLogsPaginationImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CallLogsPaginationImplToJson(this);
  }
}

abstract class _CallLogsPagination implements CallLogsPagination {
  const factory _CallLogsPagination({
    final int page,
    final int limit,
    final int total,
    final int totalPages,
  }) = _$CallLogsPaginationImpl;

  factory _CallLogsPagination.fromJson(Map<String, dynamic> json) =
      _$CallLogsPaginationImpl.fromJson;

  @override
  int get page;
  @override
  int get limit;
  @override
  int get total;
  @override
  int get totalPages;

  /// Create a copy of CallLogsPagination
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CallLogsPaginationImplCopyWith<_$CallLogsPaginationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
