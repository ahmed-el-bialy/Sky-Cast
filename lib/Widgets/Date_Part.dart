import 'package:flutter/material.dart';

import '../Models/City_Weather_Model.dart';
import '../helper/Text_Color_helper.dart';
import '../helper/Theme_helper.dart';

class DatePart extends StatelessWidget {
  const DatePart({super.key, required this.city});

  final CityWeatherModel? city;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Text(
        "Updated at : Today - ${city!.requestTime.hour}:${city!.requestTime.minute}",
        style: TextStyle(
          fontSize: 20,
          color: getAdaptiveContentColor(getThemeColor(city!.status)),
        ),
      ),
    );
  }
}
