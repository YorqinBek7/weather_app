import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/models/daily_weather/feels_like.dart';
import 'package:weather_app/models/daily_weather/temp.dart';
import 'package:weather_app/models/daily_weather/weather_hourly.dart';

part 'daily.g.dart';

@JsonSerializable()
class Daily {
  @JsonKey(defaultValue: 0, name: "dt")
  int dt;

  @JsonKey(defaultValue: 0, name: "sunrise")
  int sunrise;

  @JsonKey(defaultValue: 0, name: "sunset")
  int sunset;

  @JsonKey(defaultValue: 0, name: "moonrise")
  int moonrise;

  @JsonKey(defaultValue: 0, name: "moonset")
  int moonset;

  @JsonKey(defaultValue: 0.0, name: "moon_phase")
  double moon_phase;

  @JsonKey(name: "temp")
  Temp temp;

  @JsonKey(name: "feels_like")
  FeelsLike feels_like;

  @JsonKey(defaultValue: 0, name: "pressure")
  int pressure;

  @JsonKey(defaultValue: 0, name: "humidity")
  int humidity;

  @JsonKey(defaultValue: 0.0, name: "dew_point")
  double dew_point;

  @JsonKey(defaultValue: 0.0, name: "wind_speed")
  double wind_speed;

  @JsonKey(defaultValue: 0, name: "wind_deg")
  int wind_deg;

  @JsonKey(defaultValue: 0.0, name: "wind_gust")
  double wind_gust;

  @JsonKey(defaultValue: [], name: "weather")
  List<WeatherHourly> weather;

  @JsonKey(defaultValue: 0, name: "clouds")
  int clouds;

  @JsonKey(defaultValue: 0.0, name: "pop")
  double pop;

  @JsonKey(defaultValue: 0.0, name: "uvi")
  double uvi;

  Daily({
    required this.dt,
    required this.moon_phase,
    required this.moonrise,
    required this.moonset,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.feels_like,
    required this.dew_point,
    required this.humidity,
    required this.pressure,
    required this.wind_deg,
    required this.wind_gust,
    required this.wind_speed,
    required this.clouds,
    required this.pop,
    required this.uvi,
    required this.weather,
  });

  factory Daily.fromJson(Map<String, dynamic> json) {
    return _$DailyFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DailyToJson(this);
}
// "clouds": 3,
//             "pop": 0,
//             "uvi": 8.3