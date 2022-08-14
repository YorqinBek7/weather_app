import 'package:json_annotation/json_annotation.dart';

part 'coord.g.dart';

@JsonSerializable()
class Coord {
  @JsonKey(defaultValue: 0.0, name: "lon")
  double lon;

  @JsonKey(defaultValue: 0.0, name: "lat")
  double lat;
  Coord({required this.lat, required this.lon});
  factory Coord.fromJson(Map<String, Object?> json) => _$CoordFromJson(json);

  Map<String, Object?> toJson() => _$CoordToJson(this);
}
