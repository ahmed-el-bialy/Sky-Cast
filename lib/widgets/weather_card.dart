import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/get_weather_cubit/get_weather_cubit.dart';
import '../helper/theme_helper.dart';
import 'additional_data.dart';
import 'city_part.dart';
import 'date_part.dart';
import 'image_part.dart';
import 'status_part.dart';
import 'temp_data.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    var city = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            getThemeColor(city?.status)[700]!,
            getThemeColor(city?.status)[500]!,
            getThemeColor(city?.status)[200]!,
            getThemeColor(city?.status)[300]!,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.sizeOf(context).height * .08),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.4),
                    spreadRadius: 2,
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    getThemeColor(city?.status)[700]!,
                    getThemeColor(city?.status)[500]!,
                    getThemeColor(city?.status)[200]!,
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 15),
                  DatePart(city: city),
                  CityPart(city: city),
                  ImagePart(city: city),
                  TempData(city: city),
                  StatusPart(city: city),
                  AdditionalData(city: city),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
