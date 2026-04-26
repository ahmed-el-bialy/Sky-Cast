import 'package:flutter/material.dart';

import '../Models/City_Weather_Model.dart';
import '../helper/Text_Color_helper.dart';
import '../helper/Theme_helper.dart';

class AdditionalData extends StatelessWidget {
  const AdditionalData({super.key, required this.city});

  final CityWeatherModel? city;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Max Temp : ${city!.maxTemp.round()}°",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: getAdaptiveContentColor(getThemeColor(city!.status)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                height: 20,
                child: VerticalDivider(
                  thickness: 2,
                  color: getAdaptiveContentColor(getThemeColor(city!.status)),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Min Temp : ${city!.minTemp.round()}°",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: getAdaptiveContentColor(getThemeColor(city!.status)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
