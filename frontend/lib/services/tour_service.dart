import '../models/site.dart';
import '../models/tour_response.dart';

abstract class TourService {
  Future<TourResponse> getTourSites({
    required String city,
    required double totalTime,
    required double totalDistance,
  });
}

class MockTourService implements TourService {
  @override
  Future<TourResponse> getTourSites({
    required String city,
    required double totalTime,
    required double totalDistance,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // Mock response data
    return TourResponse(
      city: city,
      totalTime: totalTime,
      totalDistance: totalDistance,
      sites: [
        Site(
          id: '1',
          title: 'Central Park',
          description:
              'An iconic urban park spanning 843 acres in the heart of Manhattan. '
              'Features lakes, theaters, ice rinks, and the Central Park Zoo.',
          coordinates:
              const Coordinates(latitude: 40.7829, longitude: -73.9654),
          order: 1,
        ),
        Site(
          id: '2',
          title: 'Metropolitan Museum of Art',
          description:
              'One of the world\'s largest and most comprehensive art museums. '
              'Houses over 2 million works of art spanning 5,000 years of human creativity.',
          coordinates:
              const Coordinates(latitude: 40.7794, longitude: -73.9632),
          order: 2,
        ),
        Site(
          id: '3',
          title: 'Times Square',
          description:
              'Major commercial intersection, tourist destination, entertainment center. '
              'Known for its bright lights, Broadway theaters, and electronic billboards.',
          coordinates:
              const Coordinates(latitude: 40.7580, longitude: -73.9855),
          order: 3,
        ),
      ],
    );
  }
}
