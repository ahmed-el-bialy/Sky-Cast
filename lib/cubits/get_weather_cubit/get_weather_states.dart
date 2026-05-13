class WeatherState {}

class InitialState extends WeatherState {}

class SuccessfulWeatherState extends WeatherState {}

class FailedWeatherState extends WeatherState {
  FailedWeatherState(String errorMassage);
}
