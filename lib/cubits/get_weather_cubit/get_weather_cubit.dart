import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sky_cast/models/city_weather_model.dart';
import '../../services/weather_services.dart';
import 'get_weather_states.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(InitialState());

   CityWeatherModel? weatherModel;

  Future<void> getWeather(String value) async {
    try {
      weatherModel = (await WeatherServices().getWeather(value))!;
      emit(SuccessfulWeatherState());
    } catch (e) {
      emit(FailedWeatherState(e.toString()));
    }
  }
}
