import 'package:json_annotation/json_annotation.dart';

part 'weather_hourly.g.dart';

@JsonSerializable()
class WeatherHourly {
  @JsonKey(defaultValue: 0, name: "id")
  int id;
  @JsonKey(defaultValue: "", name: "main")
  String main;
  @JsonKey(defaultValue: "", name: "description")
  String description;
  @JsonKey(defaultValue: "", name: "icon")
  String icon;

  WeatherHourly(
      {required this.description,
      required this.icon,
      required this.id,
      required this.main});
  factory WeatherHourly.fromJson(Map<String, Object?> json) =>
      _$WeatherHourlyFromJson(json);

  Map<String, Object?> toJson() => _$WeatherHourlyToJson(this);
}
