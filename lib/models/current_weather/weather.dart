import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class CurrentWeather {
  @JsonKey(defaultValue: 0, name: "id")
  int id;
  @JsonKey(defaultValue: "", name: "main")
  String main;
  @JsonKey(defaultValue: "", name: "description")
  String description;
  @JsonKey(defaultValue: "", name: "icon")
  String icon;

  CurrentWeather(
      {required this.description,
      required this.icon,
      required this.id,
      required this.main});
  factory CurrentWeather.fromJson(Map<String, Object?> json) =>
      _$CurrentWeatherFromJson(json);

  Map<String, Object?> toJson() => _$CurrentWeatherToJson(this);
}
