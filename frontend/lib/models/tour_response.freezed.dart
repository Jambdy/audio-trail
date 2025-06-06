// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tour_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TourResponse _$TourResponseFromJson(Map<String, dynamic> json) {
  return _TourResponse.fromJson(json);
}

/// @nodoc
mixin _$TourResponse {
  String get city => throw _privateConstructorUsedError;
  double get totalTime => throw _privateConstructorUsedError;
  double get totalDistance => throw _privateConstructorUsedError;
  List<Site> get sites => throw _privateConstructorUsedError;

  /// Serializes this TourResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TourResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TourResponseCopyWith<TourResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TourResponseCopyWith<$Res> {
  factory $TourResponseCopyWith(
          TourResponse value, $Res Function(TourResponse) then) =
      _$TourResponseCopyWithImpl<$Res, TourResponse>;
  @useResult
  $Res call(
      {String city, double totalTime, double totalDistance, List<Site> sites});
}

/// @nodoc
class _$TourResponseCopyWithImpl<$Res, $Val extends TourResponse>
    implements $TourResponseCopyWith<$Res> {
  _$TourResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TourResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = null,
    Object? totalTime = null,
    Object? totalDistance = null,
    Object? sites = null,
  }) {
    return _then(_value.copyWith(
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      totalTime: null == totalTime
          ? _value.totalTime
          : totalTime // ignore: cast_nullable_to_non_nullable
              as double,
      totalDistance: null == totalDistance
          ? _value.totalDistance
          : totalDistance // ignore: cast_nullable_to_non_nullable
              as double,
      sites: null == sites
          ? _value.sites
          : sites // ignore: cast_nullable_to_non_nullable
              as List<Site>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TourResponseImplCopyWith<$Res>
    implements $TourResponseCopyWith<$Res> {
  factory _$$TourResponseImplCopyWith(
          _$TourResponseImpl value, $Res Function(_$TourResponseImpl) then) =
      __$$TourResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String city, double totalTime, double totalDistance, List<Site> sites});
}

/// @nodoc
class __$$TourResponseImplCopyWithImpl<$Res>
    extends _$TourResponseCopyWithImpl<$Res, _$TourResponseImpl>
    implements _$$TourResponseImplCopyWith<$Res> {
  __$$TourResponseImplCopyWithImpl(
      _$TourResponseImpl _value, $Res Function(_$TourResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of TourResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = null,
    Object? totalTime = null,
    Object? totalDistance = null,
    Object? sites = null,
  }) {
    return _then(_$TourResponseImpl(
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      totalTime: null == totalTime
          ? _value.totalTime
          : totalTime // ignore: cast_nullable_to_non_nullable
              as double,
      totalDistance: null == totalDistance
          ? _value.totalDistance
          : totalDistance // ignore: cast_nullable_to_non_nullable
              as double,
      sites: null == sites
          ? _value._sites
          : sites // ignore: cast_nullable_to_non_nullable
              as List<Site>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TourResponseImpl implements _TourResponse {
  const _$TourResponseImpl(
      {required this.city,
      required this.totalTime,
      required this.totalDistance,
      required final List<Site> sites})
      : _sites = sites;

  factory _$TourResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TourResponseImplFromJson(json);

  @override
  final String city;
  @override
  final double totalTime;
  @override
  final double totalDistance;
  final List<Site> _sites;
  @override
  List<Site> get sites {
    if (_sites is EqualUnmodifiableListView) return _sites;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sites);
  }

  @override
  String toString() {
    return 'TourResponse(city: $city, totalTime: $totalTime, totalDistance: $totalDistance, sites: $sites)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TourResponseImpl &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.totalTime, totalTime) ||
                other.totalTime == totalTime) &&
            (identical(other.totalDistance, totalDistance) ||
                other.totalDistance == totalDistance) &&
            const DeepCollectionEquality().equals(other._sites, _sites));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, city, totalTime, totalDistance,
      const DeepCollectionEquality().hash(_sites));

  /// Create a copy of TourResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TourResponseImplCopyWith<_$TourResponseImpl> get copyWith =>
      __$$TourResponseImplCopyWithImpl<_$TourResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TourResponseImplToJson(
      this,
    );
  }
}

abstract class _TourResponse implements TourResponse {
  const factory _TourResponse(
      {required final String city,
      required final double totalTime,
      required final double totalDistance,
      required final List<Site> sites}) = _$TourResponseImpl;

  factory _TourResponse.fromJson(Map<String, dynamic> json) =
      _$TourResponseImpl.fromJson;

  @override
  String get city;
  @override
  double get totalTime;
  @override
  double get totalDistance;
  @override
  List<Site> get sites;

  /// Create a copy of TourResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TourResponseImplCopyWith<_$TourResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
