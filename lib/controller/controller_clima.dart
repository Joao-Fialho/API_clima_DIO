import 'package:api_clima_dio/model/model_clima.dart';
import 'package:api_clima_dio/repository/repositotry_clima.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
part 'controller_clima.g.dart';

// abstract class ControllerMobx with Store{
// Observable(ControllerClimaBase);
// }
class ControllerClima = ControllerClimaBase with _$ControllerClima;

abstract class ControllerClimaBase with Store {
  final RepositoryClima repository;

  @observable
  String cidade = 'Maringa';

  ControllerClimaBase({
    required this.repository,
  });
  @action
  Future<void> getClimaByCity() async {
    final modelClima = await repository.fetchClima(cidade);
    mapClima = modelClima;

    // notifyListeners();
  }

  @observable
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
