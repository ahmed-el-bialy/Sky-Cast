import 'package:flutter/cupertino.dart';
import 'package:sky_cast/Models/City_Weather_Model.dart';

import '../helper/Text_Color_helper.dart';
import '../helper/Theme_helper.dart';

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
