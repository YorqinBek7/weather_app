import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/models/current_weather/clouds.dart';
import 'package:weather_app/models/current_weather/coord.dart';
import 'package:weather_app/models/current_weather/main_weather.dart';
import 'package:weather_app/models/current_weather/sys.dart';
import 'package:weather_app/models/current_weather/weather.dart';
import 'package:weather_app/models/current_weather/wind.dart';

part 'get_current_weather.g.dart';

@JsonSerializable()
class GetCurrentWeather {
  @JsonKey(name: "coord")
  Coord coord;

  @JsonKey(defaultValue: [], name: "weather")
  List<CurrentWeather> weather;

  @JsonKey(defaultValue: "", name: "base")
  String base;

  @JsonKey(name: "main")
  Main main;

  @JsonKey(defaultValue: 0, name: "visibility")
  int visibility;

  @JsonKey(name: "wind")
  Wind wind;

  @JsonKey(name: "clouds")
  Clouds clouds;

  @JsonKey(defaultValue: 0, name: "dt")
  int dt;

  @JsonKey(name: "sys")
  Sys sys;

  @JsonKey(defaultValue: 0, name: "timezone")
  num timezone;

  @JsonKey(defaultValue: 0, name: "id")
  int id;

  @JsonKey(defaultValue: "", name: "name")
  String name;

  @JsonKey(defaultValue: 0, name: "cod")
  num cod;

  GetCurrentWeather(
      {required this.name,
      required this.base,
      required this.clouds,
      required this.cod,
      required this.coord,
      required this.dt,
      required this.id,
      required this.main,
      required this.sys,
      required this.timezone,
      required this.visibility,
      required this.weather,
      required this.wind});

  factory GetCurrentWeather.fromJson(Map<String, dynamic> json) {
    return _$GetCurrentWeatherFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetCurrentWeatherToJson(this);
}
