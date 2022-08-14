import 'package:json_annotation/json_annotation.dart';

part 'sys.g.dart';

@JsonSerializable()
class Sys {
  @JsonKey(defaultValue: 0, name: "type")
  int type;

  @JsonKey(defaultValue: 0, name: "id")
  int id;

  @JsonKey(defaultValue: "", name: "country")
  String country;

  @JsonKey(defaultValue: 0, name: "sunrise")
  int sunrise;

  @JsonKey(defaultValue: 0, name: "sunset")
  int sunset;

  Sys(
      {required this.country,
      required this.id,
      required this.sunrise,
      required this.sunset,
      required this.type});

  factory Sys.fromJson(Map<String, dynamic> json) {
    return _$SysFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SysToJson(this);
}
