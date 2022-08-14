// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coord.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coord _$CoordFromJson(Map<String, dynamic> json) => Coord(
      lat: (json['lat'] as num?)?.toDouble() ?? 0.0,
      lon: (json['lon'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$CoordToJson(Coord instance) => <String, dynamic>{
      'lon': instance.lon,
      'lat': instance.lat,
    };
