import 'package:dio/dio.dart';
import 'package:api_clima_dio/model/model_clima.dart';

class RepositoryClima {
  final Dio dio;
  RepositoryClima({
    required this.dio,
  });
  Future<ModelClima> fetchClima(cidade) async {
    final url = 'https://goweather.herokuapp.com/weather/$cidade';
    final response = await dio.get(url);
    final body = response.data;
    final ModelClima json = ModelClima.fromJson(body);
    if (response.statusCode == 200) {
      return json;
    } else if (response.statusCode == 404) {
    } else {
      throw Exception('deu erro hahaha');
    }
    return json;
  }
}



//injeçao de independecia com modular 

//clean cod e nomeaçao 