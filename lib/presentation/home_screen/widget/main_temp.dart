import 'package:flutter/material.dart';
import 'package:weather_app/utils/text_styles.dart';

class MainTemp extends StatelessWidget {
  final double temp;
  final String mainWeather;
  const MainTemp({super.key, required this.temp, required this.mainWeather});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${"${temp}".substring(0, 2)}°",
          style: MyTextStyle.w500.copyWith(fontSize: 60),
        ),
        Text(
          mainWeather,
          style: MyTextStyle.w500.copyWith(fontSize: 30),
        )
      ],
    );
  }
}
