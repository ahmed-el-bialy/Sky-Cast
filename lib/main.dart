import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sky_cast/Cubits/get%20Weather%20Cubit/get_Weather_Cubit.dart';
import 'package:sky_cast/Views/Main_View.dart';

import 'Cubits/get Weather Cubit/get_Weather_States.dart';
import 'helper/Theme_helper.dart';

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
                  BlocProvider.of<GetWeatherCubit>(
                    context,
                  ).WeatherModel?.status,
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
