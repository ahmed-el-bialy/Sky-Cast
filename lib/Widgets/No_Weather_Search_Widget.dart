import 'package:flutter/material.dart';

class NoWeatherSearchWidget extends StatelessWidget {
  const NoWeatherSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(Icons.search, size: 70),
          ),
          Text(
            "Discover the weather in your city!",
            style: TextStyle(
              fontSize: 42,
              fontFamily: "BilboSwashCaps",
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
