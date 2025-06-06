// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SiteImpl _$$SiteImplFromJson(Map<String, dynamic> json) => _$SiteImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      coordinates:
          Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
      order: (json['order'] as num).toInt(),
    );

Map<String, dynamic> _$$SiteImplToJson(_$SiteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'coordinates': instance.coordinates,
      'order': instance.order,
    };

_$CoordinatesImpl _$$CoordinatesImplFromJson(Map<String, dynamic> json) =>
    _$CoordinatesImpl(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$CoordinatesImplToJson(_$CoordinatesImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
