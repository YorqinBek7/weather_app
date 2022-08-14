// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_daily_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDealyWeather _$GetDealyWeatherFromJson(Map<String, dynamic> json) =>
    GetDealyWeather(
      daily: (json['daily'] as List<dynamic>?)
              ?.map((e) => Daily.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      hourly: (json['hourly'] as List<dynamic>?)
              ?.map((e) => Hourly.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      lat: (json['lat'] as num?)?.toDouble() ?? 0.0,
      lon: (json['lon'] as num?)?.toDouble() ?? 0.0,
      timezone: json['timezone'] as String? ?? '',
      timezone_offset: json['timezone_offset'] as int? ?? 0,
    );

Map<String, dynamic> _$GetDealyWeatherToJson(GetDealyWeather instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      'timezone': instance.timezone,
      'timezone_offset': instance.timezone_offset,
      'hourly': instance.hourly,
      'daily': instance.daily,
    };
