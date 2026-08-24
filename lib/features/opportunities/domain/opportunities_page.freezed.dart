// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'opportunities_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OpportunitiesPage _$OpportunitiesPageFromJson(Map<String, dynamic> json) {
  return _OpportunitiesPage.fromJson(json);
}

/// @nodoc
mixin _$OpportunitiesPage {
  List<Opportunity> get opportunities => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  int get totalOpportunities => throw _privateConstructorUsedError;

  /// Serializes this OpportunitiesPage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OpportunitiesPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpportunitiesPageCopyWith<OpportunitiesPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpportunitiesPageCopyWith<$Res> {
  factory $OpportunitiesPageCopyWith(
    OpportunitiesPage value,
    $Res Function(OpportunitiesPage) then,
  ) = _$OpportunitiesPageCopyWithImpl<$Res, OpportunitiesPage>;
  @useResult
  $Res call({
    List<Opportunity> opportunities,
    int page,
    int totalPages,
    int totalOpportunities,
  });
}

/// @nodoc
class _$OpportunitiesPageCopyWithImpl<$Res, $Val extends OpportunitiesPage>
    implements $OpportunitiesPageCopyWith<$Res> {
  _$OpportunitiesPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpportunitiesPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? opportunities = null,
    Object? page = null,
    Object? totalPages = null,
    Object? totalOpportunities = null,
  }) {
    return _then(
      _value.copyWith(
            opportunities: null == opportunities
                ? _value.opportunities
                : opportunities // ignore: cast_nullable_to_non_nullable
                      as List<Opportunity>,
            page: null == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                      as int,
            totalPages: null == totalPages
                ? _value.totalPages
                : totalPages // ignore: cast_nullable_to_non_nullable
                      as int,
            totalOpportunities: null == totalOpportunities
                ? _value.totalOpportunities
                : totalOpportunities // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OpportunitiesPageImplCopyWith<$Res>
    implements $OpportunitiesPageCopyWith<$Res> {
  factory _$$OpportunitiesPageImplCopyWith(
    _$OpportunitiesPageImpl value,
    $Res Function(_$OpportunitiesPageImpl) then,
  ) = __$$OpportunitiesPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<Opportunity> opportunities,
    int page,
    int totalPages,
    int totalOpportunities,
  });
}

/// @nodoc
class __$$OpportunitiesPageImplCopyWithImpl<$Res>
    extends _$OpportunitiesPageCopyWithImpl<$Res, _$OpportunitiesPageImpl>
    implements _$$OpportunitiesPageImplCopyWith<$Res> {
  __$$OpportunitiesPageImplCopyWithImpl(
    _$OpportunitiesPageImpl _value,
    $Res Function(_$OpportunitiesPageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpportunitiesPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? opportunities = null,
    Object? page = null,
    Object? totalPages = null,
    Object? totalOpportunities = null,
  }) {
    return _then(
      _$OpportunitiesPageImpl(
        opportunities: null == opportunities
            ? _value._opportunities
            : opportunities // ignore: cast_nullable_to_non_nullable
                  as List<Opportunity>,
        page: null == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int,
        totalPages: null == totalPages
            ? _value.totalPages
            : totalPages // ignore: cast_nullable_to_non_nullable
                  as int,
        totalOpportunities: null == totalOpportunities
            ? _value.totalOpportunities
            : totalOpportunities // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OpportunitiesPageImpl implements _OpportunitiesPage {
  const _$OpportunitiesPageImpl({
    required final List<Opportunity> opportunities,
    required this.page,
    required this.totalPages,
    required this.totalOpportunities,
  }) : _opportunities = opportunities;

  factory _$OpportunitiesPageImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpportunitiesPageImplFromJson(json);

  final List<Opportunity> _opportunities;
  @override
  List<Opportunity> get opportunities {
    if (_opportunities is EqualUnmodifiableListView) return _opportunities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_opportunities);
  }

  @override
  final int page;
  @override
  final int totalPages;
  @override
  final int totalOpportunities;

  @override
  String toString() {
    return 'OpportunitiesPage(opportunities: $opportunities, page: $page, totalPages: $totalPages, totalOpportunities: $totalOpportunities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpportunitiesPageImpl &&
            const DeepCollectionEquality().equals(
              other._opportunities,
              _opportunities,
            ) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalOpportunities, totalOpportunities) ||
                other.totalOpportunities == totalOpportunities));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_opportunities),
    page,
    totalPages,
    totalOpportunities,
  );

  /// Create a copy of OpportunitiesPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpportunitiesPageImplCopyWith<_$OpportunitiesPageImpl> get copyWith =>
      __$$OpportunitiesPageImplCopyWithImpl<_$OpportunitiesPageImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OpportunitiesPageImplToJson(this);
  }
}

abstract class _OpportunitiesPage implements OpportunitiesPage {
  const factory _OpportunitiesPage({
    required final List<Opportunity> opportunities,
    required final int page,
    required final int totalPages,
    required final int totalOpportunities,
  }) = _$OpportunitiesPageImpl;

  factory _OpportunitiesPage.fromJson(Map<String, dynamic> json) =
      _$OpportunitiesPageImpl.fromJson;

  @override
  List<Opportunity> get opportunities;
  @override
  int get page;
  @override
  int get totalPages;
  @override
  int get totalOpportunities;

  /// Create a copy of OpportunitiesPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpportunitiesPageImplCopyWith<_$OpportunitiesPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
