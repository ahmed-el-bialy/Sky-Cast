import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sky_cast/Cubits/get%20Weather%20Cubit/get_Weather_Cubit.dart';
import 'package:sky_cast/Views/Main_View.dart';

import 'Cubits/get Weather Cubit/get_Weather_States.dart';

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

  MaterialColor getThemeColor(String? condition) {
    if (condition == null || condition.trim().isEmpty) {
      return Colors.blue;
    }

    final status = condition.toLowerCase().trim();

    // Sunny / Clear
    if (status == 'sunny' || status == 'clear') {
      return Colors.orange;
    }

    // Cloudy group
    if (status.contains('cloudy') ||
        status == 'overcast' ||
        status.contains('mist') ||
        status.contains('fog')) {
      return Colors.blueGrey;
    }

    // Thunder group (نحطه قبل الـ rain عشان الأولوية)
    if (status.contains('thunder') || status.contains('thundery')) {
      return Colors.deepPurple;
    }

    // Rain group (ديجل + shower + rain)
    if (status.contains('rain') ||
        status.contains('drizzle') ||
        status.contains('shower')) {
      return Colors.blue;
    }

    // Snow / Ice / Freezing group
    if (status.contains('snow') ||
        status.contains('sleet') ||
        status.contains('blizzard') ||
        status.contains('ice') ||
        status.contains('freezing')) {
      return Colors.cyan;
    }

    // fallback
    return Colors.amber;
  }
