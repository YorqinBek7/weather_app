import 'package:flutter/material.dart';
import 'package:weather_app/models/daily_weather/get_daily_weather.dart';
import 'package:weather_app/presentation/seven_days_screen/extansions/extansions.dart';
import 'package:weather_app/presentation/seven_days_screen/widget/tomorrow_container.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/utils/text_styles.dart';

class SevenDays extends StatefulWidget {
  final GetDealyWeather dailyWeather;
  const SevenDays({super.key, required this.dailyWeather});

  @override
  State<SevenDays> createState() => _SevenDaysState();
}

class _SevenDaysState extends State<SevenDays> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffeebcf),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => {
            Navigator.pop(context),
          },
        ),
        backgroundColor: const Color(0xfffeebcf),
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.aspectRatio * 40)),
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.height * 0.02,
              ),
              width: double.infinity,
              child: Column(
                children: [
                  Row(children: [
                    const Text(
                      "Tomorrow",
                      style: MyTextStyle.w500,
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      "${"${widget.dailyWeather.daily[1].temp.day}".substring(0, 2)}°",
                      style: MyTextStyle.w500,
                    ),
                    Image.network(
                        imagePath(widget.dailyWeather.daily[1].weather[0].icon))
                  ]),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TomorrowInfoContainers(
                          infoText: widget
                              .dailyWeather.daily[1].weather[0].description,
                          image: Image.asset("assets/images/weather.png")),
                      TomorrowInfoContainers(
                          infoText: widget.dailyWeather.daily[1].wind_speed
                              .toString(),
                          image: Image.asset("assets/images/wind.png")),
                      TomorrowInfoContainers(
                          infoText: "${widget.dailyWeather.daily[1].humidity}%",
                          image: Image.asset("assets/images/water_drop.png"))
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: widget.dailyWeather.daily.length,
                itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.025),
                  margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.005),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.aspectRatio * 25)),
                  child: Row(children: [
                    Text(
                      getFormatWeekDays(widget.dailyWeather.daily[index].dt),
                      style: MyTextStyle.w500,
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      "${"${widget.dailyWeather.daily[index].temp.day}".substring(0, 2)}°",
                      style: MyTextStyle.w500,
                    ),
                    Image.network(imagePath(
                        widget.dailyWeather.daily[index].weather[0].icon))
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
