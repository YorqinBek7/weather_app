import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/presentation/home_screen/widget/SymbolWhichDaySelected.dart';
import 'package:weather_app/presentation/home_screen/widget/alert_dialog.dart';
import 'package:weather_app/models/current_weather/get_current_weather.dart';
import 'package:weather_app/models/daily_weather/get_daily_weather.dart';
import 'package:weather_app/presentation/home_screen/widget/big_weather_text.dart';
import 'package:weather_app/presentation/home_screen/widget/drawer.dart';
import 'package:weather_app/presentation/home_screen/widget/list_view_builder.dart';
import 'package:weather_app/presentation/home_screen/widget/main_containers.dart';
import 'package:weather_app/presentation/home_screen/widget/select_needed_day.dart';
import 'package:weather_app/presentation/home_screen/widget/weakly_weather.dart';
import 'package:weather_app/presentation/seven_days_screen/seven_days_screen.dart';
import 'package:weather_app/service/api_provider.dart';

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
        drawer: CustomDrawer(
          isOn: isOn,
          onTap: (value) {
            setState(
              () => {
                isOn = value,
                GetStorage().write("isDark", isOn),
                GetStorage().read("isDark")
                    ? AdaptiveTheme.of(context).setDark()
                    : AdaptiveTheme.of(context).setLight()
              },
            );
          },
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Theme.of(context).buttonColor),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarColor: Theme.of(context).scaffoldBackgroundColor,
            statusBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          actions: [
            GestureDetector(
              onTap: () async {
                await searchDialog(context);
              },
              child: Icon(
                Icons.search,
                color: Theme.of(context).buttonColor,
                size: 15.w,
              ),
            ),
            const SizedBox(width: 5)
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            firstTime
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
                  firstTime
                      ? Text(
                          "${currentWeatherByLonLat.name},\n${currentWeatherByLonLat.sys.country}",
                          style: Theme.of(context).textTheme.headline4)
                      : Text(
                          "${currentWeather.name},\n${currentWeather.sys.country}",
                          style: Theme.of(context).textTheme.headline4),
                  Text(
                    time.toString(),
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.w700, color: Colors.grey),
                  ),
                  BigWeatherText(
                    firstTime: firstTime,
                    currentWeatherByLonLat: currentWeatherByLonLat,
                    currentWeather: currentWeather,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  MainContainers(
                      currentWeather: currentWeather,
                      firstTime: firstTime,
                      currentWeatherByLonLat: currentWeatherByLonLat),
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
                      const Spacer(),
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
                          setState(
                            () {
                              isNeededDay = 2;
                            },
                          )
                        },
                        isNeededDay: isNeededDay == 2,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.75.h,
                  ),
                  SymbolOfWhichDaySelected(isNeededDay: isNeededDay),
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
                        WeeklyWeather(dailyWeather: dailyWeather)
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

  searchDialog(BuildContext context) async {
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
    );
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
}
