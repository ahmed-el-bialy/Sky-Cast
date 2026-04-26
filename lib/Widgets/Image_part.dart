
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sky_cast/helper/Theme_helper.dart';

import '../Models/City_Weather_Model.dart';
import '../helper/Text_Color_helper.dart';

class ImagePart extends StatelessWidget {
  const ImagePart({
    super.key,
    required this.city,
  });

  final CityWeatherModel? city;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * .28,
        child: CachedNetworkImage(
          imageUrl: city!.weatherImagePath,
          fit: BoxFit.fill,
          placeholder: (context, url) => Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(
                color: getAdaptiveContentColor(
                  getThemeColor(city!.status),
                ),
              ),
            ),
          ),
          errorWidget: (context, url, error) =>
              Icon(Icons.error, size: 35),
        ),
      ),
    );
  }
}
