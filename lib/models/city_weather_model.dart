import 'package:json_annotation/json_annotation.dart';

part 'city_weather_model.g.dart';

@JsonSerializable()
class CityWeatherModel {
  @JsonKey(name: "name", readValue: _readLocationName)
  final String name;

  @JsonKey(name: "last_updated", readValue: _readCurrentData)
  final DateTime requestTime;

  @JsonKey(name: "temp_c", readValue: _readCurrentData)
  final double temperature;

  @JsonKey(name: "text", readValue: _readConditionData)
  final String status;

  @JsonKey(name: "icon", readValue: _readConditionData)
  final String weatherImagePath;

  @JsonKey(name: "maxtemp_c", readValue: _readForecastData)
  final double maxTemp;

  @JsonKey(name: "mintemp_c", readValue: _readForecastData)
  final double minTemp;

  CityWeatherModel({
    required this.requestTime,
    required this.name,
    required this.weatherImagePath,
    required this.temperature,
    required this.status,
    required this.maxTemp,
    required this.minTemp,
  });

  factory CityWeatherModel.fromJson(Map<String, dynamic> json) =>
      _$CityWeatherModelFromJson(json);

  static Object? _readLocationName(Map json, String key) =>
      json['location']['name'];

  static Object? _readCurrentData(Map json, String key) => json['current'][key];

  static Object? _readConditionData(Map json, String key) =>
      json['current']['condition'][key];

  static Object? _readForecastData(Map json, String key) =>
      json['forecast']['forecastday'][0]['day'][key];
}
