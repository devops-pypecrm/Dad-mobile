// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_performer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TopPerformer _$TopPerformerFromJson(Map<String, dynamic> json) {
  return _TopPerformer.fromJson(json);
}

/// @nodoc
mixin _$TopPerformer {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  double get totalRevenue => throw _privateConstructorUsedError;
  int get dealsWon => throw _privateConstructorUsedError;

  /// Serializes this TopPerformer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TopPerformer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TopPerformerCopyWith<TopPerformer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopPerformerCopyWith<$Res> {
  factory $TopPerformerCopyWith(
    TopPerformer value,
    $Res Function(TopPerformer) then,
  ) = _$TopPerformerCopyWithImpl<$Res, TopPerformer>;
  @useResult
  $Res call({
    String id,
    String name,
    String? email,
    String? image,
    double totalRevenue,
    int dealsWon,
  });
}

/// @nodoc
class _$TopPerformerCopyWithImpl<$Res, $Val extends TopPerformer>
    implements $TopPerformerCopyWith<$Res> {
  _$TopPerformerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TopPerformer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = freezed,
    Object? image = freezed,
    Object? totalRevenue = null,
    Object? dealsWon = null,
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
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            image: freezed == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String?,
            totalRevenue: null == totalRevenue
                ? _value.totalRevenue
                : totalRevenue // ignore: cast_nullable_to_non_nullable
                      as double,
            dealsWon: null == dealsWon
                ? _value.dealsWon
                : dealsWon // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TopPerformerImplCopyWith<$Res>
    implements $TopPerformerCopyWith<$Res> {
  factory _$$TopPerformerImplCopyWith(
    _$TopPerformerImpl value,
    $Res Function(_$TopPerformerImpl) then,
  ) = __$$TopPerformerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String? email,
    String? image,
    double totalRevenue,
    int dealsWon,
  });
}

/// @nodoc
class __$$TopPerformerImplCopyWithImpl<$Res>
    extends _$TopPerformerCopyWithImpl<$Res, _$TopPerformerImpl>
    implements _$$TopPerformerImplCopyWith<$Res> {
  __$$TopPerformerImplCopyWithImpl(
    _$TopPerformerImpl _value,
    $Res Function(_$TopPerformerImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TopPerformer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = freezed,
    Object? image = freezed,
    Object? totalRevenue = null,
    Object? dealsWon = null,
  }) {
    return _then(
      _$TopPerformerImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        image: freezed == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String?,
        totalRevenue: null == totalRevenue
            ? _value.totalRevenue
            : totalRevenue // ignore: cast_nullable_to_non_nullable
                  as double,
        dealsWon: null == dealsWon
            ? _value.dealsWon
            : dealsWon // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TopPerformerImpl implements _TopPerformer {
  const _$TopPerformerImpl({
    required this.id,
    required this.name,
    this.email,
    this.image,
    this.totalRevenue = 0,
    this.dealsWon = 0,
  });

  factory _$TopPerformerImpl.fromJson(Map<String, dynamic> json) =>
      _$$TopPerformerImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? email;
  @override
  final String? image;
  @override
  @JsonKey()
  final double totalRevenue;
  @override
  @JsonKey()
  final int dealsWon;

  @override
  String toString() {
    return 'TopPerformer(id: $id, name: $name, email: $email, image: $image, totalRevenue: $totalRevenue, dealsWon: $dealsWon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopPerformerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.totalRevenue, totalRevenue) ||
                other.totalRevenue == totalRevenue) &&
            (identical(other.dealsWon, dealsWon) ||
                other.dealsWon == dealsWon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, email, image, totalRevenue, dealsWon);

  /// Create a copy of TopPerformer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TopPerformerImplCopyWith<_$TopPerformerImpl> get copyWith =>
      __$$TopPerformerImplCopyWithImpl<_$TopPerformerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TopPerformerImplToJson(this);
  }
}

abstract class _TopPerformer implements TopPerformer {
  const factory _TopPerformer({
    required final String id,
    required final String name,
    final String? email,
    final String? image,
    final double totalRevenue,
    final int dealsWon,
  }) = _$TopPerformerImpl;

  factory _TopPerformer.fromJson(Map<String, dynamic> json) =
      _$TopPerformerImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get email;
  @override
  String? get image;
  @override
  double get totalRevenue;
  @override
  int get dealsWon;

  /// Create a copy of TopPerformer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TopPerformerImplCopyWith<_$TopPerformerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
