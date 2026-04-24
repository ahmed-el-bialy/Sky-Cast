import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sky_cast/Cubits/get%20Weather%20Cubit/get_Weather_States.dart';
import 'package:sky_cast/Models/City_Weather_Model.dart';

import '../../Services/Weather_Services.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(initialState());

   CityWeatherModel? WeatherModel;

  Future<void> getWeather(String value) async {
    try {
      WeatherModel = (await WeatherServices().getWeather(value))!;
      emit(SuccessfulWeatherState());
    } catch (e) {
      emit(FailedWeatherState(e.toString()));
    }
  }
}
