import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/presentation/home_screen/widget/alert_dialog.dart';
import 'package:weather_app/models/current_weather/get_current_weather.dart';
import 'package:weather_app/models/daily_weather/get_daily_weather.dart';
import 'package:weather_app/presentation/home_screen/widget/information_containers.dart';
import 'package:weather_app/presentation/home_screen/widget/list_view_builder.dart';
import 'package:weather_app/presentation/home_screen/widget/main_temp.dart';
import 'package:weather_app/presentation/home_screen/widget/select_needed_day.dart';
import 'package:weather_app/presentation/seven_days_screen/seven_days_screen.dart';
import 'package:weather_app/service/api_provider.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/utils/text_styles.dart';

class HomePage extends StatefulWidget {
  final double lon;
  final double lat;
  const HomePage({super.key, required this.lat, required this.lon});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  bool isError = false;
  int isNeededDay = 0;
  bool firstTime = false;
  var time;
  bool isOn = false;
  late GetCurrentWeather currentWeather;
  late GetCurrentWeather currentWeatherByLonLat;
  late GetDealyWeather dailyWeather;

  @override
  void initState() {
    _init(text: "Tashkent");
    super.initState();
  }

  Future<void> _init({required String text}) async {
    try {
      firstTime = true;
      isLoading = true;
      currentWeatherByLonLat = await ApiProvider.getCurrentByLonLat(
          lat: widget.lat, lon: widget.lon);
      currentWeather =
          await ApiProvider.getCurrentWeatherByText(searchText: text);
      isLoading = false;
      isError = false;
      DateTime dateTime =
          DateTime.fromMillisecondsSinceEpoch(currentWeatherByLonLat.dt * 1000);
      time = DateFormat.MMMEd().format(dateTime);
      dailyWeather = await ApiProvider.getDailyWeatherByLatLon(
          lat: widget.lat, lon: widget.lon);
      setState(() => {});
    } catch (e) {
      isError = true;
      isLoading = false;
      setState(() {});
    }
  }

  Future<void> _daily() async {
    try {
      isLoading = true;
      dailyWeather = await ApiProvider.getDailyWeatherByLatLon(
        lat: currentWeather.coord.lat,
        lon: currentWeather.coord.lon,
      );
      isLoading = false;
      setState(() {});
    } catch (e) {
      isError = true;
      isLoading = false;
    }
  }

  TextEditingController searchController = TextEditingController();
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    if (isLoading == true) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    } else if (isError == true) {
      return const Scaffold(
        body: Center(
          child: Text("Error"),
        ),
      );
    } else {
      return Scaffold(
        drawer: Drawer(
          backgroundColor: const Color(0xfffeebcf),
          child: Column(
            children: [
              SizedBox(height: 50.h),
              Text("Menu", style: MyTextStyle.w500),
              ListTile(
                title: const Text("Change Theme"),
                trailing: Switch(
                  value: isOn,
                  onChanged: ((value) => {
                        setState(
                          () => {
                            isOn = value,
                          },
                        )
                      }),
                ),
              ),
              const ListTile(
                title: Text("Settings"),
                trailing: Icon(Icons.arrow_right),
              ),
              const ListTile(
                title: Text("Settings"),
                trailing: Icon(Icons.arrow_right),
              ),
              const ListTile(
                title: Text("Settings"),
                trailing: Icon(Icons.arrow_right),
              ),
              const Expanded(child: SizedBox()),
              Text(
                "By YorqinBek Yuldashev",
                style: MyTextStyle.w500.copyWith(fontSize: 14.sp),
              ),
            ],
          ),
        ),
        backgroundColor: const Color(0xfffeebcf),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarBrightness: Brightness.light,
              statusBarColor: Color(0xfffeebcf),
              statusBarIconBrightness: Brightness.dark),
          backgroundColor: const Color(0xfffeebcf),
          elevation: 0,
          actions: [
            GestureDetector(
              onTap: () => {
                setState(
                  () => {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialogCustom(
                        searchController: searchController,
                        onPressed: (() async {
                          Navigator.pop(context);
                          await _init(text: searchController.text);
                          firstTime = false;
                          await _daily();
                          setState(() {});
                        }),
                        textForButton: "Search",
                        textForTitle: "Search",
                      ),
                    )
                  },
                )
              },
              child: Icon(
                Icons.search,
                color: Colors.black,
                size: 15.w,
              ),
            ),
            const SizedBox(width: 5)
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            firstTime == true
                ? currentWeather = await ApiProvider.getCurrentByLonLat(
                    lat: widget.lat, lon: widget.lon)
                : currentWeather = await ApiProvider.getCurrentWeatherByText(
                    searchText: searchController.text);
            setState(() {});
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(8.0.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  firstTime == true
                      ? Text(
                          "${currentWeatherByLonLat.name},\n${currentWeatherByLonLat.sys.country}",
                          style: MyTextStyle.w500.copyWith(
                            fontSize: 20.sp,
                          ),
                        )
                      : Text(
                          "${currentWeather.name},\n${currentWeather.sys.country}",
                          style: MyTextStyle.w500.copyWith(fontSize: 20.sp)),
                  Text(
                    time.toString(),
                    style: AdaptiveTheme.of(context)
                        .theme
                        .textTheme
                        .headline5!
                        .copyWith(
                          fontWeight: FontWeight.w700,
                          color: Colors.grey,
                        ),
                  ),
                  Row(
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
                      firstTime == true
                          ? MainTemp(
                              temp: currentWeatherByLonLat.main.temp,
                              mainWeather:
                                  currentWeatherByLonLat.weather[0].main)
                          : MainTemp(
                              temp: currentWeather.main.temp - 273.15,
                              mainWeather: currentWeather.weather[0].main)
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Column(
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
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      SelectNeededDay(
                        text: "Today",
                        onPressed: () {
                          setState(() {
                            isNeededDay = 0;
                            pageController.jumpToPage(0);
                          });
                        },
                        isNeededDay: isNeededDay == 0,
                      ),
                      const SizedBox(width: 10),
                      SelectNeededDay(
                        text: "Tomorrow",
                        onPressed: () => {
                          setState(() {
                            isNeededDay = 1;
                            pageController.jumpToPage(1);
                          })
                        },
                        isNeededDay: isNeededDay == 1,
                      ),
                      const Expanded(child: SizedBox()),
                      SelectNeededDay(
                        text: "Next 7 days >",
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SevenDays(
                                dailyWeather: dailyWeather,
                              ),
                            ),
                          ),
                          setState(() {
                            isNeededDay = 2;
                          })
                        },
                        isNeededDay: isNeededDay == 2,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.75.h,
                  ),
                  Stack(children: [
                    Container(
                      width: double.infinity,
                      height: .5.h,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Positioned(
                      left: isNeededDay == 0
                          ? 8.w
                          : isNeededDay == 1
                              ? 58.w
                              : null,
                      right: isNeededDay > 1 ? 22.w : null,
                      child: Container(
                        width: 10.w,
                        height: 3.h,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(height: 9.h),
                  SizedBox(
                    height: 72.h,
                    child: PageView(
                      controller: pageController,
                      children: [
                        ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: dailyWeather.hourly.length ~/ 2,
                          itemBuilder: (BuildContext context, int index) {
                            return ListViewBuilder(
                                selectedColor: Colors.white,
                                notSelectedColor: Colors.white.withOpacity(0.5),
                                dateFormat: dailyWeather.hourly[index].dt,
                                firstDt: dailyWeather.hourly[0].dt,
                                otherDt: dailyWeather.hourly[index].dt,
                                image:
                                    dailyWeather.hourly[index].weather[0].icon,
                                temp: dailyWeather.hourly[index].temp);
                          },
                        ),

                        ///---------------------------------------------------- Tomorrow-------------------------------------------------
                        ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                            dailyWeather.hourly.length ~/ 2,
                            (index) {
                              return ListViewBuilder(
                                dateFormat: dailyWeather
                                    .hourly[
                                        index + dailyWeather.hourly.length ~/ 2]
                                    .dt,
                                firstDt: dailyWeather.hourly[0].dt,
                                otherDt: dailyWeather
                                    .hourly[
                                        index + dailyWeather.hourly.length ~/ 2]
                                    .dt,
                                image: dailyWeather
                                    .hourly[
                                        index + dailyWeather.hourly.length ~/ 2]
                                    .weather[0]
                                    .icon,
                                temp: dailyWeather
                                    .hourly[
                                        index + dailyWeather.hourly.length ~/ 2]
                                    .temp,
                                selectedColor: Colors.white,
                                notSelectedColor: Colors.white.withOpacity(0.5),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
