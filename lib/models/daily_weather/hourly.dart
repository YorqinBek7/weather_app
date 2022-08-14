import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/models/daily_weather/weather_hourly.dart';

part 'hourly.g.dart';

@JsonSerializable()
class Hourly {
  @JsonKey(defaultValue: 0, name: "dt")
  int dt;

  @JsonKey(defaultValue: 0.0, name: "temp")
  double temp;

  @JsonKey(defaultValue: 0.0, name: "feels_like")
  double feels_like;

  @JsonKey(defaultValue: 0, name: "pressure")
  int pressure;

  @JsonKey(defaultValue: 0, name: "humidity")
  int humidity;

  @JsonKey(defaultValue: 0.0, name: "dew_point")
  double dew_point;

  @JsonKey(defaultValue: 0.0, name: "uvi")
  double uvi;

  @JsonKey(defaultValue: 0, name: "clouds")
  int clouds;

  @JsonKey(defaultValue: 0, name: "visibility")
  int visibility;

  @JsonKey(defaultValue: 0.0, name: "wind_speed")
  double wind_speed;

  @JsonKey(defaultValue: 0, name: "wind_deg")
  int wind_deg;

  @JsonKey(defaultValue: 0.0, name: "wind_gust")
  double wind_gust;

  @JsonKey(defaultValue: [], name: "weather")
  List<WeatherHourly> weather;

  @JsonKey(defaultValue: 0, name: "pop")
  double pop;
  Hourly(
      {required this.clouds,
      required this.dew_point,
      required this.dt,
      required this.feels_like,
      required this.humidity,
      required this.pressure,
      required this.temp,
      required this.uvi,
      required this.visibility,
      required this.wind_deg,
      required this.wind_gust,
      required this.wind_speed,
      required this.pop,
      required this.weather});

  factory Hourly.fromJson(Map<String, dynamic> json) {
    return _$HourlyFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HourlyToJson(this);
}
