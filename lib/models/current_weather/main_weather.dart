import 'package:json_annotation/json_annotation.dart';

part 'main_weather.g.dart';

@JsonSerializable()
class Main {
  @JsonKey(defaultValue: 0.0, name: "temp")
  double temp;
  @JsonKey(defaultValue: 0.0, name: "feels_like")
  double feels_like;
  @JsonKey(defaultValue: 0.0, name: "temp_min")
  double temp_min;
  @JsonKey(defaultValue: 0.0, name: "temp_max")
  double temp_max;
  @JsonKey(defaultValue: 0, name: "sea_level")
  int seaLevel;
  @JsonKey(defaultValue: 0, name: "pressure")
  int pressure;
  @JsonKey(defaultValue: 0, name: "humidity")
  int humidity;
  @JsonKey(defaultValue: 0, name: "grnd_level")
  int grndLevel;
  Main({
    required this.feels_like,
    required this.humidity,
    required this.pressure,
    required this.temp,
    required this.temp_max,
    required this.temp_min,
    required this.seaLevel,
    required this.grndLevel,
  });
  factory Main.fromJson(Map<String, Object?> json) => _$MainFromJson(json);
  Map<String, Object?> toJson() => _$MainToJson(this);
}
