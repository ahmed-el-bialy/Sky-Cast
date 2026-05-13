import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.cloud_off_outlined, size: 100, color: Colors.blueGrey),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 6.0,
                vertical: 15,
              ),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "There was an Error, please check",
                      style: TextStyle(color: Colors.black, fontSize: 28),
                    ),
                    TextSpan(
                      text: " City name",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: " or ",
                      style: TextStyle(color: Colors.black, fontSize: 28),
                    ),
                    TextSpan(
                      text: "Your Wi-fi Connection",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
