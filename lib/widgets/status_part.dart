import 'package:flutter/material.dart';
import '../helper/text_color_helper.dart';
import '../helper/theme_helper.dart';
import '../models/city_weather_model.dart';

class StatusPart extends StatelessWidget {
  const StatusPart({super.key, required this.city});

  final CityWeatherModel? city;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        city!.status,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w400,
          color: getAdaptiveContentColor(getThemeColor(city!.status)),
        ),
      ),
    );
  }
}
