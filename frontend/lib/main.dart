import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'services/maps_init_service.dart';
import 'screens/home_screen.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  await MapsInitService.initialize();
  runApp(const ProviderScope(child: AudioTrailApp()));
}

class AudioTrailApp extends StatelessWidget {
  const AudioTrailApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'audio trail',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          secondary: Colors.amber,
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const HomeScreen(),
    );
  }
}
