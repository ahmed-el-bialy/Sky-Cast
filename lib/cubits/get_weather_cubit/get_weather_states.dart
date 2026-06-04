class GetWeatherState {}

class InitialState extends GetWeatherState {}

class SuccessfulWeatherState extends GetWeatherState {}

class FailedWeatherState extends GetWeatherState {
  FailedWeatherState(String errorMassage);
}
