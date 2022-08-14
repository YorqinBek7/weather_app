// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hourly _$HourlyFromJson(Map<String, dynamic> json) => Hourly(
      clouds: json['clouds'] as int? ?? 0,
      dew_point: (json['dew_point'] as num?)?.toDouble() ?? 0.0,
      dt: json['dt'] as int? ?? 0,
      feels_like: (json['feels_like'] as num?)?.toDouble() ?? 0.0,
      humidity: json['humidity'] as int? ?? 0,
      pressure: json['pressure'] as int? ?? 0,
      temp: (json['temp'] as num?)?.toDouble() ?? 0.0,
      uvi: (json['uvi'] as num?)?.toDouble() ?? 0.0,
      visibility: json['visibility'] as int? ?? 0,
      wind_deg: json['wind_deg'] as int? ?? 0,
      wind_gust: (json['wind_gust'] as num?)?.toDouble() ?? 0.0,
      wind_speed: (json['wind_speed'] as num?)?.toDouble() ?? 0.0,
      pop: (json['pop'] as num?)?.toDouble() ?? 0,
      weather: (json['weather'] as List<dynamic>?)
              ?.map((e) => WeatherHourly.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$HourlyToJson(Hourly instance) => <String, dynamic>{
      'dt': instance.dt,
      'temp': instance.temp,
      'feels_like': instance.feels_like,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'dew_point': instance.dew_point,
      'uvi': instance.uvi,
      'clouds': instance.clouds,
      'visibility': instance.visibility,
      'wind_speed': instance.wind_speed,
      'wind_deg': instance.wind_deg,
      'wind_gust': instance.wind_gust,
      'weather': instance.weather,
      'pop': instance.pop,
    };
