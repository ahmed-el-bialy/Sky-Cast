import 'package:flutter/material.dart';

import '../models/city_weather_model.dart';
import '../helper/text_color_helper.dart';
import '../helper/theme_helper.dart';

class CityPart extends StatelessWidget {
  const CityPart({super.key, required this.city});

  final CityWeatherModel? city;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 10),
      child: Text(
        city!.name,
        style: TextStyle(
          fontSize: 45,
          fontWeight: FontWeight.w500,
          color: getAdaptiveContentColor(getThemeColor(city!.status)),
        ),
      ),
    );
  }
}
