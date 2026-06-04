import 'package:flutter/material.dart';

class InitialSearchBody extends StatelessWidget {
  final bool isDefault;
  final Color? currentThemeColor;
  final Color mainViewContentColor;

  const InitialSearchBody({
    super.key,
    required this.isDefault,
    required this.currentThemeColor,
    required this.mainViewContentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isDefault
          ? const Color(0xFFF4F6F9)
          : currentThemeColor!.withValues(alpha: 0.95),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_city_rounded,
              size: 90,
              color: isDefault ? const Color(0xFFCBD5E1) : Colors.white30,
            ),
            const SizedBox(height: 18),
            Text(
              "Type city name to search...",
              style: TextStyle(
                fontSize: 19,
                color: mainViewContentColor.withValues(alpha: 0.7),
                fontWeight: FontWeight.w500,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}