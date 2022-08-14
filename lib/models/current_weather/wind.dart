import 'package:json_annotation/json_annotation.dart';

part 'wind.g.dart';

@JsonSerializable()
class Wind {
  @JsonKey(defaultValue: 0, name: "speed")
  double speed;

  @JsonKey(defaultValue: 0, name: "deg")
  int deg;

  @JsonKey(defaultValue: 0, name: "gust")
  double gust;

  Wind({required this.speed, required this.deg, required this.gust});

  factory Wind.fromJson(Map<String, dynamic> json) {
    return _$WindFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WindToJson(this);
}
