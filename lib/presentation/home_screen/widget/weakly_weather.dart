import 'package:flutter/material.dart';
import 'package:weather_app/models/daily_weather/get_daily_weather.dart';
import 'package:weather_app/presentation/home_screen/widget/list_view_builder.dart';

class WeeklyWeather extends StatelessWidget {
  const WeeklyWeather({
    Key? key,
    required this.dailyWeather,
  }) : super(key: key);

  final GetDealyWeather dailyWeather;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(
        dailyWeather.hourly.length ~/ 2,
        (index) {
          return ListViewBuilder(
            dateFormat:
                dailyWeather.hourly[index + dailyWeather.hourly.length ~/ 2].dt,
            firstDt: dailyWeather.hourly[0].dt,
            otherDt:
                dailyWeather.hourly[index + dailyWeather.hourly.length ~/ 2].dt,
            image: dailyWeather.hourly[index + dailyWeather.hourly.length ~/ 2]
                .weather[0].icon,
            temp: dailyWeather
                .hourly[index + dailyWeather.hourly.length ~/ 2].temp,
            selectedColor: Colors.white,
            notSelectedColor: Colors.white.withOpacity(0.5),
          );
        },
      ),
    );
  }
}
