// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lead.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Lead _$LeadFromJson(Map<String, dynamic> json) {
  return _Lead.fromJson(json);
}

/// @nodoc
mixin _$Lead {
  String get id => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String? get secondaryPhone => throw _privateConstructorUsedError;
  String? get company => throw _privateConstructorUsedError;
  String? get jobTitle => throw _privateConstructorUsedError;
  String? get enquiryAbout => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;
  LeadSourceDetails? get sourceDetails => throw _privateConstructorUsedError;
  double get potentialValue => throw _privateConstructorUsedError;
  int get leadScore => throw _privateConstructorUsedError;
  bool get isHotLead => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  bool get isReEnquiry => throw _privateConstructorUsedError;
  int get reEnquiryCount => throw _privateConstructorUsedError;
  DateTime? get lastEnquiryDate => throw _privateConstructorUsedError;
  DateTime? get nextFollowUp => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String? get branchId => throw _privateConstructorUsedError;
  LeadAssignee? get assignedTo => throw _privateConstructorUsedError;
  List<LeadProductItem>? get products => throw _privateConstructorUsedError;

  /// Serializes this Lead to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Lead
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeadCopyWith<Lead> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadCopyWith<$Res> {
  factory $LeadCopyWith(Lead value, $Res Function(Lead) then) =
      _$LeadCopyWithImpl<$Res, Lead>;
  @useResult
  $Res call({
    String id,
    String firstName,
    String? lastName,
    String? email,
    String phone,
    String? secondaryPhone,
    String? company,
    String? jobTitle,
    String? enquiryAbout,
    String status,
    String source,
    LeadSourceDetails? sourceDetails,
    double potentialValue,
    int leadScore,
    bool isHotLead,
    List<String> tags,
    bool isReEnquiry,
    int reEnquiryCount,
    DateTime? lastEnquiryDate,
    DateTime? nextFollowUp,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? branchId,
    LeadAssignee? assignedTo,
    List<LeadProductItem>? products,
  });

  $LeadSourceDetailsCopyWith<$Res>? get sourceDetails;
  $LeadAssigneeCopyWith<$Res>? get assignedTo;
}

/// @nodoc
class _$LeadCopyWithImpl<$Res, $Val extends Lead>
    implements $LeadCopyWith<$Res> {
  _$LeadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Lead
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? phone = null,
    Object? secondaryPhone = freezed,
    Object? company = freezed,
    Object? jobTitle = freezed,
    Object? enquiryAbout = freezed,
    Object? status = null,
    Object? source = null,
    Object? sourceDetails = freezed,
    Object? potentialValue = null,
    Object? leadScore = null,
    Object? isHotLead = null,
    Object? tags = null,
    Object? isReEnquiry = null,
    Object? reEnquiryCount = null,
    Object? lastEnquiryDate = freezed,
    Object? nextFollowUp = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? branchId = freezed,
    Object? assignedTo = freezed,
    Object? products = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            firstName: null == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String,
            lastName: freezed == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String?,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            phone: null == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String,
            secondaryPhone: freezed == secondaryPhone
                ? _value.secondaryPhone
                : secondaryPhone // ignore: cast_nullable_to_non_nullable
                      as String?,
            company: freezed == company
                ? _value.company
                : company // ignore: cast_nullable_to_non_nullable
                      as String?,
            jobTitle: freezed == jobTitle
                ? _value.jobTitle
                : jobTitle // ignore: cast_nullable_to_non_nullable
                      as String?,
            enquiryAbout: freezed == enquiryAbout
                ? _value.enquiryAbout
                : enquiryAbout // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            source: null == source
                ? _value.source
                : source // ignore: cast_nullable_to_non_nullable
                      as String,
            sourceDetails: freezed == sourceDetails
                ? _value.sourceDetails
                : sourceDetails // ignore: cast_nullable_to_non_nullable
                      as LeadSourceDetails?,
            potentialValue: null == potentialValue
                ? _value.potentialValue
                : potentialValue // ignore: cast_nullable_to_non_nullable
                      as double,
            leadScore: null == leadScore
                ? _value.leadScore
                : leadScore // ignore: cast_nullable_to_non_nullable
                      as int,
            isHotLead: null == isHotLead
                ? _value.isHotLead
                : isHotLead // ignore: cast_nullable_to_non_nullable
                      as bool,
            tags: null == tags
                ? _value.tags
                : tags // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            isReEnquiry: null == isReEnquiry
                ? _value.isReEnquiry
                : isReEnquiry // ignore: cast_nullable_to_non_nullable
                      as bool,
            reEnquiryCount: null == reEnquiryCount
                ? _value.reEnquiryCount
                : reEnquiryCount // ignore: cast_nullable_to_non_nullable
                      as int,
            lastEnquiryDate: freezed == lastEnquiryDate
                ? _value.lastEnquiryDate
                : lastEnquiryDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            nextFollowUp: freezed == nextFollowUp
                ? _value.nextFollowUp
                : nextFollowUp // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            branchId: freezed == branchId
                ? _value.branchId
                : branchId // ignore: cast_nullable_to_non_nullable
                      as String?,
            assignedTo: freezed == assignedTo
                ? _value.assignedTo
                : assignedTo // ignore: cast_nullable_to_non_nullable
                      as LeadAssignee?,
            products: freezed == products
                ? _value.products
                : products // ignore: cast_nullable_to_non_nullable
                      as List<LeadProductItem>?,
          )
          as $Val,
    );
  }

  /// Create a copy of Lead
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LeadSourceDetailsCopyWith<$Res>? get sourceDetails {
    if (_value.sourceDetails == null) {
      return null;
    }

    return $LeadSourceDetailsCopyWith<$Res>(_value.sourceDetails!, (value) {
      return _then(_value.copyWith(sourceDetails: value) as $Val);
    });
  }

  /// Create a copy of Lead
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LeadAssigneeCopyWith<$Res>? get assignedTo {
    if (_value.assignedTo == null) {
      return null;
    }

    return $LeadAssigneeCopyWith<$Res>(_value.assignedTo!, (value) {
      return _then(_value.copyWith(assignedTo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LeadImplCopyWith<$Res> implements $LeadCopyWith<$Res> {
  factory _$$LeadImplCopyWith(
    _$LeadImpl value,
    $Res Function(_$LeadImpl) then,
  ) = __$$LeadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String firstName,
    String? lastName,
    String? email,
    String phone,
    String? secondaryPhone,
    String? company,
    String? jobTitle,
    String? enquiryAbout,
    String status,
    String source,
    LeadSourceDetails? sourceDetails,
    double potentialValue,
    int leadScore,
    bool isHotLead,
    List<String> tags,
    bool isReEnquiry,
    int reEnquiryCount,
    DateTime? lastEnquiryDate,
    DateTime? nextFollowUp,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? branchId,
    LeadAssignee? assignedTo,
    List<LeadProductItem>? products,
  });

  @override
  $LeadSourceDetailsCopyWith<$Res>? get sourceDetails;
  @override
  $LeadAssigneeCopyWith<$Res>? get assignedTo;
}

/// @nodoc
class __$$LeadImplCopyWithImpl<$Res>
    extends _$LeadCopyWithImpl<$Res, _$LeadImpl>
    implements _$$LeadImplCopyWith<$Res> {
  __$$LeadImplCopyWithImpl(_$LeadImpl _value, $Res Function(_$LeadImpl) _then)
    : super(_value, _then);

  /// Create a copy of Lead
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? phone = null,
    Object? secondaryPhone = freezed,
    Object? company = freezed,
    Object? jobTitle = freezed,
    Object? enquiryAbout = freezed,
    Object? status = null,
    Object? source = null,
    Object? sourceDetails = freezed,
    Object? potentialValue = null,
    Object? leadScore = null,
    Object? isHotLead = null,
    Object? tags = null,
    Object? isReEnquiry = null,
    Object? reEnquiryCount = null,
    Object? lastEnquiryDate = freezed,
    Object? nextFollowUp = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? branchId = freezed,
    Object? assignedTo = freezed,
    Object? products = freezed,
  }) {
    return _then(
      _$LeadImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        firstName: null == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String,
        lastName: freezed == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String?,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        phone: null == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String,
        secondaryPhone: freezed == secondaryPhone
            ? _value.secondaryPhone
            : secondaryPhone // ignore: cast_nullable_to_non_nullable
                  as String?,
        company: freezed == company
            ? _value.company
            : company // ignore: cast_nullable_to_non_nullable
                  as String?,
        jobTitle: freezed == jobTitle
            ? _value.jobTitle
            : jobTitle // ignore: cast_nullable_to_non_nullable
                  as String?,
        enquiryAbout: freezed == enquiryAbout
            ? _value.enquiryAbout
            : enquiryAbout // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        source: null == source
            ? _value.source
            : source // ignore: cast_nullable_to_non_nullable
                  as String,
        sourceDetails: freezed == sourceDetails
            ? _value.sourceDetails
            : sourceDetails // ignore: cast_nullable_to_non_nullable
                  as LeadSourceDetails?,
        potentialValue: null == potentialValue
            ? _value.potentialValue
            : potentialValue // ignore: cast_nullable_to_non_nullable
                  as double,
        leadScore: null == leadScore
            ? _value.leadScore
            : leadScore // ignore: cast_nullable_to_non_nullable
                  as int,
        isHotLead: null == isHotLead
            ? _value.isHotLead
            : isHotLead // ignore: cast_nullable_to_non_nullable
                  as bool,
        tags: null == tags
            ? _value._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        isReEnquiry: null == isReEnquiry
            ? _value.isReEnquiry
            : isReEnquiry // ignore: cast_nullable_to_non_nullable
                  as bool,
        reEnquiryCount: null == reEnquiryCount
            ? _value.reEnquiryCount
            : reEnquiryCount // ignore: cast_nullable_to_non_nullable
                  as int,
        lastEnquiryDate: freezed == lastEnquiryDate
            ? _value.lastEnquiryDate
            : lastEnquiryDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        nextFollowUp: freezed == nextFollowUp
            ? _value.nextFollowUp
            : nextFollowUp // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        branchId: freezed == branchId
            ? _value.branchId
            : branchId // ignore: cast_nullable_to_non_nullable
                  as String?,
        assignedTo: freezed == assignedTo
            ? _value.assignedTo
            : assignedTo // ignore: cast_nullable_to_non_nullable
                  as LeadAssignee?,
        products: freezed == products
            ? _value._products
            : products // ignore: cast_nullable_to_non_nullable
                  as List<LeadProductItem>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadImpl extends _Lead {
  const _$LeadImpl({
    required this.id,
    this.firstName = '',
    this.lastName,
    this.email,
    required this.phone,
    this.secondaryPhone,
    this.company,
    this.jobTitle,
    this.enquiryAbout,
    this.status = 'new',
    this.source = 'manual',
    this.sourceDetails,
    this.potentialValue = 0,
    this.leadScore = 0,
    this.isHotLead = false,
    final List<String> tags = const <String>[],
    this.isReEnquiry = false,
    this.reEnquiryCount = 0,
    this.lastEnquiryDate,
    this.nextFollowUp,
    this.createdAt,
    this.updatedAt,
    this.branchId,
    this.assignedTo,
    final List<LeadProductItem>? products,
  }) : _tags = tags,
       _products = products,
       super._();

  factory _$LeadImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final String firstName;
  @override
  final String? lastName;
  @override
  final String? email;
  @override
  final String phone;
  @override
  final String? secondaryPhone;
  @override
  final String? company;
  @override
  final String? jobTitle;
  @override
  final String? enquiryAbout;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey()
  final String source;
  @override
  final LeadSourceDetails? sourceDetails;
  @override
  @JsonKey()
  final double potentialValue;
  @override
  @JsonKey()
  final int leadScore;
  @override
  @JsonKey()
  final bool isHotLead;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  @JsonKey()
  final bool isReEnquiry;
  @override
  @JsonKey()
  final int reEnquiryCount;
  @override
  final DateTime? lastEnquiryDate;
  @override
  final DateTime? nextFollowUp;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final String? branchId;
  @override
  final LeadAssignee? assignedTo;
  final List<LeadProductItem>? _products;
  @override
  List<LeadProductItem>? get products {
    final value = _products;
    if (value == null) return null;
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Lead(id: $id, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, secondaryPhone: $secondaryPhone, company: $company, jobTitle: $jobTitle, enquiryAbout: $enquiryAbout, status: $status, source: $source, sourceDetails: $sourceDetails, potentialValue: $potentialValue, leadScore: $leadScore, isHotLead: $isHotLead, tags: $tags, isReEnquiry: $isReEnquiry, reEnquiryCount: $reEnquiryCount, lastEnquiryDate: $lastEnquiryDate, nextFollowUp: $nextFollowUp, createdAt: $createdAt, updatedAt: $updatedAt, branchId: $branchId, assignedTo: $assignedTo, products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.secondaryPhone, secondaryPhone) ||
                other.secondaryPhone == secondaryPhone) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.jobTitle, jobTitle) ||
                other.jobTitle == jobTitle) &&
            (identical(other.enquiryAbout, enquiryAbout) ||
                other.enquiryAbout == enquiryAbout) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.sourceDetails, sourceDetails) ||
                other.sourceDetails == sourceDetails) &&
            (identical(other.potentialValue, potentialValue) ||
                other.potentialValue == potentialValue) &&
            (identical(other.leadScore, leadScore) ||
                other.leadScore == leadScore) &&
            (identical(other.isHotLead, isHotLead) ||
                other.isHotLead == isHotLead) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.isReEnquiry, isReEnquiry) ||
                other.isReEnquiry == isReEnquiry) &&
            (identical(other.reEnquiryCount, reEnquiryCount) ||
                other.reEnquiryCount == reEnquiryCount) &&
            (identical(other.lastEnquiryDate, lastEnquiryDate) ||
                other.lastEnquiryDate == lastEnquiryDate) &&
            (identical(other.nextFollowUp, nextFollowUp) ||
                other.nextFollowUp == nextFollowUp) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.assignedTo, assignedTo) ||
                other.assignedTo == assignedTo) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    firstName,
    lastName,
    email,
    phone,
    secondaryPhone,
    company,
    jobTitle,
    enquiryAbout,
    status,
    source,
    sourceDetails,
    potentialValue,
    leadScore,
    isHotLead,
    const DeepCollectionEquality().hash(_tags),
    isReEnquiry,
    reEnquiryCount,
    lastEnquiryDate,
    nextFollowUp,
    createdAt,
    updatedAt,
    branchId,
    assignedTo,
    const DeepCollectionEquality().hash(_products),
  ]);

  /// Create a copy of Lead
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadImplCopyWith<_$LeadImpl> get copyWith =>
      __$$LeadImplCopyWithImpl<_$LeadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadImplToJson(this);
  }
}

abstract class _Lead extends Lead {
  const factory _Lead({
    required final String id,
    final String firstName,
    final String? lastName,
    final String? email,
    required final String phone,
    final String? secondaryPhone,
    final String? company,
    final String? jobTitle,
    final String? enquiryAbout,
    final String status,
    final String source,
    final LeadSourceDetails? sourceDetails,
    final double potentialValue,
    final int leadScore,
    final bool isHotLead,
    final List<String> tags,
    final bool isReEnquiry,
    final int reEnquiryCount,
    final DateTime? lastEnquiryDate,
    final DateTime? nextFollowUp,
    final DateTime? createdAt,
    final DateTime? updatedAt,
    final String? branchId,
    final LeadAssignee? assignedTo,
    final List<LeadProductItem>? products,
  }) = _$LeadImpl;
  const _Lead._() : super._();

  factory _Lead.fromJson(Map<String, dynamic> json) = _$LeadImpl.fromJson;

  @override
  String get id;
  @override
  String get firstName;
  @override
  String? get lastName;
  @override
  String? get email;
  @override
  String get phone;
  @override
  String? get secondaryPhone;
  @override
  String? get company;
  @override
  String? get jobTitle;
  @override
  String? get enquiryAbout;
  @override
  String get status;
  @override
  String get source;
  @override
  LeadSourceDetails? get sourceDetails;
  @override
  double get potentialValue;
  @override
  int get leadScore;
  @override
  bool get isHotLead;
  @override
  List<String> get tags;
  @override
  bool get isReEnquiry;
  @override
  int get reEnquiryCount;
  @override
  DateTime? get lastEnquiryDate;
  @override
  DateTime? get nextFollowUp;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  String? get branchId;
  @override
  LeadAssignee? get assignedTo;
  @override
  List<LeadProductItem>? get products;

  /// Create a copy of Lead
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeadImplCopyWith<_$LeadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
