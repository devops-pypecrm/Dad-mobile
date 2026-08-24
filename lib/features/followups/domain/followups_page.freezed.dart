// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'followups_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FollowUpsPage _$FollowUpsPageFromJson(Map<String, dynamic> json) {
  return _FollowUpsPage.fromJson(json);
}

/// @nodoc
mixin _$FollowUpsPage {
  List<FollowUp> get tasks => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  int get totalTasks => throw _privateConstructorUsedError;
  FollowUpCounts get counts => throw _privateConstructorUsedError;

  /// Serializes this FollowUpsPage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FollowUpsPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FollowUpsPageCopyWith<FollowUpsPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowUpsPageCopyWith<$Res> {
  factory $FollowUpsPageCopyWith(
    FollowUpsPage value,
    $Res Function(FollowUpsPage) then,
  ) = _$FollowUpsPageCopyWithImpl<$Res, FollowUpsPage>;
  @useResult
  $Res call({
    List<FollowUp> tasks,
    int page,
    int totalPages,
    int totalTasks,
    FollowUpCounts counts,
  });

  $FollowUpCountsCopyWith<$Res> get counts;
}

/// @nodoc
class _$FollowUpsPageCopyWithImpl<$Res, $Val extends FollowUpsPage>
    implements $FollowUpsPageCopyWith<$Res> {
  _$FollowUpsPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FollowUpsPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
    Object? page = null,
    Object? totalPages = null,
    Object? totalTasks = null,
    Object? counts = null,
  }) {
    return _then(
      _value.copyWith(
            tasks: null == tasks
                ? _value.tasks
                : tasks // ignore: cast_nullable_to_non_nullable
                      as List<FollowUp>,
            page: null == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                      as int,
            totalPages: null == totalPages
                ? _value.totalPages
                : totalPages // ignore: cast_nullable_to_non_nullable
                      as int,
            totalTasks: null == totalTasks
                ? _value.totalTasks
                : totalTasks // ignore: cast_nullable_to_non_nullable
                      as int,
            counts: null == counts
                ? _value.counts
                : counts // ignore: cast_nullable_to_non_nullable
                      as FollowUpCounts,
          )
          as $Val,
    );
  }

  /// Create a copy of FollowUpsPage
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
abstract class _$$FollowUpsPageImplCopyWith<$Res>
    implements $FollowUpsPageCopyWith<$Res> {
  factory _$$FollowUpsPageImplCopyWith(
    _$FollowUpsPageImpl value,
    $Res Function(_$FollowUpsPageImpl) then,
  ) = __$$FollowUpsPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<FollowUp> tasks,
    int page,
    int totalPages,
    int totalTasks,
    FollowUpCounts counts,
  });

  @override
  $FollowUpCountsCopyWith<$Res> get counts;
}

/// @nodoc
class __$$FollowUpsPageImplCopyWithImpl<$Res>
    extends _$FollowUpsPageCopyWithImpl<$Res, _$FollowUpsPageImpl>
    implements _$$FollowUpsPageImplCopyWith<$Res> {
  __$$FollowUpsPageImplCopyWithImpl(
    _$FollowUpsPageImpl _value,
    $Res Function(_$FollowUpsPageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FollowUpsPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
    Object? page = null,
    Object? totalPages = null,
    Object? totalTasks = null,
    Object? counts = null,
  }) {
    return _then(
      _$FollowUpsPageImpl(
        tasks: null == tasks
            ? _value._tasks
            : tasks // ignore: cast_nullable_to_non_nullable
                  as List<FollowUp>,
        page: null == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int,
        totalPages: null == totalPages
            ? _value.totalPages
            : totalPages // ignore: cast_nullable_to_non_nullable
                  as int,
        totalTasks: null == totalTasks
            ? _value.totalTasks
            : totalTasks // ignore: cast_nullable_to_non_nullable
                  as int,
        counts: null == counts
            ? _value.counts
            : counts // ignore: cast_nullable_to_non_nullable
                  as FollowUpCounts,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowUpsPageImpl implements _FollowUpsPage {
  const _$FollowUpsPageImpl({
    required final List<FollowUp> tasks,
    required this.page,
    required this.totalPages,
    required this.totalTasks,
    required this.counts,
  }) : _tasks = tasks;

  factory _$FollowUpsPageImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowUpsPageImplFromJson(json);

  final List<FollowUp> _tasks;
  @override
  List<FollowUp> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  final int page;
  @override
  final int totalPages;
  @override
  final int totalTasks;
  @override
  final FollowUpCounts counts;

  @override
  String toString() {
    return 'FollowUpsPage(tasks: $tasks, page: $page, totalPages: $totalPages, totalTasks: $totalTasks, counts: $counts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowUpsPageImpl &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalTasks, totalTasks) ||
                other.totalTasks == totalTasks) &&
            (identical(other.counts, counts) || other.counts == counts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_tasks),
    page,
    totalPages,
    totalTasks,
    counts,
  );

  /// Create a copy of FollowUpsPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowUpsPageImplCopyWith<_$FollowUpsPageImpl> get copyWith =>
      __$$FollowUpsPageImplCopyWithImpl<_$FollowUpsPageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowUpsPageImplToJson(this);
  }
}

abstract class _FollowUpsPage implements FollowUpsPage {
  const factory _FollowUpsPage({
    required final List<FollowUp> tasks,
    required final int page,
    required final int totalPages,
    required final int totalTasks,
    required final FollowUpCounts counts,
  }) = _$FollowUpsPageImpl;

  factory _FollowUpsPage.fromJson(Map<String, dynamic> json) =
      _$FollowUpsPageImpl.fromJson;

  @override
  List<FollowUp> get tasks;
  @override
  int get page;
  @override
  int get totalPages;
  @override
  int get totalTasks;
  @override
  FollowUpCounts get counts;

  /// Create a copy of FollowUpsPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FollowUpsPageImplCopyWith<_$FollowUpsPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FollowUpCounts _$FollowUpCountsFromJson(Map<String, dynamic> json) {
  return _FollowUpCounts.fromJson(json);
}

/// @nodoc
mixin _$FollowUpCounts {
  int get active => throw _privateConstructorUsedError;
  int get overdue => throw _privateConstructorUsedError;
  int get today => throw _privateConstructorUsedError;
  int get upcoming => throw _privateConstructorUsedError;

  /// Serializes this FollowUpCounts to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FollowUpCounts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FollowUpCountsCopyWith<FollowUpCounts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowUpCountsCopyWith<$Res> {
  factory $FollowUpCountsCopyWith(
    FollowUpCounts value,
    $Res Function(FollowUpCounts) then,
  ) = _$FollowUpCountsCopyWithImpl<$Res, FollowUpCounts>;
  @useResult
  $Res call({int active, int overdue, int today, int upcoming});
}

/// @nodoc
class _$FollowUpCountsCopyWithImpl<$Res, $Val extends FollowUpCounts>
    implements $FollowUpCountsCopyWith<$Res> {
  _$FollowUpCountsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FollowUpCounts
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? active = null,
    Object? overdue = null,
    Object? today = null,
    Object? upcoming = null,
  }) {
    return _then(
      _value.copyWith(
            active: null == active
                ? _value.active
                : active // ignore: cast_nullable_to_non_nullable
                      as int,
            overdue: null == overdue
                ? _value.overdue
                : overdue // ignore: cast_nullable_to_non_nullable
                      as int,
            today: null == today
                ? _value.today
                : today // ignore: cast_nullable_to_non_nullable
                      as int,
            upcoming: null == upcoming
                ? _value.upcoming
                : upcoming // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FollowUpCountsImplCopyWith<$Res>
    implements $FollowUpCountsCopyWith<$Res> {
  factory _$$FollowUpCountsImplCopyWith(
    _$FollowUpCountsImpl value,
    $Res Function(_$FollowUpCountsImpl) then,
  ) = __$$FollowUpCountsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int active, int overdue, int today, int upcoming});
}

/// @nodoc
class __$$FollowUpCountsImplCopyWithImpl<$Res>
    extends _$FollowUpCountsCopyWithImpl<$Res, _$FollowUpCountsImpl>
    implements _$$FollowUpCountsImplCopyWith<$Res> {
  __$$FollowUpCountsImplCopyWithImpl(
    _$FollowUpCountsImpl _value,
    $Res Function(_$FollowUpCountsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FollowUpCounts
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? active = null,
    Object? overdue = null,
    Object? today = null,
    Object? upcoming = null,
  }) {
    return _then(
      _$FollowUpCountsImpl(
        active: null == active
            ? _value.active
            : active // ignore: cast_nullable_to_non_nullable
                  as int,
        overdue: null == overdue
            ? _value.overdue
            : overdue // ignore: cast_nullable_to_non_nullable
                  as int,
        today: null == today
            ? _value.today
            : today // ignore: cast_nullable_to_non_nullable
                  as int,
        upcoming: null == upcoming
            ? _value.upcoming
            : upcoming // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowUpCountsImpl implements _FollowUpCounts {
  const _$FollowUpCountsImpl({
    this.active = 0,
    this.overdue = 0,
    this.today = 0,
    this.upcoming = 0,
  });

  factory _$FollowUpCountsImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowUpCountsImplFromJson(json);

  @override
  @JsonKey()
  final int active;
  @override
  @JsonKey()
  final int overdue;
  @override
  @JsonKey()
  final int today;
  @override
  @JsonKey()
  final int upcoming;

  @override
  String toString() {
    return 'FollowUpCounts(active: $active, overdue: $overdue, today: $today, upcoming: $upcoming)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowUpCountsImpl &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.overdue, overdue) || other.overdue == overdue) &&
            (identical(other.today, today) || other.today == today) &&
            (identical(other.upcoming, upcoming) ||
                other.upcoming == upcoming));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, active, overdue, today, upcoming);

  /// Create a copy of FollowUpCounts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowUpCountsImplCopyWith<_$FollowUpCountsImpl> get copyWith =>
      __$$FollowUpCountsImplCopyWithImpl<_$FollowUpCountsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowUpCountsImplToJson(this);
  }
}

abstract class _FollowUpCounts implements FollowUpCounts {
  const factory _FollowUpCounts({
    final int active,
    final int overdue,
    final int today,
    final int upcoming,
  }) = _$FollowUpCountsImpl;

  factory _FollowUpCounts.fromJson(Map<String, dynamic> json) =
      _$FollowUpCountsImpl.fromJson;

  @override
  int get active;
  @override
  int get overdue;
  @override
  int get today;
  @override
  int get upcoming;

  /// Create a copy of FollowUpCounts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FollowUpCountsImplCopyWith<_$FollowUpCountsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
