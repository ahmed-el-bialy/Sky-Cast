import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sky_cast/views/main_view.dart';
import 'cubits/get_weather_cubit/get_weather_cubit.dart';
import 'cubits/get_weather_cubit/get_weather_states.dart';
import 'helper/theme_helper.dart';

void main() {
  runApp(const SkyCast());
}

class SkyCast extends StatelessWidget {
  const SkyCast({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: BlocBuilder<GetWeatherCubit, GetWeatherState>(
        builder: (context, state) {
          // سحبنا الموديل هنا في متغير سريع برضه عشان الكود يكون أنظف وقابل للقراءة
          final weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;

          return MaterialApp(
            theme: ThemeData(
              useMaterial3: true,
              primarySwatch: getThemeColor(
                weatherModel?.current.condition.text, // المسار الجديد لحالة الطقس لتغيير ثيم التطبيق بالكامل
              ),
            ),
            debugShowCheckedModeBanner: false,
            home: const MainView(),
          );
        },
      ),
    );
  }
}