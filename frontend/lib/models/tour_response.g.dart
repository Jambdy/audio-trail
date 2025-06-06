// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TourResponseImpl _$$TourResponseImplFromJson(Map<String, dynamic> json) =>
    _$TourResponseImpl(
      city: json['city'] as String,
      totalTime: (json['totalTime'] as num).toDouble(),
      totalDistance: (json['totalDistance'] as num).toDouble(),
      sites: (json['sites'] as List<dynamic>)
          .map((e) => Site.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TourResponseImplToJson(_$TourResponseImpl instance) =>
    <String, dynamic>{
      'city': instance.city,
      'totalTime': instance.totalTime,
      'totalDistance': instance.totalDistance,
      'sites': instance.sites,
    };
