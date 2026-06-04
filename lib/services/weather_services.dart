import 'package:dio/dio.dart';
import 'package:sky_cast/models/city_suggestion_model.dart';
import 'package:sky_cast/models/city_weather_model.dart';

import '../helper/constants.dart';

class WeatherServices {
  final Dio dio = Dio();

  Future<CityWeatherModel> getWeather(String cityName) async {
    try {
      Response response = await dio.get(
        "$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1",
      );

      return CityWeatherModel.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage =
          e.response?.data['error']['message'] ??
          "Opps, there was an error, try again later";
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception("Something went wrong");
    }
  }

  Future<List<CitySuggestionModel>> getAutocompleteCities(
    String textInput,
  ) async {
    if (textInput.trim().isEmpty) {
      return [];
    }

    try {
      Response response = await dio.get(
        "$baseUrl/search.json?key=$apiKey&q=$textInput",
      );

      List<dynamic> jsonData = response.data;

      List<CitySuggestionModel> suggestionsList = jsonData
          .map((cityMap) => CitySuggestionModel.fromJson(cityMap))
          .toList();

      return suggestionsList;
    } catch (e) {
      return [];
    }
  }
}
