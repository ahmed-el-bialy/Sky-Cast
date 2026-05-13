import 'package:dio/dio.dart';
import 'package:sky_cast/models/city_weather_model.dart';

import '../helper/constants.dart';

class WeatherServices {
  Dio dio = Dio();

  Future<CityWeatherModel?> getWeather(String cityName) async {
    try {
      Response response = await dio.get(
        "$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1",
      );

      Map<String, dynamic> jsonData = response.data;

      var location = jsonData["location"];
      var current = jsonData["current"];
      var condition = current["condition"];
      var forecast = jsonData["forecast"]["forecastday"][0]["day"];

      CityWeatherModel cityDetails = CityWeatherModel(
        requestTime: DateTime.parse(current["last_updated"]),

        name: location["name"],

        weatherImagePath: "https:${condition["icon"]}",

        temperature: current["temp_c"],

        status: condition["text"],

        maxTemp: forecast["maxtemp_c"],

        minTemp: forecast["mintemp_c"],
      );
      return cityDetails;
    } catch (e) {
      return null;
    }
  }
}
