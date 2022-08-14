import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/models/daily_weather/daily.dart';
import 'package:weather_app/models/daily_weather/hourly.dart';

part 'get_daily_weather.g.dart';

@JsonSerializable()
class GetDealyWeather {
  @JsonKey(defaultValue: 0.0, name: "lat")
  double lat;

  @JsonKey(defaultValue: 0.0, name: "lon")
  double lon;

  @JsonKey(defaultValue: "", name: "timezone")
  String timezone;

  @JsonKey(defaultValue: 0, name: "timezone_offset")
  int timezone_offset;

  @JsonKey(defaultValue: [], name: "hourly")
  List<Hourly> hourly;

  @JsonKey(defaultValue: [], name: "daily")
  List<Daily> daily;

  GetDealyWeather(
      {required this.daily,
      required this.hourly,
      required this.lat,
      required this.lon,
      required this.timezone,
      required this.timezone_offset});

  factory GetDealyWeather.fromJson(Map<String, dynamic> json) {
    return _$GetDealyWeatherFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetDealyWeatherToJson(this);

  @override
  String toString() {
    return "lat: ${lat}, lon:$lon";
  }
}
