// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leads_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LeadsPage _$LeadsPageFromJson(Map<String, dynamic> json) {
  return _LeadsPage.fromJson(json);
}

/// @nodoc
mixin _$LeadsPage {
  List<Lead> get leads => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get pages => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  /// Serializes this LeadsPage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LeadsPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeadsPageCopyWith<LeadsPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadsPageCopyWith<$Res> {
  factory $LeadsPageCopyWith(LeadsPage value, $Res Function(LeadsPage) then) =
      _$LeadsPageCopyWithImpl<$Res, LeadsPage>;
  @useResult
  $Res call({List<Lead> leads, int page, int pages, int total});
}

/// @nodoc
class _$LeadsPageCopyWithImpl<$Res, $Val extends LeadsPage>
    implements $LeadsPageCopyWith<$Res> {
  _$LeadsPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeadsPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leads = null,
    Object? page = null,
    Object? pages = null,
    Object? total = null,
  }) {
    return _then(
      _value.copyWith(
            leads: null == leads
                ? _value.leads
                : leads // ignore: cast_nullable_to_non_nullable
                      as List<Lead>,
            page: null == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                      as int,
            pages: null == pages
                ? _value.pages
                : pages // ignore: cast_nullable_to_non_nullable
                      as int,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LeadsPageImplCopyWith<$Res>
    implements $LeadsPageCopyWith<$Res> {
  factory _$$LeadsPageImplCopyWith(
    _$LeadsPageImpl value,
    $Res Function(_$LeadsPageImpl) then,
  ) = __$$LeadsPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Lead> leads, int page, int pages, int total});
}

/// @nodoc
class __$$LeadsPageImplCopyWithImpl<$Res>
    extends _$LeadsPageCopyWithImpl<$Res, _$LeadsPageImpl>
    implements _$$LeadsPageImplCopyWith<$Res> {
  __$$LeadsPageImplCopyWithImpl(
    _$LeadsPageImpl _value,
    $Res Function(_$LeadsPageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LeadsPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leads = null,
    Object? page = null,
    Object? pages = null,
    Object? total = null,
  }) {
    return _then(
      _$LeadsPageImpl(
        leads: null == leads
            ? _value._leads
            : leads // ignore: cast_nullable_to_non_nullable
                  as List<Lead>,
        page: null == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int,
        pages: null == pages
            ? _value.pages
            : pages // ignore: cast_nullable_to_non_nullable
                  as int,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadsPageImpl implements _LeadsPage {
  const _$LeadsPageImpl({
    required final List<Lead> leads,
    required this.page,
    required this.pages,
    required this.total,
  }) : _leads = leads;

  factory _$LeadsPageImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadsPageImplFromJson(json);

  final List<Lead> _leads;
  @override
  List<Lead> get leads {
    if (_leads is EqualUnmodifiableListView) return _leads;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_leads);
  }

  @override
  final int page;
  @override
  final int pages;
  @override
  final int total;

  @override
  String toString() {
    return 'LeadsPage(leads: $leads, page: $page, pages: $pages, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadsPageImpl &&
            const DeepCollectionEquality().equals(other._leads, _leads) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_leads),
    page,
    pages,
    total,
  );

  /// Create a copy of LeadsPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadsPageImplCopyWith<_$LeadsPageImpl> get copyWith =>
      __$$LeadsPageImplCopyWithImpl<_$LeadsPageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadsPageImplToJson(this);
  }
}

abstract class _LeadsPage implements LeadsPage {
  const factory _LeadsPage({
    required final List<Lead> leads,
    required final int page,
    required final int pages,
    required final int total,
  }) = _$LeadsPageImpl;

  factory _LeadsPage.fromJson(Map<String, dynamic> json) =
      _$LeadsPageImpl.fromJson;

  @override
  List<Lead> get leads;
  @override
  int get page;
  @override
  int get pages;
  @override
  int get total;

  /// Create a copy of LeadsPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeadsPageImplCopyWith<_$LeadsPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
