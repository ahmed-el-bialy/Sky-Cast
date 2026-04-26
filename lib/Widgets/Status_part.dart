
import 'package:flutter/material.dart';

import '../Models/City_Weather_Model.dart';
import '../helper/Text_Color_helper.dart';
import '../helper/Theme_helper.dart';

class StatusPart extends StatelessWidget {
  const StatusPart({
    super.key,
    required this.city,
  });

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
          color: getAdaptiveContentColor(
            getThemeColor(city!.status),
          ),
        ),
      ),
    );
  }
}
