import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      body: Padding(
        padding: EdgeInsets.all(8.0.r),
        child: Column(
          children: [
            Container(
              height: 108.h,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(10.r),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 11.w,
                vertical: 8.h,
              ),
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Tomorrow",
                        style: MyTextStyle.w600.copyWith(fontSize: 7.sp),
                      ),
                      const Spacer(),
                      Text(
                        "${"${widget.dailyWeather.daily[1].temp.day}".substring(0, 2)}°",
                        style: MyTextStyle.w700.copyWith(fontSize: 7.sp),
                      ),
                      Image.network(
                        imagePath(widget.dailyWeather.daily[1].weather[0].icon),
                        width: 32.w,
                        height: 32.h,
                      )
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TomorrowInfoContainers(
                          infoText: widget
                              .dailyWeather.daily[1].weather[0].description,
                          image: Image.asset(
                            "assets/images/weather.png",
                            width: 22,
                            height: 22,
                          )),
                      TomorrowInfoContainers(
                          infoText: widget.dailyWeather.daily[1].wind_speed
                              .toString(),
                          image: Image.asset(
                            "assets/images/wind.png",
                            width: 22,
                            height: 22,
                          )),
                      TomorrowInfoContainers(
                          infoText: "${widget.dailyWeather.daily[1].humidity}%",
                          image: Image.asset(
                            "assets/images/water_drop.png",
                            width: 22,
                            height: 22,
                          ))
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: widget.dailyWeather.daily.length,
                itemBuilder: (context, index) => Container(
                  height: 40.h,
                  padding: EdgeInsets.only(left: 11.w),
                  margin: EdgeInsets.symmetric(vertical: 2.5.h),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(children: [
                    Text(
                      getFormatWeekDays(widget.dailyWeather.daily[index].dt),
                      style: MyTextStyle.w600.copyWith(fontSize: 7.sp),
                    ),
                    const Spacer(),
                    Text(
                      "${"${widget.dailyWeather.daily[index].temp.day}".substring(0, 2)}°",
                      style: MyTextStyle.w700.copyWith(fontSize: 7.sp),
                    ),
                    Image.network(
                      imagePath(
                          widget.dailyWeather.daily[index].weather[0].icon),
                      width: 24.w,
                      height: 24.h,
                    )
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
