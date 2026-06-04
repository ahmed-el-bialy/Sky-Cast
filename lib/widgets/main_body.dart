import 'package:flutter/material.dart';
import 'package:sky_cast/widgets/no_weather_search.dart';
import 'package:sky_cast/widgets/weather_card.dart';

import '../cubits/get_weather_cubit/get_weather_states.dart';
import '../views/error_view.dart';

class MainBody extends StatelessWidget {
  final GetWeatherState state;

  const MainBody({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    if (state is InitialState) {
      return const NoWeatherSearch();
    } else if (state is SuccessfulWeatherState) {
      return const WeatherCard();
    } else {
      return const ErrorView();
    }
  }
}
