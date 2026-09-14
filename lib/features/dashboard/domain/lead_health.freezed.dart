// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lead_health.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LeadHealth _$LeadHealthFromJson(Map<String, dynamic> json) {
  return _LeadHealth.fromJson(json);
}

/// @nodoc
mixin _$LeadHealth {
  int get unattendedLeads => throw _privateConstructorUsedError;
  int get noActivityLeads => throw _privateConstructorUsedError;

  /// Serializes this LeadHealth to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LeadHealth
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeadHealthCopyWith<LeadHealth> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadHealthCopyWith<$Res> {
  factory $LeadHealthCopyWith(
    LeadHealth value,
    $Res Function(LeadHealth) then,
  ) = _$LeadHealthCopyWithImpl<$Res, LeadHealth>;
  @useResult
  $Res call({int unattendedLeads, int noActivityLeads});
}

/// @nodoc
class _$LeadHealthCopyWithImpl<$Res, $Val extends LeadHealth>
    implements $LeadHealthCopyWith<$Res> {
  _$LeadHealthCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeadHealth
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? unattendedLeads = null, Object? noActivityLeads = null}) {
    return _then(
      _value.copyWith(
            unattendedLeads: null == unattendedLeads
                ? _value.unattendedLeads
                : unattendedLeads // ignore: cast_nullable_to_non_nullable
                      as int,
            noActivityLeads: null == noActivityLeads
                ? _value.noActivityLeads
                : noActivityLeads // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LeadHealthImplCopyWith<$Res>
    implements $LeadHealthCopyWith<$Res> {
  factory _$$LeadHealthImplCopyWith(
    _$LeadHealthImpl value,
    $Res Function(_$LeadHealthImpl) then,
  ) = __$$LeadHealthImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int unattendedLeads, int noActivityLeads});
}

/// @nodoc
class __$$LeadHealthImplCopyWithImpl<$Res>
    extends _$LeadHealthCopyWithImpl<$Res, _$LeadHealthImpl>
    implements _$$LeadHealthImplCopyWith<$Res> {
  __$$LeadHealthImplCopyWithImpl(
    _$LeadHealthImpl _value,
    $Res Function(_$LeadHealthImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LeadHealth
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? unattendedLeads = null, Object? noActivityLeads = null}) {
    return _then(
      _$LeadHealthImpl(
        unattendedLeads: null == unattendedLeads
            ? _value.unattendedLeads
            : unattendedLeads // ignore: cast_nullable_to_non_nullable
                  as int,
        noActivityLeads: null == noActivityLeads
            ? _value.noActivityLeads
            : noActivityLeads // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadHealthImpl implements _LeadHealth {
  const _$LeadHealthImpl({this.unattendedLeads = 0, this.noActivityLeads = 0});

  factory _$LeadHealthImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadHealthImplFromJson(json);

  @override
  @JsonKey()
  final int unattendedLeads;
  @override
  @JsonKey()
  final int noActivityLeads;

  @override
  String toString() {
    return 'LeadHealth(unattendedLeads: $unattendedLeads, noActivityLeads: $noActivityLeads)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadHealthImpl &&
            (identical(other.unattendedLeads, unattendedLeads) ||
                other.unattendedLeads == unattendedLeads) &&
            (identical(other.noActivityLeads, noActivityLeads) ||
                other.noActivityLeads == noActivityLeads));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, unattendedLeads, noActivityLeads);

  /// Create a copy of LeadHealth
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadHealthImplCopyWith<_$LeadHealthImpl> get copyWith =>
      __$$LeadHealthImplCopyWithImpl<_$LeadHealthImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadHealthImplToJson(this);
  }
}

abstract class _LeadHealth implements LeadHealth {
  const factory _LeadHealth({
    final int unattendedLeads,
    final int noActivityLeads,
  }) = _$LeadHealthImpl;

  factory _LeadHealth.fromJson(Map<String, dynamic> json) =
      _$LeadHealthImpl.fromJson;

  @override
  int get unattendedLeads;
  @override
  int get noActivityLeads;

  /// Create a copy of LeadHealth
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeadHealthImplCopyWith<_$LeadHealthImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
