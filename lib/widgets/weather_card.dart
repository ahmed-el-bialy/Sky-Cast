import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/get_weather_cubit/get_weather_cubit.dart';
import '../helper/text_color_helper.dart';
import '../helper/theme_helper.dart';
import 'hero_weather_section.dart';
import 'info_card.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, dynamic>(
      builder: (context, state) {
        var city = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
        final weatherStatus = city?.current.condition.text;

        final themeColor = getThemeColor(weatherStatus);
        final contentColor = getAdaptiveContentColor(themeColor);

        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [themeColor[600]!, themeColor[400]!, themeColor[300]!],
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    const SizedBox(height: 30),

                    HeroWeatherSection(
                      cityName: city?.location.name ?? "Unknown",
                      updatedTime:
                          "Updated: ${city?.current.lastUpdated ?? "N/A"}",
                      temp: "${city?.current.temperature.toInt() ?? 0}°",
                      condition: city?.current.condition.text ?? "Unknown",
                      weatherIconUrl: city?.current.condition.icon,
                      textColor: contentColor,
                    ),

                    const SizedBox(height: 40),

                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1.25,
                      children: [
                        InfoCard(
                          title: "Max Temp",
                          value:
                              "${city?.forecast.forecastday[0].day.maxTemp.toInt() ?? 0}°",
                          icon: Icons.arrow_upward_rounded,
                          iconColor: Colors.redAccent,
                          cardColor: Colors.white.withValues(alpha: 0.15),
                          textColor: contentColor,
                        ),
                        InfoCard(
                          title: "Min Temp",
                          value:
                              "${city?.forecast.forecastday[0].day.minTemp.toInt() ?? 0}°",
                          icon: Icons.arrow_downward_rounded,
                          iconColor: Colors.blueAccent,
                          cardColor: Colors.white.withValues(alpha: 0.15),
                          textColor: contentColor,
                        ),
                        InfoCard(
                          title: "Humidity",
                          value: "${city?.current.humidity ?? 0}%",
                          icon: Icons.water_drop_rounded,
                          iconColor: Colors.cyan,
                          cardColor: Colors.white.withValues(alpha: 0.15),
                          textColor: contentColor,
                        ),
                        InfoCard(
                          title: "Wind Speed",
                          value: "${city?.current.windSpeed.toInt() ?? 0} km/h",
                          icon: Icons.air_rounded,
                          iconColor: Colors.tealAccent,
                          cardColor: Colors.white.withValues(alpha: 0.15),
                          textColor: contentColor,
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
