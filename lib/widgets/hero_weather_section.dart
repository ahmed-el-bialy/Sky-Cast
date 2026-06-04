import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HeroWeatherSection extends StatelessWidget {
  final String cityName;
  final String updatedTime;
  final String temp;
  final String condition;
  final String? weatherIconUrl;
  final Color textColor;

  const HeroWeatherSection({
    super.key,
    required this.cityName,
    required this.updatedTime,
    required this.temp,
    required this.condition,
    this.weatherIconUrl,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          cityName,
          style: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          updatedTime,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: textColor.withValues(alpha: 0.7),
          ),
        ),
        const SizedBox(height: 18),

        weatherIconUrl != null
            ? CachedNetworkImage(
                imageUrl: "https:$weatherIconUrl",
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              )
            : Icon(Icons.wb_sunny_rounded, size: 100, color: textColor),

        const SizedBox(height: 15),
        Text(
          temp,
          style: TextStyle(
            fontSize: 82,
            fontWeight: FontWeight.w300,
            color: textColor,
          ),
        ),
        Text(
          condition,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ],
    );
  }
}
