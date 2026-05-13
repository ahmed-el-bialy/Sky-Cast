import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sky_cast/views/main_view.dart';
import 'cubits/get_weather_cubit/get_weather_cubit.dart';
import 'cubits/get_weather_cubit/get_weather_states.dart';
import 'helper/theme_helper.dart';

void main() {
  runApp(SkyCast());
}

class SkyCast extends StatelessWidget {
  const SkyCast({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
              useMaterial3: true,
              primarySwatch: getThemeColor(
                BlocProvider.of<GetWeatherCubit>(context).weatherModel?.status,
              ),
            ),

            debugShowCheckedModeBanner: false,
            home: MainView(),
          );
        },
      ),
    );
  }
}
