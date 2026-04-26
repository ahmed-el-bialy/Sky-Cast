import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Cubits/get Weather Cubit/get_Weather_Cubit.dart';
import '../helper/Theme_helper.dart';
import 'Additional_Data.dart';
import 'City_part.dart';
import 'Date_Part.dart';
import 'Image_part.dart';
import 'Status_part.dart';
import 'Temp_Data.dart';

class WeatherCardWidget extends StatelessWidget {
  const WeatherCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var city = BlocProvider.of<GetWeatherCubit>(context).WeatherModel;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.sizeOf(context).height * .08),
          Container(
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
        ],
      ),
    );
  }
}
