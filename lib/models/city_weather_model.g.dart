// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityWeatherModel _$CityWeatherModelFromJson(
  Map<String, dynamic> json,
) => CityWeatherModel(
  location: LocationModel.fromJson(json['location'] as Map<String, dynamic>),
  current: CurrentModel.fromJson(json['current'] as Map<String, dynamic>),
  forecast: ForecastModel.fromJson(json['forecast'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CityWeatherModelToJson(CityWeatherModel instance) =>
    <String, dynamic>{
      'location': instance.location,
      'current': instance.current,
      'forecast': instance.forecast,
    };

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) =>
    LocationModel(name: json['name'] as String);

Map<String, dynamic> _$LocationModelToJson(LocationModel instance) =>
    <String, dynamic>{'name': instance.name};

CurrentModel _$CurrentModelFromJson(Map<String, dynamic> json) => CurrentModel(
  lastUpdated: json['last_updated'] as String,
  temperature: (json['temp_c'] as num).toDouble(),
  condition: ConditionModel.fromJson(json['condition'] as Map<String, dynamic>),
  humidity: (json['humidity'] as num).toInt(),
  windSpeed: (json['wind_kph'] as num).toDouble(),
);

Map<String, dynamic> _$CurrentModelToJson(CurrentModel instance) =>
    <String, dynamic>{
      'last_updated': instance.lastUpdated,
      'temp_c': instance.temperature,
      'condition': instance.condition,
      'humidity': instance.humidity,
      'wind_kph': instance.windSpeed,
    };

ConditionModel _$ConditionModelFromJson(Map<String, dynamic> json) =>
    ConditionModel(text: json['text'] as String, icon: json['icon'] as String);

Map<String, dynamic> _$ConditionModelToJson(ConditionModel instance) =>
    <String, dynamic>{'text': instance.text, 'icon': instance.icon};

ForecastModel _$ForecastModelFromJson(Map<String, dynamic> json) =>
    ForecastModel(
      forecastday: (json['forecastday'] as List<dynamic>)
          .map((e) => ForecastDayModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastModelToJson(ForecastModel instance) =>
    <String, dynamic>{'forecastday': instance.forecastday};

ForecastDayModel _$ForecastDayModelFromJson(Map<String, dynamic> json) =>
    ForecastDayModel(
      day: DayDataModel.fromJson(json['day'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForecastDayModelToJson(ForecastDayModel instance) =>
    <String, dynamic>{'day': instance.day};

DayDataModel _$DayDataModelFromJson(Map<String, dynamic> json) => DayDataModel(
  maxTemp: (json['maxtemp_c'] as num).toDouble(),
  minTemp: (json['mintemp_c'] as num).toDouble(),
);

Map<String, dynamic> _$DayDataModelToJson(DayDataModel instance) =>
    <String, dynamic>{
      'maxtemp_c': instance.maxTemp,
      'mintemp_c': instance.minTemp,
    };
