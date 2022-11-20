import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/models/current_weather/get_current_weather.dart';
import 'package:weather_app/presentation/home_screen/widget/main_temp.dart';
import 'package:weather_app/utils/constants.dart';

class BigWeatherText extends StatelessWidget {
  const BigWeatherText({
    Key? key,
    required this.firstTime,
    required this.currentWeatherByLonLat,
    required this.currentWeather,
  }) : super(key: key);

  final bool firstTime;
  final GetCurrentWeather currentWeatherByLonLat;
  final GetCurrentWeather currentWeather;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        firstTime
            ? Image.network(
                imagePath(currentWeatherByLonLat.weather[0].icon),
                width: 83.w,
                height: 80.h,
              )
            : Image.network(
                imagePath(currentWeather.weather[0].icon),
                width: 83.w,
                height: 80.h,
              ),
        firstTime
            ? MainTemp(
                temp: currentWeatherByLonLat.main.temp,
                mainWeather: currentWeatherByLonLat.weather[0].main)
            : MainTemp(
                temp: currentWeather.main.temp - 273.15,
                mainWeather: currentWeather.weather[0].main)
      ],
    );
  }
}
