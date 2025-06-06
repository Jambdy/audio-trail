import 'package:freezed_annotation/freezed_annotation.dart';
import 'site.dart';

part 'tour_response.freezed.dart';
part 'tour_response.g.dart';

@freezed
class TourResponse with _$TourResponse {
  const factory TourResponse({
    required String city,
    required double totalTime,
    required double totalDistance,
    required List<Site> sites,
  }) = _TourResponse;

  factory TourResponse.fromJson(Map<String, dynamic> json) =>
      _$TourResponseFromJson(json);
}
