// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

NotificationsPage _$NotificationsPageFromJson(Map<String, dynamic> json) {
  return _NotificationsPage.fromJson(json);
}

/// @nodoc
mixin _$NotificationsPage {
  List<AppNotification> get notifications => throw _privateConstructorUsedError;
  int get unreadCount => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;

  /// Serializes this NotificationsPage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationsPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationsPageCopyWith<NotificationsPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsPageCopyWith<$Res> {
  factory $NotificationsPageCopyWith(
    NotificationsPage value,
    $Res Function(NotificationsPage) then,
  ) = _$NotificationsPageCopyWithImpl<$Res, NotificationsPage>;
  @useResult
  $Res call({
    List<AppNotification> notifications,
    int unreadCount,
    int total,
    int totalPages,
    int currentPage,
  });
}

/// @nodoc
class _$NotificationsPageCopyWithImpl<$Res, $Val extends NotificationsPage>
    implements $NotificationsPageCopyWith<$Res> {
  _$NotificationsPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationsPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifications = null,
    Object? unreadCount = null,
    Object? total = null,
    Object? totalPages = null,
    Object? currentPage = null,
  }) {
    return _then(
      _value.copyWith(
            notifications: null == notifications
                ? _value.notifications
                : notifications // ignore: cast_nullable_to_non_nullable
                      as List<AppNotification>,
            unreadCount: null == unreadCount
                ? _value.unreadCount
                : unreadCount // ignore: cast_nullable_to_non_nullable
                      as int,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as int,
            totalPages: null == totalPages
                ? _value.totalPages
                : totalPages // ignore: cast_nullable_to_non_nullable
                      as int,
            currentPage: null == currentPage
                ? _value.currentPage
                : currentPage // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NotificationsPageImplCopyWith<$Res>
    implements $NotificationsPageCopyWith<$Res> {
  factory _$$NotificationsPageImplCopyWith(
    _$NotificationsPageImpl value,
    $Res Function(_$NotificationsPageImpl) then,
  ) = __$$NotificationsPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<AppNotification> notifications,
    int unreadCount,
    int total,
    int totalPages,
    int currentPage,
  });
}

/// @nodoc
class __$$NotificationsPageImplCopyWithImpl<$Res>
    extends _$NotificationsPageCopyWithImpl<$Res, _$NotificationsPageImpl>
    implements _$$NotificationsPageImplCopyWith<$Res> {
  __$$NotificationsPageImplCopyWithImpl(
    _$NotificationsPageImpl _value,
    $Res Function(_$NotificationsPageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationsPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifications = null,
    Object? unreadCount = null,
    Object? total = null,
    Object? totalPages = null,
    Object? currentPage = null,
  }) {
    return _then(
      _$NotificationsPageImpl(
        notifications: null == notifications
            ? _value._notifications
            : notifications // ignore: cast_nullable_to_non_nullable
                  as List<AppNotification>,
        unreadCount: null == unreadCount
            ? _value.unreadCount
            : unreadCount // ignore: cast_nullable_to_non_nullable
                  as int,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int,
        totalPages: null == totalPages
            ? _value.totalPages
            : totalPages // ignore: cast_nullable_to_non_nullable
                  as int,
        currentPage: null == currentPage
            ? _value.currentPage
            : currentPage // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationsPageImpl implements _NotificationsPage {
  const _$NotificationsPageImpl({
    final List<AppNotification> notifications = const [],
    this.unreadCount = 0,
    this.total = 0,
    this.totalPages = 1,
    this.currentPage = 1,
  }) : _notifications = notifications;

  factory _$NotificationsPageImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationsPageImplFromJson(json);

  final List<AppNotification> _notifications;
  @override
  @JsonKey()
  List<AppNotification> get notifications {
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  @override
  @JsonKey()
  final int unreadCount;
  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey()
  final int totalPages;
  @override
  @JsonKey()
  final int currentPage;

  @override
  String toString() {
    return 'NotificationsPage(notifications: $notifications, unreadCount: $unreadCount, total: $total, totalPages: $totalPages, currentPage: $currentPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationsPageImpl &&
            const DeepCollectionEquality().equals(
              other._notifications,
              _notifications,
            ) &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_notifications),
    unreadCount,
    total,
    totalPages,
    currentPage,
  );

  /// Create a copy of NotificationsPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationsPageImplCopyWith<_$NotificationsPageImpl> get copyWith =>
      __$$NotificationsPageImplCopyWithImpl<_$NotificationsPageImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationsPageImplToJson(this);
  }
}

abstract class _NotificationsPage implements NotificationsPage {
  const factory _NotificationsPage({
    final List<AppNotification> notifications,
    final int unreadCount,
    final int total,
    final int totalPages,
    final int currentPage,
  }) = _$NotificationsPageImpl;

  factory _NotificationsPage.fromJson(Map<String, dynamic> json) =
      _$NotificationsPageImpl.fromJson;

  @override
  List<AppNotification> get notifications;
  @override
  int get unreadCount;
  @override
  int get total;
  @override
  int get totalPages;
  @override
  int get currentPage;

  /// Create a copy of NotificationsPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationsPageImplCopyWith<_$NotificationsPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
