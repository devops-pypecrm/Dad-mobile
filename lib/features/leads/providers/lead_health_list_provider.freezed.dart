// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lead_health_list_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$LeadHealthListState {
  List<Lead> get leads => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get pages => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;

  /// Create a copy of LeadHealthListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeadHealthListStateCopyWith<LeadHealthListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadHealthListStateCopyWith<$Res> {
  factory $LeadHealthListStateCopyWith(
    LeadHealthListState value,
    $Res Function(LeadHealthListState) then,
  ) = _$LeadHealthListStateCopyWithImpl<$Res, LeadHealthListState>;
  @useResult
  $Res call({
    List<Lead> leads,
    int page,
    int pages,
    int total,
    bool isLoadingMore,
  });
}

/// @nodoc
class _$LeadHealthListStateCopyWithImpl<$Res, $Val extends LeadHealthListState>
    implements $LeadHealthListStateCopyWith<$Res> {
  _$LeadHealthListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeadHealthListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leads = null,
    Object? page = null,
    Object? pages = null,
    Object? total = null,
    Object? isLoadingMore = null,
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
            isLoadingMore: null == isLoadingMore
                ? _value.isLoadingMore
                : isLoadingMore // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LeadHealthListStateImplCopyWith<$Res>
    implements $LeadHealthListStateCopyWith<$Res> {
  factory _$$LeadHealthListStateImplCopyWith(
    _$LeadHealthListStateImpl value,
    $Res Function(_$LeadHealthListStateImpl) then,
  ) = __$$LeadHealthListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<Lead> leads,
    int page,
    int pages,
    int total,
    bool isLoadingMore,
  });
}

/// @nodoc
class __$$LeadHealthListStateImplCopyWithImpl<$Res>
    extends _$LeadHealthListStateCopyWithImpl<$Res, _$LeadHealthListStateImpl>
    implements _$$LeadHealthListStateImplCopyWith<$Res> {
  __$$LeadHealthListStateImplCopyWithImpl(
    _$LeadHealthListStateImpl _value,
    $Res Function(_$LeadHealthListStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LeadHealthListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leads = null,
    Object? page = null,
    Object? pages = null,
    Object? total = null,
    Object? isLoadingMore = null,
  }) {
    return _then(
      _$LeadHealthListStateImpl(
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
        isLoadingMore: null == isLoadingMore
            ? _value.isLoadingMore
            : isLoadingMore // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$LeadHealthListStateImpl extends _LeadHealthListState {
  const _$LeadHealthListStateImpl({
    final List<Lead> leads = const <Lead>[],
    this.page = 1,
    this.pages = 1,
    this.total = 0,
    this.isLoadingMore = false,
  }) : _leads = leads,
       super._();

  final List<Lead> _leads;
  @override
  @JsonKey()
  List<Lead> get leads {
    if (_leads is EqualUnmodifiableListView) return _leads;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_leads);
  }

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int pages;
  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey()
  final bool isLoadingMore;

  @override
  String toString() {
    return 'LeadHealthListState(leads: $leads, page: $page, pages: $pages, total: $total, isLoadingMore: $isLoadingMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadHealthListStateImpl &&
            const DeepCollectionEquality().equals(other._leads, _leads) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_leads),
    page,
    pages,
    total,
    isLoadingMore,
  );

  /// Create a copy of LeadHealthListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadHealthListStateImplCopyWith<_$LeadHealthListStateImpl> get copyWith =>
      __$$LeadHealthListStateImplCopyWithImpl<_$LeadHealthListStateImpl>(
        this,
        _$identity,
      );
}

abstract class _LeadHealthListState extends LeadHealthListState {
  const factory _LeadHealthListState({
    final List<Lead> leads,
    final int page,
    final int pages,
    final int total,
    final bool isLoadingMore,
  }) = _$LeadHealthListStateImpl;
  const _LeadHealthListState._() : super._();

  @override
  List<Lead> get leads;
  @override
  int get page;
  @override
  int get pages;
  @override
  int get total;
  @override
  bool get isLoadingMore;

  /// Create a copy of LeadHealthListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeadHealthListStateImplCopyWith<_$LeadHealthListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
