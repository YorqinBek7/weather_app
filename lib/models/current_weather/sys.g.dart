// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sys.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sys _$SysFromJson(Map<String, dynamic> json) => Sys(
      country: json['country'] as String? ?? '',
      id: json['id'] as int? ?? 0,
      sunrise: json['sunrise'] as int? ?? 0,
      sunset: json['sunset'] as int? ?? 0,
      type: json['type'] as int? ?? 0,
    );

Map<String, dynamic> _$SysToJson(Sys instance) => <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'country': instance.country,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };
