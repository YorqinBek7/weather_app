import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/current_weather/get_current_weather.dart';
import 'package:weather_app/models/daily_weather/get_daily_weather.dart';

class ApiProvider {
  static Future<GetCurrentWeather> getCurrentWeatherByText(
      {required String searchText}) async {
    try {
      http.Response response = await http.get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?appid=6a0daf06068cd0345758cb6b8feb9cb3&q=$searchText"));
      if (response.statusCode == 200) {
        var jsonMap = jsonDecode(response.body);
        return GetCurrentWeather.fromJson(jsonMap);
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<GetCurrentWeather> getCurrentByLonLat(
      {required double lat, required double lon}) async {
    try {
      http.Response response = await http.get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&units=metric&exclude=minutely,current&appid=6a0daf06068cd0345758cb6b8feb9cb3"));
      if (response.statusCode == 200) {
        var jsonMap = jsonDecode(response.body);
        return GetCurrentWeather.fromJson(jsonMap);
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<GetDealyWeather> getDailyWeatherByLatLon(
      {required double lat, required double lon}) async {
    try {
      http.Response response = await http.get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&units=metric&exclude=minutely,current&appid=6a0daf06068cd0345758cb6b8feb9cb3"));
      if (response.statusCode == 200) {
        var jsonMap = jsonDecode(response.body);
        return GetDealyWeather.fromJson(jsonMap);
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
