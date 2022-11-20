import 'package:flutter/material.dart';
import 'package:weather_app/models/current_weather/get_current_weather.dart';
import 'package:weather_app/presentation/home_screen/widget/information_containers.dart';

class MainContainers extends StatelessWidget {
  const MainContainers({
    Key? key,
    required this.currentWeather,
    required this.firstTime,
    required this.currentWeatherByLonLat,
  }) : super(key: key);

  final GetCurrentWeather currentWeather;
  final bool firstTime;
  final GetCurrentWeather currentWeatherByLonLat;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InformationContainers(
          text: currentWeather.weather[0].description,
          firstTime: firstTime,
          text2: currentWeatherByLonLat.weather[0].description,
          image: Image.asset("assets/images/weather.png"),
          title: "Weather",
        ),
        InformationContainers(
          text: "${currentWeatherByLonLat.main.feels_like} km/h",
          firstTime: firstTime,
          text2: "${currentWeatherByLonLat.main.feels_like} km/h",
          image: Image.asset("assets/images/wind.png"),
          title: "Wind",
        ),
        InformationContainers(
            text: "${currentWeatherByLonLat.main.humidity} %",
            firstTime: firstTime,
            text2: "${currentWeather.main.humidity} %",
            image: Image.asset("assets/images/water_drop.png"),
            title: "Humudity")
      ],
    );
  }
}
