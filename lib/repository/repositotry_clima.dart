import 'package:api_clima_dio/model/model_clima.dart';
import 'package:dio/dio.dart';

class RepositoryClima {
  Future<ModelClima> fetchClima(cidade) async {
    final url = 'https://goweather.herokuapp.com/weather/$cidade';
    final response = await Dio().get(url);
    final body = response.data;
    final List<ModelForecast> forecastList = [];

    for (final forecast in body['forecast']) {
      final forecastModel = ModelForecast(
        day: forecast['day'],
        temperature: forecast['temperature'],
        wind: forecast['wind'],
      );

      forecastList.add(forecastModel);
    }

    final ModelClima json = ModelClima(
      temperature: body['temperature'],
      wind: body['wind'],
      description: body['description'],
      forecast: forecastList,
    );

    if (response.statusCode == 200) {
      return json;
    } else if (response.statusCode == 404) {
    } else {
      throw Exception('deu erro hahaha');
    }
    return json;
  }
}
