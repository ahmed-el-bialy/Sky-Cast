import 'package:flutter/cupertino.dart';
import '../helper/text_color_helper.dart';
import '../helper/theme_helper.dart';
import '../models/city_weather_model.dart';

class TempData extends StatelessWidget {
  const TempData({super.key, required this.city});

  final CityWeatherModel? city;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        "${city!.temperature.round()}°",
        style: TextStyle(
          fontSize: 55,
          fontWeight: FontWeight.bold,
          color: getAdaptiveContentColor(getThemeColor(city!.status)),
        ),
      ),
    );
  }
}
