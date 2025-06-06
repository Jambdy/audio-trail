import 'dart:js' as js;
import 'package:flutter/foundation.dart';
import 'config_service.dart';

class MapsInitService {
  static Future<void> initialize() async {
    if (kIsWeb) {
      final apiKey = ConfigService.googleMapsApiKey;
      js.context.callMethod('initGoogleMaps', [apiKey]);
    }
  }
}
