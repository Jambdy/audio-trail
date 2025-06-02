class CityService {
  // Mock list of cities for development
  static const List<String> _cities = [
    'New York, NY',
    'Los Angeles, CA',
    'Chicago, IL',
    'Houston, TX',
    'Phoenix, AZ',
    'Philadelphia, PA',
    'San Antonio, TX',
    'San Diego, CA',
    'Dallas, TX',
    'San Jose, CA',
  ];

  static Future<List<String>> getSuggestions(String query) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    
    if (query.isEmpty) {
      return [];
    }

    return _cities
        .where((city) => city.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
} 