// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'followups_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$FollowUpsListState {
  List<FollowUp> get allTasks => throw _privateConstructorUsedError;
  FollowUpCounts get counts => throw _privateConstructorUsedError;
  String? get search => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get branchId => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  FollowUpQuickFilter? get quickFilter =>
      throw _privateConstructorUsedError; // Custom due-date filter — mutually exclusive with [quickFilter] (picking
  // one clears the other, same as web's single `filter`/date concept).
  DateTime? get dueDateSingle => throw _privateConstructorUsedError;
  DateTime? get dueDateFrom => throw _privateConstructorUsedError;
  DateTime? get dueDateTo => throw _privateConstructorUsedError;
  String get sortBy => throw _privateConstructorUsedError;
  String get sortOrder => throw _privateConstructorUsedError;

  /// Create a copy of FollowUpsListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FollowUpsListStateCopyWith<FollowUpsListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowUpsListStateCopyWith<$Res> {
  factory $FollowUpsListStateCopyWith(
    FollowUpsListState value,
    $Res Function(FollowUpsListState) then,
  ) = _$FollowUpsListStateCopyWithImpl<$Res, FollowUpsListState>;
  @useResult
  $Res call({
    List<FollowUp> allTasks,
    FollowUpCounts counts,
    String? search,
    String? status,
    String? branchId,
    String? userId,
    FollowUpQuickFilter? quickFilter,
    DateTime? dueDateSingle,
    DateTime? dueDateFrom,
    DateTime? dueDateTo,
    String sortBy,
    String sortOrder,
  });

  $FollowUpCountsCopyWith<$Res> get counts;
}

/// @nodoc
class _$FollowUpsListStateCopyWithImpl<$Res, $Val extends FollowUpsListState>
    implements $FollowUpsListStateCopyWith<$Res> {
  _$FollowUpsListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FollowUpsListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allTasks = null,
    Object? counts = null,
    Object? search = freezed,
    Object? status = freezed,
    Object? branchId = freezed,
    Object? userId = freezed,
    Object? quickFilter = freezed,
    Object? dueDateSingle = freezed,
    Object? dueDateFrom = freezed,
    Object? dueDateTo = freezed,
    Object? sortBy = null,
    Object? sortOrder = null,
  }) {
    return _then(
      _value.copyWith(
            allTasks: null == allTasks
                ? _value.allTasks
                : allTasks // ignore: cast_nullable_to_non_nullable
                      as List<FollowUp>,
            counts: null == counts
                ? _value.counts
                : counts // ignore: cast_nullable_to_non_nullable
                      as FollowUpCounts,
            search: freezed == search
                ? _value.search
                : search // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            branchId: freezed == branchId
                ? _value.branchId
                : branchId // ignore: cast_nullable_to_non_nullable
                      as String?,
            userId: freezed == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String?,
            quickFilter: freezed == quickFilter
                ? _value.quickFilter
                : quickFilter // ignore: cast_nullable_to_non_nullable
                      as FollowUpQuickFilter?,
            dueDateSingle: freezed == dueDateSingle
                ? _value.dueDateSingle
                : dueDateSingle // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            dueDateFrom: freezed == dueDateFrom
                ? _value.dueDateFrom
                : dueDateFrom // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            dueDateTo: freezed == dueDateTo
                ? _value.dueDateTo
                : dueDateTo // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            sortBy: null == sortBy
                ? _value.sortBy
                : sortBy // ignore: cast_nullable_to_non_nullable
                      as String,
            sortOrder: null == sortOrder
                ? _value.sortOrder
                : sortOrder // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }

  /// Create a copy of FollowUpsListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowUpCountsCopyWith<$Res> get counts {
    return $FollowUpCountsCopyWith<$Res>(_value.counts, (value) {
      return _then(_value.copyWith(counts: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FollowUpsListStateImplCopyWith<$Res>
    implements $FollowUpsListStateCopyWith<$Res> {
  factory _$$FollowUpsListStateImplCopyWith(
    _$FollowUpsListStateImpl value,
    $Res Function(_$FollowUpsListStateImpl) then,
  ) = __$$FollowUpsListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<FollowUp> allTasks,
    FollowUpCounts counts,
    String? search,
    String? status,
    String? branchId,
    String? userId,
    FollowUpQuickFilter? quickFilter,
    DateTime? dueDateSingle,
    DateTime? dueDateFrom,
    DateTime? dueDateTo,
    String sortBy,
    String sortOrder,
  });

  @override
  $FollowUpCountsCopyWith<$Res> get counts;
}

/// @nodoc
class __$$FollowUpsListStateImplCopyWithImpl<$Res>
    extends _$FollowUpsListStateCopyWithImpl<$Res, _$FollowUpsListStateImpl>
    implements _$$FollowUpsListStateImplCopyWith<$Res> {
  __$$FollowUpsListStateImplCopyWithImpl(
    _$FollowUpsListStateImpl _value,
    $Res Function(_$FollowUpsListStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FollowUpsListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allTasks = null,
    Object? counts = null,
    Object? search = freezed,
    Object? status = freezed,
    Object? branchId = freezed,
    Object? userId = freezed,
    Object? quickFilter = freezed,
    Object? dueDateSingle = freezed,
    Object? dueDateFrom = freezed,
    Object? dueDateTo = freezed,
    Object? sortBy = null,
    Object? sortOrder = null,
  }) {
    return _then(
      _$FollowUpsListStateImpl(
        allTasks: null == allTasks
            ? _value._allTasks
            : allTasks // ignore: cast_nullable_to_non_nullable
                  as List<FollowUp>,
        counts: null == counts
            ? _value.counts
            : counts // ignore: cast_nullable_to_non_nullable
                  as FollowUpCounts,
        search: freezed == search
            ? _value.search
            : search // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        branchId: freezed == branchId
            ? _value.branchId
            : branchId // ignore: cast_nullable_to_non_nullable
                  as String?,
        userId: freezed == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String?,
        quickFilter: freezed == quickFilter
            ? _value.quickFilter
            : quickFilter // ignore: cast_nullable_to_non_nullable
                  as FollowUpQuickFilter?,
        dueDateSingle: freezed == dueDateSingle
            ? _value.dueDateSingle
            : dueDateSingle // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        dueDateFrom: freezed == dueDateFrom
            ? _value.dueDateFrom
            : dueDateFrom // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        dueDateTo: freezed == dueDateTo
            ? _value.dueDateTo
            : dueDateTo // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        sortBy: null == sortBy
            ? _value.sortBy
            : sortBy // ignore: cast_nullable_to_non_nullable
                  as String,
        sortOrder: null == sortOrder
            ? _value.sortOrder
            : sortOrder // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$FollowUpsListStateImpl extends _FollowUpsListState {
  const _$FollowUpsListStateImpl({
    final List<FollowUp> allTasks = const <FollowUp>[],
    this.counts = const FollowUpCounts(),
    this.search,
    this.status,
    this.branchId,
    this.userId,
    this.quickFilter,
    this.dueDateSingle,
    this.dueDateFrom,
    this.dueDateTo,
    this.sortBy = 'dueDate',
    this.sortOrder = 'asc',
  }) : _allTasks = allTasks,
       super._();

  final List<FollowUp> _allTasks;
  @override
  @JsonKey()
  List<FollowUp> get allTasks {
    if (_allTasks is EqualUnmodifiableListView) return _allTasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allTasks);
  }

  @override
  @JsonKey()
  final FollowUpCounts counts;
  @override
  final String? search;
  @override
  final String? status;
  @override
  final String? branchId;
  @override
  final String? userId;
  @override
  final FollowUpQuickFilter? quickFilter;
  // Custom due-date filter — mutually exclusive with [quickFilter] (picking
  // one clears the other, same as web's single `filter`/date concept).
  @override
  final DateTime? dueDateSingle;
  @override
  final DateTime? dueDateFrom;
  @override
  final DateTime? dueDateTo;
  @override
  @JsonKey()
  final String sortBy;
  @override
  @JsonKey()
  final String sortOrder;

  @override
  String toString() {
    return 'FollowUpsListState(allTasks: $allTasks, counts: $counts, search: $search, status: $status, branchId: $branchId, userId: $userId, quickFilter: $quickFilter, dueDateSingle: $dueDateSingle, dueDateFrom: $dueDateFrom, dueDateTo: $dueDateTo, sortBy: $sortBy, sortOrder: $sortOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowUpsListStateImpl &&
            const DeepCollectionEquality().equals(other._allTasks, _allTasks) &&
            (identical(other.counts, counts) || other.counts == counts) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.quickFilter, quickFilter) ||
                other.quickFilter == quickFilter) &&
            (identical(other.dueDateSingle, dueDateSingle) ||
                other.dueDateSingle == dueDateSingle) &&
            (identical(other.dueDateFrom, dueDateFrom) ||
                other.dueDateFrom == dueDateFrom) &&
            (identical(other.dueDateTo, dueDateTo) ||
                other.dueDateTo == dueDateTo) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_allTasks),
    counts,
    search,
    status,
    branchId,
    userId,
    quickFilter,
    dueDateSingle,
    dueDateFrom,
    dueDateTo,
    sortBy,
    sortOrder,
  );

  /// Create a copy of FollowUpsListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowUpsListStateImplCopyWith<_$FollowUpsListStateImpl> get copyWith =>
      __$$FollowUpsListStateImplCopyWithImpl<_$FollowUpsListStateImpl>(
        this,
        _$identity,
      );
}

abstract class _FollowUpsListState extends FollowUpsListState {
  const factory _FollowUpsListState({
    final List<FollowUp> allTasks,
    final FollowUpCounts counts,
    final String? search,
    final String? status,
    final String? branchId,
    final String? userId,
    final FollowUpQuickFilter? quickFilter,
    final DateTime? dueDateSingle,
    final DateTime? dueDateFrom,
    final DateTime? dueDateTo,
    final String sortBy,
    final String sortOrder,
  }) = _$FollowUpsListStateImpl;
  const _FollowUpsListState._() : super._();

  @override
  List<FollowUp> get allTasks;
  @override
  FollowUpCounts get counts;
  @override
  String? get search;
  @override
  String? get status;
  @override
  String? get branchId;
  @override
  String? get userId;
  @override
  FollowUpQuickFilter? get quickFilter; // Custom due-date filter — mutually exclusive with [quickFilter] (picking
  // one clears the other, same as web's single `filter`/date concept).
  @override
  DateTime? get dueDateSingle;
  @override
  DateTime? get dueDateFrom;
  @override
  DateTime? get dueDateTo;
  @override
  String get sortBy;
  @override
  String get sortOrder;

  /// Create a copy of FollowUpsListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FollowUpsListStateImplCopyWith<_$FollowUpsListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
