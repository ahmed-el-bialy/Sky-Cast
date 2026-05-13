// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityWeatherModel _$CityWeatherModelFromJson(Map<String, dynamic> json) =>
    CityWeatherModel(
      requestTime: DateTime.parse(
        CityWeatherModel._readCurrentData(json, 'last_updated') as String,
      ),
      name: CityWeatherModel._readLocationName(json, 'name') as String,
      weatherImagePath:
          CityWeatherModel._readConditionData(json, 'icon') as String,
      temperature: (CityWeatherModel._readCurrentData(json, 'temp_c') as num)
          .toDouble(),
      status: CityWeatherModel._readConditionData(json, 'text') as String,
      maxTemp: (CityWeatherModel._readForecastData(json, 'maxtemp_c') as num)
          .toDouble(),
      minTemp: (CityWeatherModel._readForecastData(json, 'mintemp_c') as num)
          .toDouble(),
    );

Map<String, dynamic> _$CityWeatherModelToJson(CityWeatherModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'last_updated': instance.requestTime.toIso8601String(),
      'temp_c': instance.temperature,
      'text': instance.status,
      'icon': instance.weatherImagePath,
      'maxtemp_c': instance.maxTemp,
      'mintemp_c': instance.minTemp,
    };
