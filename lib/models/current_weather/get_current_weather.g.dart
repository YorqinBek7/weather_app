// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_current_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCurrentWeather _$GetCurrentWeatherFromJson(Map<String, dynamic> json) =>
    GetCurrentWeather(
      name: json['name'] as String? ?? '',
      base: json['base'] as String? ?? '',
      clouds: Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
      cod: json['cod'] as num? ?? 0,
      coord: Coord.fromJson(json['coord'] as Map<String, dynamic>),
      dt: json['dt'] as int? ?? 0,
      id: json['id'] as int? ?? 0,
      main: Main.fromJson(json['main'] as Map<String, dynamic>),
      sys: Sys.fromJson(json['sys'] as Map<String, dynamic>),
      timezone: json['timezone'] as num? ?? 0,
      visibility: json['visibility'] as int? ?? 0,
      weather: (json['weather'] as List<dynamic>?)
              ?.map((e) => CurrentWeather.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      wind: Wind.fromJson(json['wind'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCurrentWeatherToJson(GetCurrentWeather instance) =>
    <String, dynamic>{
      'coord': instance.coord,
      'weather': instance.weather,
      'base': instance.base,
      'main': instance.main,
      'visibility': instance.visibility,
      'wind': instance.wind,
      'clouds': instance.clouds,
      'dt': instance.dt,
      'sys': instance.sys,
      'timezone': instance.timezone,
      'id': instance.id,
      'name': instance.name,
      'cod': instance.cod,
    };
