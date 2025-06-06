import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import '../services/city_service.dart';
import 'site_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _cityController = TextEditingController();
  final _timeController = TextEditingController(text: '2.0');
  final _distanceController = TextEditingController(text: '2.0');
  String? _selectedCity;

  @override
  void dispose() {
    _cityController.dispose();
    _timeController.dispose();
    _distanceController.dispose();
    super.dispose();
  }

  bool get _isFormValid => _selectedCity != null;

  String? _validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (double.tryParse(value) == null) {
      return 'Please enter a valid number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
            children: [
              const TextSpan(text: 'audio tr'),
              TextSpan(
                text: 'ai',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(text: 'l'),
            ],
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TypeAheadField<String>(
              controller: _cityController,
              builder: (context, controller, focusNode) {
                return TextField(
                  controller: controller,
                  focusNode: focusNode,
                  decoration: const InputDecoration(
                    labelText: 'City',
                    hintText: 'Enter a city name',
                    border: OutlineInputBorder(),
                  ),
                );
              },
              suggestionsCallback: CityService.getSuggestions,
              itemBuilder: (context, String suggestion) {
                return ListTile(
                  title: Text(suggestion),
                );
              },
              onSelected: (String suggestion) {
                setState(() {
                  _cityController.text = suggestion;
                  _selectedCity = suggestion;
                });
              },
              emptyBuilder: (context) => const SizedBox(
                height: 50,
                child: Center(
                  child: Text('No cities found'),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _timeController,
              decoration: const InputDecoration(
                labelText: 'Guide Time Length (hours)',
                hintText: 'Enter desired tour duration',
                border: OutlineInputBorder(),
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
              ],
              onChanged: (value) {
                if (_validateNumber(value) == null) {
                  setState(() {});
                }
              },
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _distanceController,
              decoration: const InputDecoration(
                labelText: 'Maximum Walking Distance (miles)',
                hintText: 'Enter maximum walking distance',
                border: OutlineInputBorder(),
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
              ],
              onChanged: (value) {
                if (_validateNumber(value) == null) {
                  setState(() {});
                }
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _isFormValid
                  ? () {
                      final time = double.tryParse(_timeController.text) ?? 2.0;
                      final distance =
                          double.tryParse(_distanceController.text) ?? 2.0;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SiteListScreen(
                            city: _selectedCity!,
                            totalTime: time,
                            totalDistance: distance,
                          ),
                        ),
                      );
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Create Guide'),
            ),
          ],
        ),
      ),
    );
  }
}
