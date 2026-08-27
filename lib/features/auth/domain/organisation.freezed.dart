// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'organisation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Organisation _$OrganisationFromJson(Map<String, dynamic> json) {
  return _Organisation.fromJson(json);
}

/// @nodoc
mixin _$Organisation {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;

  /// Custom per-org lead pipeline config (`{ id, label, color?, isDefault? }[]`).
  /// `Lead.status` on the backend is a free string keyed off this, not a
  /// fixed enum — see Dad-backend/CLAUDE.md. May be null/empty for orgs
  /// that never configured a custom pipeline.
  List<LeadStatusOption>? get leadStatuses =>
      throw _privateConstructorUsedError;

  /// Same idea as [leadStatuses] but for `Opportunity.stage` — backend
  /// field is `opportunityLeadStatuses` (Dad-backend/CLAUDE.md flags this
  /// as the same free-string-keyed-off-org-config pattern as leads). May
  /// be null/empty for orgs that never configured a custom pipeline.
  @JsonKey(name: 'opportunityLeadStatuses')
  List<LeadStatusOption>? get opportunityStages =>
      throw _privateConstructorUsedError;

  /// Serializes this Organisation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Organisation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrganisationCopyWith<Organisation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrganisationCopyWith<$Res> {
  factory $OrganisationCopyWith(
    Organisation value,
    $Res Function(Organisation) then,
  ) = _$OrganisationCopyWithImpl<$Res, Organisation>;
  @useResult
  $Res call({
    String id,
    String name,
    String? slug,
    String? logo,
    String? currency,
    List<LeadStatusOption>? leadStatuses,
    @JsonKey(name: 'opportunityLeadStatuses')
    List<LeadStatusOption>? opportunityStages,
  });
}

/// @nodoc
class _$OrganisationCopyWithImpl<$Res, $Val extends Organisation>
    implements $OrganisationCopyWith<$Res> {
  _$OrganisationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Organisation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = freezed,
    Object? logo = freezed,
    Object? currency = freezed,
    Object? leadStatuses = freezed,
    Object? opportunityStages = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            slug: freezed == slug
                ? _value.slug
                : slug // ignore: cast_nullable_to_non_nullable
                      as String?,
            logo: freezed == logo
                ? _value.logo
                : logo // ignore: cast_nullable_to_non_nullable
                      as String?,
            currency: freezed == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String?,
            leadStatuses: freezed == leadStatuses
                ? _value.leadStatuses
                : leadStatuses // ignore: cast_nullable_to_non_nullable
                      as List<LeadStatusOption>?,
            opportunityStages: freezed == opportunityStages
                ? _value.opportunityStages
                : opportunityStages // ignore: cast_nullable_to_non_nullable
                      as List<LeadStatusOption>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrganisationImplCopyWith<$Res>
    implements $OrganisationCopyWith<$Res> {
  factory _$$OrganisationImplCopyWith(
    _$OrganisationImpl value,
    $Res Function(_$OrganisationImpl) then,
  ) = __$$OrganisationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String? slug,
    String? logo,
    String? currency,
    List<LeadStatusOption>? leadStatuses,
    @JsonKey(name: 'opportunityLeadStatuses')
    List<LeadStatusOption>? opportunityStages,
  });
}

/// @nodoc
class __$$OrganisationImplCopyWithImpl<$Res>
    extends _$OrganisationCopyWithImpl<$Res, _$OrganisationImpl>
    implements _$$OrganisationImplCopyWith<$Res> {
  __$$OrganisationImplCopyWithImpl(
    _$OrganisationImpl _value,
    $Res Function(_$OrganisationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Organisation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? slug = freezed,
    Object? logo = freezed,
    Object? currency = freezed,
    Object? leadStatuses = freezed,
    Object? opportunityStages = freezed,
  }) {
    return _then(
      _$OrganisationImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        slug: freezed == slug
            ? _value.slug
            : slug // ignore: cast_nullable_to_non_nullable
                  as String?,
        logo: freezed == logo
            ? _value.logo
            : logo // ignore: cast_nullable_to_non_nullable
                  as String?,
        currency: freezed == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String?,
        leadStatuses: freezed == leadStatuses
            ? _value._leadStatuses
            : leadStatuses // ignore: cast_nullable_to_non_nullable
                  as List<LeadStatusOption>?,
        opportunityStages: freezed == opportunityStages
            ? _value._opportunityStages
            : opportunityStages // ignore: cast_nullable_to_non_nullable
                  as List<LeadStatusOption>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OrganisationImpl implements _Organisation {
  const _$OrganisationImpl({
    required this.id,
    required this.name,
    this.slug,
    this.logo,
    this.currency,
    final List<LeadStatusOption>? leadStatuses,
    @JsonKey(name: 'opportunityLeadStatuses')
    final List<LeadStatusOption>? opportunityStages,
  }) : _leadStatuses = leadStatuses,
       _opportunityStages = opportunityStages;

  factory _$OrganisationImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrganisationImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? slug;
  @override
  final String? logo;
  @override
  final String? currency;

  /// Custom per-org lead pipeline config (`{ id, label, color?, isDefault? }[]`).
  /// `Lead.status` on the backend is a free string keyed off this, not a
  /// fixed enum — see Dad-backend/CLAUDE.md. May be null/empty for orgs
  /// that never configured a custom pipeline.
  final List<LeadStatusOption>? _leadStatuses;

  /// Custom per-org lead pipeline config (`{ id, label, color?, isDefault? }[]`).
  /// `Lead.status` on the backend is a free string keyed off this, not a
  /// fixed enum — see Dad-backend/CLAUDE.md. May be null/empty for orgs
  /// that never configured a custom pipeline.
  @override
  List<LeadStatusOption>? get leadStatuses {
    final value = _leadStatuses;
    if (value == null) return null;
    if (_leadStatuses is EqualUnmodifiableListView) return _leadStatuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Same idea as [leadStatuses] but for `Opportunity.stage` — backend
  /// field is `opportunityLeadStatuses` (Dad-backend/CLAUDE.md flags this
  /// as the same free-string-keyed-off-org-config pattern as leads). May
  /// be null/empty for orgs that never configured a custom pipeline.
  final List<LeadStatusOption>? _opportunityStages;

  /// Same idea as [leadStatuses] but for `Opportunity.stage` — backend
  /// field is `opportunityLeadStatuses` (Dad-backend/CLAUDE.md flags this
  /// as the same free-string-keyed-off-org-config pattern as leads). May
  /// be null/empty for orgs that never configured a custom pipeline.
  @override
  @JsonKey(name: 'opportunityLeadStatuses')
  List<LeadStatusOption>? get opportunityStages {
    final value = _opportunityStages;
    if (value == null) return null;
    if (_opportunityStages is EqualUnmodifiableListView)
      return _opportunityStages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Organisation(id: $id, name: $name, slug: $slug, logo: $logo, currency: $currency, leadStatuses: $leadStatuses, opportunityStages: $opportunityStages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrganisationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            const DeepCollectionEquality().equals(
              other._leadStatuses,
              _leadStatuses,
            ) &&
            const DeepCollectionEquality().equals(
              other._opportunityStages,
              _opportunityStages,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    slug,
    logo,
    currency,
    const DeepCollectionEquality().hash(_leadStatuses),
    const DeepCollectionEquality().hash(_opportunityStages),
  );

  /// Create a copy of Organisation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrganisationImplCopyWith<_$OrganisationImpl> get copyWith =>
      __$$OrganisationImplCopyWithImpl<_$OrganisationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrganisationImplToJson(this);
  }
}

abstract class _Organisation implements Organisation {
  const factory _Organisation({
    required final String id,
    required final String name,
    final String? slug,
    final String? logo,
    final String? currency,
    final List<LeadStatusOption>? leadStatuses,
    @JsonKey(name: 'opportunityLeadStatuses')
    final List<LeadStatusOption>? opportunityStages,
  }) = _$OrganisationImpl;

  factory _Organisation.fromJson(Map<String, dynamic> json) =
      _$OrganisationImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get slug;
  @override
  String? get logo;
  @override
  String? get currency;

  /// Custom per-org lead pipeline config (`{ id, label, color?, isDefault? }[]`).
  /// `Lead.status` on the backend is a free string keyed off this, not a
  /// fixed enum — see Dad-backend/CLAUDE.md. May be null/empty for orgs
  /// that never configured a custom pipeline.
  @override
  List<LeadStatusOption>? get leadStatuses;

  /// Same idea as [leadStatuses] but for `Opportunity.stage` — backend
  /// field is `opportunityLeadStatuses` (Dad-backend/CLAUDE.md flags this
  /// as the same free-string-keyed-off-org-config pattern as leads). May
  /// be null/empty for orgs that never configured a custom pipeline.
  @override
  @JsonKey(name: 'opportunityLeadStatuses')
  List<LeadStatusOption>? get opportunityStages;

  /// Create a copy of Organisation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrganisationImplCopyWith<_$OrganisationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeadStatusOption _$LeadStatusOptionFromJson(Map<String, dynamic> json) {
  return _LeadStatusOption.fromJson(json);
}

/// @nodoc
mixin _$LeadStatusOption {
  String get id => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  bool get isDefault => throw _privateConstructorUsedError;

  /// Serializes this LeadStatusOption to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LeadStatusOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeadStatusOptionCopyWith<LeadStatusOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadStatusOptionCopyWith<$Res> {
  factory $LeadStatusOptionCopyWith(
    LeadStatusOption value,
    $Res Function(LeadStatusOption) then,
  ) = _$LeadStatusOptionCopyWithImpl<$Res, LeadStatusOption>;
  @useResult
  $Res call({String id, String? label, String? color, bool isDefault});
}

/// @nodoc
class _$LeadStatusOptionCopyWithImpl<$Res, $Val extends LeadStatusOption>
    implements $LeadStatusOptionCopyWith<$Res> {
  _$LeadStatusOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeadStatusOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = freezed,
    Object? color = freezed,
    Object? isDefault = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            label: freezed == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String?,
            color: freezed == color
                ? _value.color
                : color // ignore: cast_nullable_to_non_nullable
                      as String?,
            isDefault: null == isDefault
                ? _value.isDefault
                : isDefault // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LeadStatusOptionImplCopyWith<$Res>
    implements $LeadStatusOptionCopyWith<$Res> {
  factory _$$LeadStatusOptionImplCopyWith(
    _$LeadStatusOptionImpl value,
    $Res Function(_$LeadStatusOptionImpl) then,
  ) = __$$LeadStatusOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String? label, String? color, bool isDefault});
}

/// @nodoc
class __$$LeadStatusOptionImplCopyWithImpl<$Res>
    extends _$LeadStatusOptionCopyWithImpl<$Res, _$LeadStatusOptionImpl>
    implements _$$LeadStatusOptionImplCopyWith<$Res> {
  __$$LeadStatusOptionImplCopyWithImpl(
    _$LeadStatusOptionImpl _value,
    $Res Function(_$LeadStatusOptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LeadStatusOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = freezed,
    Object? color = freezed,
    Object? isDefault = null,
  }) {
    return _then(
      _$LeadStatusOptionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        label: freezed == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String?,
        color: freezed == color
            ? _value.color
            : color // ignore: cast_nullable_to_non_nullable
                  as String?,
        isDefault: null == isDefault
            ? _value.isDefault
            : isDefault // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadStatusOptionImpl implements _LeadStatusOption {
  const _$LeadStatusOptionImpl({
    required this.id,
    this.label,
    this.color,
    this.isDefault = false,
  });

  factory _$LeadStatusOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadStatusOptionImplFromJson(json);

  @override
  final String id;
  @override
  final String? label;
  @override
  final String? color;
  @override
  @JsonKey()
  final bool isDefault;

  @override
  String toString() {
    return 'LeadStatusOption(id: $id, label: $label, color: $color, isDefault: $isDefault)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadStatusOptionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, label, color, isDefault);

  /// Create a copy of LeadStatusOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadStatusOptionImplCopyWith<_$LeadStatusOptionImpl> get copyWith =>
      __$$LeadStatusOptionImplCopyWithImpl<_$LeadStatusOptionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadStatusOptionImplToJson(this);
  }
}

abstract class _LeadStatusOption implements LeadStatusOption {
  const factory _LeadStatusOption({
    required final String id,
    final String? label,
    final String? color,
    final bool isDefault,
  }) = _$LeadStatusOptionImpl;

  factory _LeadStatusOption.fromJson(Map<String, dynamic> json) =
      _$LeadStatusOptionImpl.fromJson;

  @override
  String get id;
  @override
  String? get label;
  @override
  String? get color;
  @override
  bool get isDefault;

  /// Create a copy of LeadStatusOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeadStatusOptionImplCopyWith<_$LeadStatusOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
