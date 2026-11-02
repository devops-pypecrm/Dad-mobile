// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'whatsapp_template.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WhatsAppTemplate _$WhatsAppTemplateFromJson(Map<String, dynamic> json) {
  return _WhatsAppTemplate.fromJson(json);
}

/// @nodoc
mixin _$WhatsAppTemplate {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this WhatsAppTemplate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WhatsAppTemplate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WhatsAppTemplateCopyWith<WhatsAppTemplate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WhatsAppTemplateCopyWith<$Res> {
  factory $WhatsAppTemplateCopyWith(
    WhatsAppTemplate value,
    $Res Function(WhatsAppTemplate) then,
  ) = _$WhatsAppTemplateCopyWithImpl<$Res, WhatsAppTemplate>;
  @useResult
  $Res call({String id, String title, String body, DateTime createdAt});
}

/// @nodoc
class _$WhatsAppTemplateCopyWithImpl<$Res, $Val extends WhatsAppTemplate>
    implements $WhatsAppTemplateCopyWith<$Res> {
  _$WhatsAppTemplateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WhatsAppTemplate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? body = null,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            body: null == body
                ? _value.body
                : body // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WhatsAppTemplateImplCopyWith<$Res>
    implements $WhatsAppTemplateCopyWith<$Res> {
  factory _$$WhatsAppTemplateImplCopyWith(
    _$WhatsAppTemplateImpl value,
    $Res Function(_$WhatsAppTemplateImpl) then,
  ) = __$$WhatsAppTemplateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title, String body, DateTime createdAt});
}

/// @nodoc
class __$$WhatsAppTemplateImplCopyWithImpl<$Res>
    extends _$WhatsAppTemplateCopyWithImpl<$Res, _$WhatsAppTemplateImpl>
    implements _$$WhatsAppTemplateImplCopyWith<$Res> {
  __$$WhatsAppTemplateImplCopyWithImpl(
    _$WhatsAppTemplateImpl _value,
    $Res Function(_$WhatsAppTemplateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WhatsAppTemplate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? body = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$WhatsAppTemplateImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        body: null == body
            ? _value.body
            : body // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WhatsAppTemplateImpl implements _WhatsAppTemplate {
  const _$WhatsAppTemplateImpl({
    required this.id,
    required this.title,
    required this.body,
    required this.createdAt,
  });

  factory _$WhatsAppTemplateImpl.fromJson(Map<String, dynamic> json) =>
      _$$WhatsAppTemplateImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String body;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'WhatsAppTemplate(id: $id, title: $title, body: $body, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WhatsAppTemplateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, body, createdAt);

  /// Create a copy of WhatsAppTemplate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WhatsAppTemplateImplCopyWith<_$WhatsAppTemplateImpl> get copyWith =>
      __$$WhatsAppTemplateImplCopyWithImpl<_$WhatsAppTemplateImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WhatsAppTemplateImplToJson(this);
  }
}

abstract class _WhatsAppTemplate implements WhatsAppTemplate {
  const factory _WhatsAppTemplate({
    required final String id,
    required final String title,
    required final String body,
    required final DateTime createdAt,
  }) = _$WhatsAppTemplateImpl;

  factory _WhatsAppTemplate.fromJson(Map<String, dynamic> json) =
      _$WhatsAppTemplateImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get body;
  @override
  DateTime get createdAt;

  /// Create a copy of WhatsAppTemplate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WhatsAppTemplateImplCopyWith<_$WhatsAppTemplateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
