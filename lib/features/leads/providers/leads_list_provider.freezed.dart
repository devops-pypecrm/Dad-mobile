// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leads_list_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$LeadsListState {
  List<Lead> get leads => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get pages => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;
  String? get search => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get source => throw _privateConstructorUsedError;
  String? get assignedTo => throw _privateConstructorUsedError;
  String? get branchId => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  String get sortBy => throw _privateConstructorUsedError;
  String get sortOrder => throw _privateConstructorUsedError;

  /// Create a copy of LeadsListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeadsListStateCopyWith<LeadsListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadsListStateCopyWith<$Res> {
  factory $LeadsListStateCopyWith(
    LeadsListState value,
    $Res Function(LeadsListState) then,
  ) = _$LeadsListStateCopyWithImpl<$Res, LeadsListState>;
  @useResult
  $Res call({
    List<Lead> leads,
    int page,
    int pages,
    int total,
    bool isLoadingMore,
    String? search,
    String? status,
    String? source,
    String? assignedTo,
    String? branchId,
    DateTime? startDate,
    DateTime? endDate,
    String sortBy,
    String sortOrder,
  });
}

/// @nodoc
class _$LeadsListStateCopyWithImpl<$Res, $Val extends LeadsListState>
    implements $LeadsListStateCopyWith<$Res> {
  _$LeadsListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeadsListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leads = null,
    Object? page = null,
    Object? pages = null,
    Object? total = null,
    Object? isLoadingMore = null,
    Object? search = freezed,
    Object? status = freezed,
    Object? source = freezed,
    Object? assignedTo = freezed,
    Object? branchId = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? sortBy = null,
    Object? sortOrder = null,
  }) {
    return _then(
      _value.copyWith(
            leads: null == leads
                ? _value.leads
                : leads // ignore: cast_nullable_to_non_nullable
                      as List<Lead>,
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
            isLoadingMore: null == isLoadingMore
                ? _value.isLoadingMore
                : isLoadingMore // ignore: cast_nullable_to_non_nullable
                      as bool,
            search: freezed == search
                ? _value.search
                : search // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            source: freezed == source
                ? _value.source
                : source // ignore: cast_nullable_to_non_nullable
                      as String?,
            assignedTo: freezed == assignedTo
                ? _value.assignedTo
                : assignedTo // ignore: cast_nullable_to_non_nullable
                      as String?,
            branchId: freezed == branchId
                ? _value.branchId
                : branchId // ignore: cast_nullable_to_non_nullable
                      as String?,
            startDate: freezed == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            endDate: freezed == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
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
}

/// @nodoc
abstract class _$$LeadsListStateImplCopyWith<$Res>
    implements $LeadsListStateCopyWith<$Res> {
  factory _$$LeadsListStateImplCopyWith(
    _$LeadsListStateImpl value,
    $Res Function(_$LeadsListStateImpl) then,
  ) = __$$LeadsListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<Lead> leads,
    int page,
    int pages,
    int total,
    bool isLoadingMore,
    String? search,
    String? status,
    String? source,
    String? assignedTo,
    String? branchId,
    DateTime? startDate,
    DateTime? endDate,
    String sortBy,
    String sortOrder,
  });
}

/// @nodoc
class __$$LeadsListStateImplCopyWithImpl<$Res>
    extends _$LeadsListStateCopyWithImpl<$Res, _$LeadsListStateImpl>
    implements _$$LeadsListStateImplCopyWith<$Res> {
  __$$LeadsListStateImplCopyWithImpl(
    _$LeadsListStateImpl _value,
    $Res Function(_$LeadsListStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LeadsListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leads = null,
    Object? page = null,
    Object? pages = null,
    Object? total = null,
    Object? isLoadingMore = null,
    Object? search = freezed,
    Object? status = freezed,
    Object? source = freezed,
    Object? assignedTo = freezed,
    Object? branchId = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? sortBy = null,
    Object? sortOrder = null,
  }) {
    return _then(
      _$LeadsListStateImpl(
        leads: null == leads
            ? _value._leads
            : leads // ignore: cast_nullable_to_non_nullable
                  as List<Lead>,
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
        isLoadingMore: null == isLoadingMore
            ? _value.isLoadingMore
            : isLoadingMore // ignore: cast_nullable_to_non_nullable
                  as bool,
        search: freezed == search
            ? _value.search
            : search // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        source: freezed == source
            ? _value.source
            : source // ignore: cast_nullable_to_non_nullable
                  as String?,
        assignedTo: freezed == assignedTo
            ? _value.assignedTo
            : assignedTo // ignore: cast_nullable_to_non_nullable
                  as String?,
        branchId: freezed == branchId
            ? _value.branchId
            : branchId // ignore: cast_nullable_to_non_nullable
                  as String?,
        startDate: freezed == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        endDate: freezed == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
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

class _$LeadsListStateImpl extends _LeadsListState {
  const _$LeadsListStateImpl({
    final List<Lead> leads = const <Lead>[],
    this.page = 1,
    this.pages = 1,
    this.total = 0,
    this.isLoadingMore = false,
    this.search,
    this.status,
    this.source,
    this.assignedTo,
    this.branchId,
    this.startDate,
    this.endDate,
    this.sortBy = 'updatedAt',
    this.sortOrder = 'desc',
  }) : _leads = leads,
       super._();

  final List<Lead> _leads;
  @override
  @JsonKey()
  List<Lead> get leads {
    if (_leads is EqualUnmodifiableListView) return _leads;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_leads);
  }

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int pages;
  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey()
  final bool isLoadingMore;
  @override
  final String? search;
  @override
  final String? status;
  @override
  final String? source;
  @override
  final String? assignedTo;
  @override
  final String? branchId;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @override
  @JsonKey()
  final String sortBy;
  @override
  @JsonKey()
  final String sortOrder;

  @override
  String toString() {
    return 'LeadsListState(leads: $leads, page: $page, pages: $pages, total: $total, isLoadingMore: $isLoadingMore, search: $search, status: $status, source: $source, assignedTo: $assignedTo, branchId: $branchId, startDate: $startDate, endDate: $endDate, sortBy: $sortBy, sortOrder: $sortOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadsListStateImpl &&
            const DeepCollectionEquality().equals(other._leads, _leads) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.assignedTo, assignedTo) ||
                other.assignedTo == assignedTo) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_leads),
    page,
    pages,
    total,
    isLoadingMore,
    search,
    status,
    source,
    assignedTo,
    branchId,
    startDate,
    endDate,
    sortBy,
    sortOrder,
  );

  /// Create a copy of LeadsListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadsListStateImplCopyWith<_$LeadsListStateImpl> get copyWith =>
      __$$LeadsListStateImplCopyWithImpl<_$LeadsListStateImpl>(
        this,
        _$identity,
      );
}

abstract class _LeadsListState extends LeadsListState {
  const factory _LeadsListState({
    final List<Lead> leads,
    final int page,
    final int pages,
    final int total,
    final bool isLoadingMore,
    final String? search,
    final String? status,
    final String? source,
    final String? assignedTo,
    final String? branchId,
    final DateTime? startDate,
    final DateTime? endDate,
    final String sortBy,
    final String sortOrder,
  }) = _$LeadsListStateImpl;
  const _LeadsListState._() : super._();

  @override
  List<Lead> get leads;
  @override
  int get page;
  @override
  int get pages;
  @override
  int get total;
  @override
  bool get isLoadingMore;
  @override
  String? get search;
  @override
  String? get status;
  @override
  String? get source;
  @override
  String? get assignedTo;
  @override
  String? get branchId;
  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;
  @override
  String get sortBy;
  @override
  String get sortOrder;

  /// Create a copy of LeadsListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeadsListStateImplCopyWith<_$LeadsListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
