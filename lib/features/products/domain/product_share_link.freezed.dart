// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_share_link.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProductShareLink _$ProductShareLinkFromJson(Map<String, dynamic> json) {
  return _ProductShareLink.fromJson(json);
}

/// @nodoc
mixin _$ProductShareLink {
  String? get url => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;
  int get views => throw _privateConstructorUsedError;
  String? get youtubeUrl => throw _privateConstructorUsedError;
  String? get customTitle => throw _privateConstructorUsedError;
  String? get customDescription => throw _privateConstructorUsedError;

  /// Serializes this ProductShareLink to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductShareLink
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductShareLinkCopyWith<ProductShareLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductShareLinkCopyWith<$Res> {
  factory $ProductShareLinkCopyWith(
    ProductShareLink value,
    $Res Function(ProductShareLink) then,
  ) = _$ProductShareLinkCopyWithImpl<$Res, ProductShareLink>;
  @useResult
  $Res call({
    String? url,
    String? slug,
    int views,
    String? youtubeUrl,
    String? customTitle,
    String? customDescription,
  });
}

/// @nodoc
class _$ProductShareLinkCopyWithImpl<$Res, $Val extends ProductShareLink>
    implements $ProductShareLinkCopyWith<$Res> {
  _$ProductShareLinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductShareLink
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? slug = freezed,
    Object? views = null,
    Object? youtubeUrl = freezed,
    Object? customTitle = freezed,
    Object? customDescription = freezed,
  }) {
    return _then(
      _value.copyWith(
            url: freezed == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                      as String?,
            slug: freezed == slug
                ? _value.slug
                : slug // ignore: cast_nullable_to_non_nullable
                      as String?,
            views: null == views
                ? _value.views
                : views // ignore: cast_nullable_to_non_nullable
                      as int,
            youtubeUrl: freezed == youtubeUrl
                ? _value.youtubeUrl
                : youtubeUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            customTitle: freezed == customTitle
                ? _value.customTitle
                : customTitle // ignore: cast_nullable_to_non_nullable
                      as String?,
            customDescription: freezed == customDescription
                ? _value.customDescription
                : customDescription // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductShareLinkImplCopyWith<$Res>
    implements $ProductShareLinkCopyWith<$Res> {
  factory _$$ProductShareLinkImplCopyWith(
    _$ProductShareLinkImpl value,
    $Res Function(_$ProductShareLinkImpl) then,
  ) = __$$ProductShareLinkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? url,
    String? slug,
    int views,
    String? youtubeUrl,
    String? customTitle,
    String? customDescription,
  });
}

/// @nodoc
class __$$ProductShareLinkImplCopyWithImpl<$Res>
    extends _$ProductShareLinkCopyWithImpl<$Res, _$ProductShareLinkImpl>
    implements _$$ProductShareLinkImplCopyWith<$Res> {
  __$$ProductShareLinkImplCopyWithImpl(
    _$ProductShareLinkImpl _value,
    $Res Function(_$ProductShareLinkImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductShareLink
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? slug = freezed,
    Object? views = null,
    Object? youtubeUrl = freezed,
    Object? customTitle = freezed,
    Object? customDescription = freezed,
  }) {
    return _then(
      _$ProductShareLinkImpl(
        url: freezed == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String?,
        slug: freezed == slug
            ? _value.slug
            : slug // ignore: cast_nullable_to_non_nullable
                  as String?,
        views: null == views
            ? _value.views
            : views // ignore: cast_nullable_to_non_nullable
                  as int,
        youtubeUrl: freezed == youtubeUrl
            ? _value.youtubeUrl
            : youtubeUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        customTitle: freezed == customTitle
            ? _value.customTitle
            : customTitle // ignore: cast_nullable_to_non_nullable
                  as String?,
        customDescription: freezed == customDescription
            ? _value.customDescription
            : customDescription // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductShareLinkImpl implements _ProductShareLink {
  const _$ProductShareLinkImpl({
    this.url,
    this.slug,
    this.views = 0,
    this.youtubeUrl,
    this.customTitle,
    this.customDescription,
  });

  factory _$ProductShareLinkImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductShareLinkImplFromJson(json);

  @override
  final String? url;
  @override
  final String? slug;
  @override
  @JsonKey()
  final int views;
  @override
  final String? youtubeUrl;
  @override
  final String? customTitle;
  @override
  final String? customDescription;

  @override
  String toString() {
    return 'ProductShareLink(url: $url, slug: $slug, views: $views, youtubeUrl: $youtubeUrl, customTitle: $customTitle, customDescription: $customDescription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductShareLinkImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.views, views) || other.views == views) &&
            (identical(other.youtubeUrl, youtubeUrl) ||
                other.youtubeUrl == youtubeUrl) &&
            (identical(other.customTitle, customTitle) ||
                other.customTitle == customTitle) &&
            (identical(other.customDescription, customDescription) ||
                other.customDescription == customDescription));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    url,
    slug,
    views,
    youtubeUrl,
    customTitle,
    customDescription,
  );

  /// Create a copy of ProductShareLink
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductShareLinkImplCopyWith<_$ProductShareLinkImpl> get copyWith =>
      __$$ProductShareLinkImplCopyWithImpl<_$ProductShareLinkImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductShareLinkImplToJson(this);
  }
}

abstract class _ProductShareLink implements ProductShareLink {
  const factory _ProductShareLink({
    final String? url,
    final String? slug,
    final int views,
    final String? youtubeUrl,
    final String? customTitle,
    final String? customDescription,
  }) = _$ProductShareLinkImpl;

  factory _ProductShareLink.fromJson(Map<String, dynamic> json) =
      _$ProductShareLinkImpl.fromJson;

  @override
  String? get url;
  @override
  String? get slug;
  @override
  int get views;
  @override
  String? get youtubeUrl;
  @override
  String? get customTitle;
  @override
  String? get customDescription;

  /// Create a copy of ProductShareLink
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductShareLinkImplCopyWith<_$ProductShareLinkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
