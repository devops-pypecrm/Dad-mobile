// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lead_source_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LeadSourceDetails _$LeadSourceDetailsFromJson(Map<String, dynamic> json) {
  return _LeadSourceDetails.fromJson(json);
}

/// @nodoc
mixin _$LeadSourceDetails {
  String? get campaignName => throw _privateConstructorUsedError;
  String? get metaCampaignName => throw _privateConstructorUsedError;
  String? get originalSource => throw _privateConstructorUsedError;

  /// Serializes this LeadSourceDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LeadSourceDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeadSourceDetailsCopyWith<LeadSourceDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadSourceDetailsCopyWith<$Res> {
  factory $LeadSourceDetailsCopyWith(
    LeadSourceDetails value,
    $Res Function(LeadSourceDetails) then,
  ) = _$LeadSourceDetailsCopyWithImpl<$Res, LeadSourceDetails>;
  @useResult
  $Res call({
    String? campaignName,
    String? metaCampaignName,
    String? originalSource,
  });
}

/// @nodoc
class _$LeadSourceDetailsCopyWithImpl<$Res, $Val extends LeadSourceDetails>
    implements $LeadSourceDetailsCopyWith<$Res> {
  _$LeadSourceDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeadSourceDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? campaignName = freezed,
    Object? metaCampaignName = freezed,
    Object? originalSource = freezed,
  }) {
    return _then(
      _value.copyWith(
            campaignName: freezed == campaignName
                ? _value.campaignName
                : campaignName // ignore: cast_nullable_to_non_nullable
                      as String?,
            metaCampaignName: freezed == metaCampaignName
                ? _value.metaCampaignName
                : metaCampaignName // ignore: cast_nullable_to_non_nullable
                      as String?,
            originalSource: freezed == originalSource
                ? _value.originalSource
                : originalSource // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LeadSourceDetailsImplCopyWith<$Res>
    implements $LeadSourceDetailsCopyWith<$Res> {
  factory _$$LeadSourceDetailsImplCopyWith(
    _$LeadSourceDetailsImpl value,
    $Res Function(_$LeadSourceDetailsImpl) then,
  ) = __$$LeadSourceDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? campaignName,
    String? metaCampaignName,
    String? originalSource,
  });
}

/// @nodoc
class __$$LeadSourceDetailsImplCopyWithImpl<$Res>
    extends _$LeadSourceDetailsCopyWithImpl<$Res, _$LeadSourceDetailsImpl>
    implements _$$LeadSourceDetailsImplCopyWith<$Res> {
  __$$LeadSourceDetailsImplCopyWithImpl(
    _$LeadSourceDetailsImpl _value,
    $Res Function(_$LeadSourceDetailsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LeadSourceDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? campaignName = freezed,
    Object? metaCampaignName = freezed,
    Object? originalSource = freezed,
  }) {
    return _then(
      _$LeadSourceDetailsImpl(
        campaignName: freezed == campaignName
            ? _value.campaignName
            : campaignName // ignore: cast_nullable_to_non_nullable
                  as String?,
        metaCampaignName: freezed == metaCampaignName
            ? _value.metaCampaignName
            : metaCampaignName // ignore: cast_nullable_to_non_nullable
                  as String?,
        originalSource: freezed == originalSource
            ? _value.originalSource
            : originalSource // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadSourceDetailsImpl implements _LeadSourceDetails {
  const _$LeadSourceDetailsImpl({
    this.campaignName,
    this.metaCampaignName,
    this.originalSource,
  });

  factory _$LeadSourceDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadSourceDetailsImplFromJson(json);

  @override
  final String? campaignName;
  @override
  final String? metaCampaignName;
  @override
  final String? originalSource;

  @override
  String toString() {
    return 'LeadSourceDetails(campaignName: $campaignName, metaCampaignName: $metaCampaignName, originalSource: $originalSource)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadSourceDetailsImpl &&
            (identical(other.campaignName, campaignName) ||
                other.campaignName == campaignName) &&
            (identical(other.metaCampaignName, metaCampaignName) ||
                other.metaCampaignName == metaCampaignName) &&
            (identical(other.originalSource, originalSource) ||
                other.originalSource == originalSource));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, campaignName, metaCampaignName, originalSource);

  /// Create a copy of LeadSourceDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadSourceDetailsImplCopyWith<_$LeadSourceDetailsImpl> get copyWith =>
      __$$LeadSourceDetailsImplCopyWithImpl<_$LeadSourceDetailsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadSourceDetailsImplToJson(this);
  }
}

abstract class _LeadSourceDetails implements LeadSourceDetails {
  const factory _LeadSourceDetails({
    final String? campaignName,
    final String? metaCampaignName,
    final String? originalSource,
  }) = _$LeadSourceDetailsImpl;

  factory _LeadSourceDetails.fromJson(Map<String, dynamic> json) =
      _$LeadSourceDetailsImpl.fromJson;

  @override
  String? get campaignName;
  @override
  String? get metaCampaignName;
  @override
  String? get originalSource;

  /// Create a copy of LeadSourceDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeadSourceDetailsImplCopyWith<_$LeadSourceDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
