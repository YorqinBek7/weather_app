// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_hourly.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherHourly _$WeatherHourlyFromJson(Map<String, dynamic> json) =>
    WeatherHourly(
      description: json['description'] as String? ?? '',
      icon: json['icon'] as String? ?? '',
      id: json['id'] as int? ?? 0,
      main: json['main'] as String? ?? '',
    );

Map<String, dynamic> _$WeatherHourlyToJson(WeatherHourly instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };
