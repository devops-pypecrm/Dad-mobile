// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'followup.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FollowUp _$FollowUpFromJson(Map<String, dynamic> json) {
  return _FollowUp.fromJson(json);
}

/// @nodoc
mixin _$FollowUp {
  String get id => throw _privateConstructorUsedError;
  String get subject => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get priority => throw _privateConstructorUsedError;
  DateTime get dueDate => throw _privateConstructorUsedError;
  FollowUpRelatedEntity? get relatedTo => throw _privateConstructorUsedError;
  String? get onModel => throw _privateConstructorUsedError;
  FollowUpAssignee? get assignedTo => throw _privateConstructorUsedError;
  Branch? get branch => throw _privateConstructorUsedError;

  /// Serializes this FollowUp to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FollowUp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FollowUpCopyWith<FollowUp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowUpCopyWith<$Res> {
  factory $FollowUpCopyWith(FollowUp value, $Res Function(FollowUp) then) =
      _$FollowUpCopyWithImpl<$Res, FollowUp>;
  @useResult
  $Res call({
    String id,
    String subject,
    String? description,
    String status,
    String priority,
    DateTime dueDate,
    FollowUpRelatedEntity? relatedTo,
    String? onModel,
    FollowUpAssignee? assignedTo,
    Branch? branch,
  });

  $FollowUpRelatedEntityCopyWith<$Res>? get relatedTo;
  $FollowUpAssigneeCopyWith<$Res>? get assignedTo;
  $BranchCopyWith<$Res>? get branch;
}

/// @nodoc
class _$FollowUpCopyWithImpl<$Res, $Val extends FollowUp>
    implements $FollowUpCopyWith<$Res> {
  _$FollowUpCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FollowUp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subject = null,
    Object? description = freezed,
    Object? status = null,
    Object? priority = null,
    Object? dueDate = null,
    Object? relatedTo = freezed,
    Object? onModel = freezed,
    Object? assignedTo = freezed,
    Object? branch = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            subject: null == subject
                ? _value.subject
                : subject // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            priority: null == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as String,
            dueDate: null == dueDate
                ? _value.dueDate
                : dueDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            relatedTo: freezed == relatedTo
                ? _value.relatedTo
                : relatedTo // ignore: cast_nullable_to_non_nullable
                      as FollowUpRelatedEntity?,
            onModel: freezed == onModel
                ? _value.onModel
                : onModel // ignore: cast_nullable_to_non_nullable
                      as String?,
            assignedTo: freezed == assignedTo
                ? _value.assignedTo
                : assignedTo // ignore: cast_nullable_to_non_nullable
                      as FollowUpAssignee?,
            branch: freezed == branch
                ? _value.branch
                : branch // ignore: cast_nullable_to_non_nullable
                      as Branch?,
          )
          as $Val,
    );
  }

  /// Create a copy of FollowUp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowUpRelatedEntityCopyWith<$Res>? get relatedTo {
    if (_value.relatedTo == null) {
      return null;
    }

    return $FollowUpRelatedEntityCopyWith<$Res>(_value.relatedTo!, (value) {
      return _then(_value.copyWith(relatedTo: value) as $Val);
    });
  }

  /// Create a copy of FollowUp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowUpAssigneeCopyWith<$Res>? get assignedTo {
    if (_value.assignedTo == null) {
      return null;
    }

    return $FollowUpAssigneeCopyWith<$Res>(_value.assignedTo!, (value) {
      return _then(_value.copyWith(assignedTo: value) as $Val);
    });
  }

  /// Create a copy of FollowUp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BranchCopyWith<$Res>? get branch {
    if (_value.branch == null) {
      return null;
    }

    return $BranchCopyWith<$Res>(_value.branch!, (value) {
      return _then(_value.copyWith(branch: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FollowUpImplCopyWith<$Res>
    implements $FollowUpCopyWith<$Res> {
  factory _$$FollowUpImplCopyWith(
    _$FollowUpImpl value,
    $Res Function(_$FollowUpImpl) then,
  ) = __$$FollowUpImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String subject,
    String? description,
    String status,
    String priority,
    DateTime dueDate,
    FollowUpRelatedEntity? relatedTo,
    String? onModel,
    FollowUpAssignee? assignedTo,
    Branch? branch,
  });

  @override
  $FollowUpRelatedEntityCopyWith<$Res>? get relatedTo;
  @override
  $FollowUpAssigneeCopyWith<$Res>? get assignedTo;
  @override
  $BranchCopyWith<$Res>? get branch;
}

/// @nodoc
class __$$FollowUpImplCopyWithImpl<$Res>
    extends _$FollowUpCopyWithImpl<$Res, _$FollowUpImpl>
    implements _$$FollowUpImplCopyWith<$Res> {
  __$$FollowUpImplCopyWithImpl(
    _$FollowUpImpl _value,
    $Res Function(_$FollowUpImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FollowUp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subject = null,
    Object? description = freezed,
    Object? status = null,
    Object? priority = null,
    Object? dueDate = null,
    Object? relatedTo = freezed,
    Object? onModel = freezed,
    Object? assignedTo = freezed,
    Object? branch = freezed,
  }) {
    return _then(
      _$FollowUpImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        subject: null == subject
            ? _value.subject
            : subject // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        priority: null == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as String,
        dueDate: null == dueDate
            ? _value.dueDate
            : dueDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        relatedTo: freezed == relatedTo
            ? _value.relatedTo
            : relatedTo // ignore: cast_nullable_to_non_nullable
                  as FollowUpRelatedEntity?,
        onModel: freezed == onModel
            ? _value.onModel
            : onModel // ignore: cast_nullable_to_non_nullable
                  as String?,
        assignedTo: freezed == assignedTo
            ? _value.assignedTo
            : assignedTo // ignore: cast_nullable_to_non_nullable
                  as FollowUpAssignee?,
        branch: freezed == branch
            ? _value.branch
            : branch // ignore: cast_nullable_to_non_nullable
                  as Branch?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowUpImpl extends _FollowUp {
  const _$FollowUpImpl({
    required this.id,
    required this.subject,
    this.description,
    this.status = kFollowUpNotStarted,
    this.priority = 'medium',
    required this.dueDate,
    this.relatedTo,
    this.onModel,
    this.assignedTo,
    this.branch,
  }) : super._();

  factory _$FollowUpImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowUpImplFromJson(json);

  @override
  final String id;
  @override
  final String subject;
  @override
  final String? description;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey()
  final String priority;
  @override
  final DateTime dueDate;
  @override
  final FollowUpRelatedEntity? relatedTo;
  @override
  final String? onModel;
  @override
  final FollowUpAssignee? assignedTo;
  @override
  final Branch? branch;

  @override
  String toString() {
    return 'FollowUp(id: $id, subject: $subject, description: $description, status: $status, priority: $priority, dueDate: $dueDate, relatedTo: $relatedTo, onModel: $onModel, assignedTo: $assignedTo, branch: $branch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowUpImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.relatedTo, relatedTo) ||
                other.relatedTo == relatedTo) &&
            (identical(other.onModel, onModel) || other.onModel == onModel) &&
            (identical(other.assignedTo, assignedTo) ||
                other.assignedTo == assignedTo) &&
            (identical(other.branch, branch) || other.branch == branch));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    subject,
    description,
    status,
    priority,
    dueDate,
    relatedTo,
    onModel,
    assignedTo,
    branch,
  );

  /// Create a copy of FollowUp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowUpImplCopyWith<_$FollowUpImpl> get copyWith =>
      __$$FollowUpImplCopyWithImpl<_$FollowUpImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowUpImplToJson(this);
  }
}

abstract class _FollowUp extends FollowUp {
  const factory _FollowUp({
    required final String id,
    required final String subject,
    final String? description,
    final String status,
    final String priority,
    required final DateTime dueDate,
    final FollowUpRelatedEntity? relatedTo,
    final String? onModel,
    final FollowUpAssignee? assignedTo,
    final Branch? branch,
  }) = _$FollowUpImpl;
  const _FollowUp._() : super._();

  factory _FollowUp.fromJson(Map<String, dynamic> json) =
      _$FollowUpImpl.fromJson;

  @override
  String get id;
  @override
  String get subject;
  @override
  String? get description;
  @override
  String get status;
  @override
  String get priority;
  @override
  DateTime get dueDate;
  @override
  FollowUpRelatedEntity? get relatedTo;
  @override
  String? get onModel;
  @override
  FollowUpAssignee? get assignedTo;
  @override
  Branch? get branch;

  /// Create a copy of FollowUp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FollowUpImplCopyWith<_$FollowUpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
