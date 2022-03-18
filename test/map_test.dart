import 'package:flutter_test/flutter_test.dart';

void main() {
  test('description', () {
    var api = {
      'temperature': '+23 °C',
      'wind': '8 km/h',
      'description': 'Light rain shower',
      'forecast': [
        {'day': '1', 'temperature': '+26 °C', 'wind': '3 km/h'},
        {'day': '2', 'temperature': '31 °C', 'wind': '5 km/h'},
        {'day': '3', 'temperature': '28 °C', 'wind': '7 km/h'}
      ]
    };
    expect((api['forecast'] as List)[0]['day'], '1');
  });
}
