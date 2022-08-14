import 'package:json_annotation/json_annotation.dart';

part 'temp.g.dart';

@JsonSerializable()
class Temp {
  @JsonKey(defaultValue: 0.0, name: "day")
  double day;

  @JsonKey(defaultValue: 0.0, name: "min")
  double min;

  @JsonKey(defaultValue: 0.0, name: "max")
  double max;

  @JsonKey(defaultValue: 0.0, name: "night")
  double night;

  @JsonKey(defaultValue: 0.0, name: "eve")
  double eve;

  @JsonKey(defaultValue: 0.0, name: "morn")
  double morn;

  Temp(
      {required this.day,
      required this.eve,
      required this.max,
      required this.min,
      required this.morn,
      required this.night});

  factory Temp.fromJson(Map<String, dynamic> json) {
    return _$TempFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TempToJson(this);
}
