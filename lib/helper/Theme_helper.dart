import 'package:flutter/material.dart';

MaterialColor getThemeColor(String? condition) {
  if (condition == null || condition.trim().isEmpty) {
    return Colors.blue;
  }

  final status = condition.toLowerCase().trim();

  if (status == 'sunny' || status == 'clear') {
    return Colors.orange;
  }

  if (status.contains('cloudy') ||
      status == 'overcast' ||
      status.contains('mist') ||
      status.contains('fog')) {
    return Colors.blueGrey;
  }

  if (status.contains('thunder') || status.contains('thundery')) {
    return Colors.deepPurple;
  }

  if (status.contains('rain') ||
      status.contains('drizzle') ||
      status.contains('shower')) {
    return Colors.blue;
  }

  if (status.contains('snow') ||
      status.contains('sleet') ||
      status.contains('blizzard') ||
      status.contains('ice') ||
      status.contains('freezing')) {
    return Colors.cyan;
  }

  return Colors.amber;
}
