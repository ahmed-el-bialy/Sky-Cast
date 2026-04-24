import 'package:flutter/material.dart';

Color getAdaptiveContentColor(Color backgroundColor) {
  return ThemeData.estimateBrightnessForColor(backgroundColor) ==
          Brightness.dark
      ? Colors.white
      : Colors.black87;
}
