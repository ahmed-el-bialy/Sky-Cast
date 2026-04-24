class CityWeatherModel {
  final DateTime requestTime;
  final String name;
  final String weatherImagePath;
  final double temperature;
  final String status;
  final double maxTemp;
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


  }
