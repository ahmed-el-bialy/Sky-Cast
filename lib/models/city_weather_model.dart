import 'package:json_annotation/json_annotation.dart';

part 'city_weather_model.g.dart';

@JsonSerializable()
class CityWeatherModel {
  @JsonKey(name: 'location')
  final LocationModel location;

  @JsonKey(name: 'current')
  final CurrentModel current;

  @JsonKey(name: 'forecast')
  final ForecastModel forecast;

  CityWeatherModel({
    required this.location,
    required this.current,
    required this.forecast,
  });

  factory CityWeatherModel.fromJson(Map<String, dynamic> json) =>
      _$CityWeatherModelFromJson(json);
}

@JsonSerializable()
class LocationModel {
  @JsonKey(name: 'name')
  final String name;

  LocationModel({required this.name});

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
}

@JsonSerializable()
class CurrentModel {
  @JsonKey(name: 'last_updated')
  final String lastUpdated;

  @JsonKey(name: 'temp_c')
  final double temperature;

  @JsonKey(name: 'condition')
  final ConditionModel condition;

  @JsonKey(name: 'humidity')
  final int humidity;

  @JsonKey(name: 'wind_kph')
  final double windSpeed;

  CurrentModel({
    required this.lastUpdated,
    required this.temperature,
    required this.condition,
    required this.humidity,
    required this.windSpeed,
  });

  factory CurrentModel.fromJson(Map<String, dynamic> json) =>
      _$CurrentModelFromJson(json);
}

@JsonSerializable()
class ConditionModel {
  @JsonKey(name: 'text')
  final String text;

  @JsonKey(name: 'icon')
  final String icon;

  ConditionModel({required this.text, required this.icon});

  factory ConditionModel.fromJson(Map<String, dynamic> json) =>
      _$ConditionModelFromJson(json);
}

@JsonSerializable()
class ForecastModel {
  @JsonKey(name: 'forecastday')
  final List<ForecastDayModel> forecastday;

  ForecastModel({required this.forecastday});

  factory ForecastModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastModelFromJson(json);
}

@JsonSerializable()
class ForecastDayModel {
  @JsonKey(name: 'day')
  final DayDataModel day;

  ForecastDayModel({required this.day});

  factory ForecastDayModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastDayModelFromJson(json);
}

@JsonSerializable()
class DayDataModel {
  @JsonKey(name: 'maxtemp_c')
  final double maxTemp;

  @JsonKey(name: 'mintemp_c')
  final double minTemp;

  DayDataModel({required this.maxTemp, required this.minTemp});

  factory DayDataModel.fromJson(Map<String, dynamic> json) =>
      _$DayDataModelFromJson(json);
}