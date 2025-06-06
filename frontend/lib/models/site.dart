import 'package:freezed_annotation/freezed_annotation.dart';

part 'site.freezed.dart';
part 'site.g.dart';

@freezed
class Site with _$Site {
  const factory Site({
    required String id,
    required String title,
    required String description,
    required Coordinates coordinates,
    required int order,
  }) = _Site;

  factory Site.fromJson(Map<String, dynamic> json) => _$SiteFromJson(json);
}

@freezed
class Coordinates with _$Coordinates {
  const factory Coordinates({
    required double latitude,
    required double longitude,
  }) = _Coordinates;

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);
}
