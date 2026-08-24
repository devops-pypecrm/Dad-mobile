// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'opportunities_list_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$OpportunitiesListState {
  List<Opportunity> get opportunities => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;
  String? get stage => throw _privateConstructorUsedError;

  /// Create a copy of OpportunitiesListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpportunitiesListStateCopyWith<OpportunitiesListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpportunitiesListStateCopyWith<$Res> {
  factory $OpportunitiesListStateCopyWith(
    OpportunitiesListState value,
    $Res Function(OpportunitiesListState) then,
  ) = _$OpportunitiesListStateCopyWithImpl<$Res, OpportunitiesListState>;
  @useResult
  $Res call({
    List<Opportunity> opportunities,
    int page,
    int totalPages,
    bool isLoadingMore,
    String? stage,
  });
}

/// @nodoc
class _$OpportunitiesListStateCopyWithImpl<
  $Res,
  $Val extends OpportunitiesListState
>
    implements $OpportunitiesListStateCopyWith<$Res> {
  _$OpportunitiesListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpportunitiesListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? opportunities = null,
    Object? page = null,
    Object? totalPages = null,
    Object? isLoadingMore = null,
    Object? stage = freezed,
  }) {
    return _then(
      _value.copyWith(
            opportunities: null == opportunities
                ? _value.opportunities
                : opportunities // ignore: cast_nullable_to_non_nullable
                      as List<Opportunity>,
            page: null == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                      as int,
            totalPages: null == totalPages
                ? _value.totalPages
                : totalPages // ignore: cast_nullable_to_non_nullable
                      as int,
            isLoadingMore: null == isLoadingMore
                ? _value.isLoadingMore
                : isLoadingMore // ignore: cast_nullable_to_non_nullable
                      as bool,
            stage: freezed == stage
                ? _value.stage
                : stage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OpportunitiesListStateImplCopyWith<$Res>
    implements $OpportunitiesListStateCopyWith<$Res> {
  factory _$$OpportunitiesListStateImplCopyWith(
    _$OpportunitiesListStateImpl value,
    $Res Function(_$OpportunitiesListStateImpl) then,
  ) = __$$OpportunitiesListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<Opportunity> opportunities,
    int page,
    int totalPages,
    bool isLoadingMore,
    String? stage,
  });
}

/// @nodoc
class __$$OpportunitiesListStateImplCopyWithImpl<$Res>
    extends
        _$OpportunitiesListStateCopyWithImpl<$Res, _$OpportunitiesListStateImpl>
    implements _$$OpportunitiesListStateImplCopyWith<$Res> {
  __$$OpportunitiesListStateImplCopyWithImpl(
    _$OpportunitiesListStateImpl _value,
    $Res Function(_$OpportunitiesListStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpportunitiesListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? opportunities = null,
    Object? page = null,
    Object? totalPages = null,
    Object? isLoadingMore = null,
    Object? stage = freezed,
  }) {
    return _then(
      _$OpportunitiesListStateImpl(
        opportunities: null == opportunities
            ? _value._opportunities
            : opportunities // ignore: cast_nullable_to_non_nullable
                  as List<Opportunity>,
        page: null == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int,
        totalPages: null == totalPages
            ? _value.totalPages
            : totalPages // ignore: cast_nullable_to_non_nullable
                  as int,
        isLoadingMore: null == isLoadingMore
            ? _value.isLoadingMore
            : isLoadingMore // ignore: cast_nullable_to_non_nullable
                  as bool,
        stage: freezed == stage
            ? _value.stage
            : stage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$OpportunitiesListStateImpl extends _OpportunitiesListState {
  const _$OpportunitiesListStateImpl({
    final List<Opportunity> opportunities = const <Opportunity>[],
    this.page = 1,
    this.totalPages = 1,
    this.isLoadingMore = false,
    this.stage,
  }) : _opportunities = opportunities,
       super._();

  final List<Opportunity> _opportunities;
  @override
  @JsonKey()
  List<Opportunity> get opportunities {
    if (_opportunities is EqualUnmodifiableListView) return _opportunities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_opportunities);
  }

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int totalPages;
  @override
  @JsonKey()
  final bool isLoadingMore;
  @override
  final String? stage;

  @override
  String toString() {
    return 'OpportunitiesListState(opportunities: $opportunities, page: $page, totalPages: $totalPages, isLoadingMore: $isLoadingMore, stage: $stage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpportunitiesListStateImpl &&
            const DeepCollectionEquality().equals(
              other._opportunities,
              _opportunities,
            ) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.stage, stage) || other.stage == stage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_opportunities),
    page,
    totalPages,
    isLoadingMore,
    stage,
  );

  /// Create a copy of OpportunitiesListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpportunitiesListStateImplCopyWith<_$OpportunitiesListStateImpl>
  get copyWith =>
      __$$OpportunitiesListStateImplCopyWithImpl<_$OpportunitiesListStateImpl>(
        this,
        _$identity,
      );
}

abstract class _OpportunitiesListState extends OpportunitiesListState {
  const factory _OpportunitiesListState({
    final List<Opportunity> opportunities,
    final int page,
    final int totalPages,
    final bool isLoadingMore,
    final String? stage,
  }) = _$OpportunitiesListStateImpl;
  const _OpportunitiesListState._() : super._();

  @override
  List<Opportunity> get opportunities;
  @override
  int get page;
  @override
  int get totalPages;
  @override
  bool get isLoadingMore;
  @override
  String? get stage;

  /// Create a copy of OpportunitiesListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpportunitiesListStateImplCopyWith<_$OpportunitiesListStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
