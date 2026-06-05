import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sky_cast/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:sky_cast/models/city_suggestion_model.dart';

class CitySuggestionCard extends StatelessWidget {
  final CitySuggestionModel suggestion;
  final bool isDefault;
  final Color mainViewContentColor;
  final Color subViewContentColor;

  const CitySuggestionCard({
    super.key,
    required this.suggestion,
    required this.isDefault,
    required this.mainViewContentColor,
    required this.subViewContentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          BlocProvider.of<GetWeatherCubit>(context).getWeather(suggestion.name);

          Navigator.pop(context);
        },
        child: Container(
          decoration: BoxDecoration(
            color: isDefault
                ? Colors.white
                : Colors.white.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isDefault
                  ? const Color(0xFFE2E8F0)
                  : Colors.white.withValues(alpha: 0.1),
              width: 1,
            ),
            boxShadow: isDefault
                ? [
                    BoxShadow(
                      color: const Color(0xFF0F172A).withValues(alpha: 0.02),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 14.0,
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isDefault
                        ? const Color(0xFFF1F5F9)
                        : Colors.white.withValues(alpha: 0.25),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.location_on_rounded,
                    color: isDefault ? const Color(0xFF64748B) : Colors.white,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        suggestion.name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: mainViewContentColor,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        suggestion.country,
                        style: TextStyle(
                          fontSize: 13,
                          color: subViewContentColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 14,
                  color: isDefault ? const Color(0xFF94A3B8) : Colors.white70,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
