import 'package:api_clima_dio/model/model_clima.dart';
import 'package:api_clima_dio/repository/repositotry_clima.dart';
import 'package:flutter/cupertino.dart';

class ControllerClima extends ChangeNotifier {
  final RepositoryClima repository;
  String cidade = '';
  ControllerClima({
    required this.repository,
  });

  Future<void> getRepository() async {
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

  onChange(value) {
    return cidade = value;
  }
}
