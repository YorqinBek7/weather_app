import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          "${"$temp".substring(0, 2)}°",
          style: Theme.of(context).textTheme.headline3,
        ),
        Text(
          mainWeather,
          style:
              Theme.of(context).textTheme.headline4!.copyWith(fontSize: 14.sp),
        )
      ],
    );
  }
}
