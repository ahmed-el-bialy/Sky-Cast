import 'package:flutter/material.dart';

Color getAdaptiveContentColor(Color? themeColor) {
  return themeColor == null ? const Color(0xFF475569) : Colors.white;
}

Color getAdaptiveHintColor(Color? themeColor) {
  return themeColor == null ? const Color(0xFF94A3B8) : Colors.white70;
}