import 'package:api_clima_dio/model/model_clima.dart';
import 'package:api_clima_dio/repository/repositotry_clima.dart';
import 'package:flutter/cupertino.dart';

class ControllerClima extends ChangeNotifier {
  final RepositoryClima repository;
  String cidade = 'Maringa';
  ControllerClima({
    required this.repository,
  });

  Future<void> getClimaByCity() async {
    final modelClima = await repository.fetchClima(cidade);
    mapClima = modelClima;
    notifyListeners();
  }

  ModelClima mapClima = ModelClima(
    temperature: '',
    wind: '',
    description: '',
    forecast: [],
  );

  void onChange(value) {
    cidade = value;
  }

  String getIconClima() {
    if (mapClima.description == 'Sunny') {
      return 'assets/image/iconSunny.jpg';
    } else if (mapClima.description == 'Partly cloudy') {
      return 'assets/image/iconPartlyCloudy.jpg';
    } else if (mapClima.description == 'Patchy rain possible') {
      return 'assets/image/iconPartlyRainPossible.jpg';
    } else {
      return 'assets/image/iconnublado.jpg';
    }
  }
}
