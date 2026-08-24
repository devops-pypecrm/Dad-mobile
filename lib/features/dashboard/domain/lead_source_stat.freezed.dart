// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lead_source_stat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LeadSourceStat _$LeadSourceStatFromJson(Map<String, dynamic> json) {
  return _LeadSourceStat.fromJson(json);
}

/// @nodoc
mixin _$LeadSourceStat {
  String get source => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  /// Serializes this LeadSourceStat to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LeadSourceStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeadSourceStatCopyWith<LeadSourceStat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadSourceStatCopyWith<$Res> {
  factory $LeadSourceStatCopyWith(
    LeadSourceStat value,
    $Res Function(LeadSourceStat) then,
  ) = _$LeadSourceStatCopyWithImpl<$Res, LeadSourceStat>;
  @useResult
  $Res call({String source, int count});
}

/// @nodoc
class _$LeadSourceStatCopyWithImpl<$Res, $Val extends LeadSourceStat>
    implements $LeadSourceStatCopyWith<$Res> {
  _$LeadSourceStatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeadSourceStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? source = null, Object? count = null}) {
    return _then(
      _value.copyWith(
            source: null == source
                ? _value.source
                : source // ignore: cast_nullable_to_non_nullable
                      as String,
            count: null == count
                ? _value.count
                : count // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LeadSourceStatImplCopyWith<$Res>
    implements $LeadSourceStatCopyWith<$Res> {
  factory _$$LeadSourceStatImplCopyWith(
    _$LeadSourceStatImpl value,
    $Res Function(_$LeadSourceStatImpl) then,
  ) = __$$LeadSourceStatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String source, int count});
}

/// @nodoc
class __$$LeadSourceStatImplCopyWithImpl<$Res>
    extends _$LeadSourceStatCopyWithImpl<$Res, _$LeadSourceStatImpl>
    implements _$$LeadSourceStatImplCopyWith<$Res> {
  __$$LeadSourceStatImplCopyWithImpl(
    _$LeadSourceStatImpl _value,
    $Res Function(_$LeadSourceStatImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LeadSourceStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? source = null, Object? count = null}) {
    return _then(
      _$LeadSourceStatImpl(
        source: null == source
            ? _value.source
            : source // ignore: cast_nullable_to_non_nullable
                  as String,
        count: null == count
            ? _value.count
            : count // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadSourceStatImpl implements _LeadSourceStat {
  const _$LeadSourceStatImpl({required this.source, this.count = 0});

  factory _$LeadSourceStatImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadSourceStatImplFromJson(json);

  @override
  final String source;
  @override
  @JsonKey()
  final int count;

  @override
  String toString() {
    return 'LeadSourceStat(source: $source, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadSourceStatImpl &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, source, count);

  /// Create a copy of LeadSourceStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadSourceStatImplCopyWith<_$LeadSourceStatImpl> get copyWith =>
      __$$LeadSourceStatImplCopyWithImpl<_$LeadSourceStatImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadSourceStatImplToJson(this);
  }
}

abstract class _LeadSourceStat implements LeadSourceStat {
  const factory _LeadSourceStat({
    required final String source,
    final int count,
  }) = _$LeadSourceStatImpl;

  factory _LeadSourceStat.fromJson(Map<String, dynamic> json) =
      _$LeadSourceStatImpl.fromJson;

  @override
  String get source;
  @override
  int get count;

  /// Create a copy of LeadSourceStat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeadSourceStatImplCopyWith<_$LeadSourceStatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
