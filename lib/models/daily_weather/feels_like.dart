import 'package:json_annotation/json_annotation.dart';

part 'feels_like.g.dart';

@JsonSerializable()
class FeelsLike {
  @JsonKey(defaultValue: 0.0, name: "day")
  double day;

  @JsonKey(defaultValue: 0.0, name: "night")
  double night;

  @JsonKey(defaultValue: 0.0, name: "eve")
  double eve;

  @JsonKey(defaultValue: 0.0, name: "morn")
  double morn;
  FeelsLike({
    required this.day,
    required this.eve,
    required this.morn,
    required this.night,
  });

  factory FeelsLike.fromJson(Map<String, dynamic> json) {
    return _$FeelsLikeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FeelsLikeToJson(this);
}
