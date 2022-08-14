// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Daily _$DailyFromJson(Map<String, dynamic> json) => Daily(
      dt: json['dt'] as int? ?? 0,
      moon_phase: (json['moon_phase'] as num?)?.toDouble() ?? 0.0,
      moonrise: json['moonrise'] as int? ?? 0,
      moonset: json['moonset'] as int? ?? 0,
      sunrise: json['sunrise'] as int? ?? 0,
      sunset: json['sunset'] as int? ?? 0,
      temp: Temp.fromJson(json['temp'] as Map<String, dynamic>),
      feels_like:
          FeelsLike.fromJson(json['feels_like'] as Map<String, dynamic>),
      dew_point: (json['dew_point'] as num?)?.toDouble() ?? 0.0,
      humidity: json['humidity'] as int? ?? 0,
      pressure: json['pressure'] as int? ?? 0,
      wind_deg: json['wind_deg'] as int? ?? 0,
      wind_gust: (json['wind_gust'] as num?)?.toDouble() ?? 0.0,
      wind_speed: (json['wind_speed'] as num?)?.toDouble() ?? 0.0,
      clouds: json['clouds'] as int? ?? 0,
      pop: (json['pop'] as num?)?.toDouble() ?? 0.0,
      uvi: (json['uvi'] as num?)?.toDouble() ?? 0.0,
      weather: (json['weather'] as List<dynamic>?)
              ?.map((e) => WeatherHourly.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$DailyToJson(Daily instance) => <String, dynamic>{
      'dt': instance.dt,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'moonrise': instance.moonrise,
      'moonset': instance.moonset,
      'moon_phase': instance.moon_phase,
      'temp': instance.temp,
      'feels_like': instance.feels_like,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'dew_point': instance.dew_point,
      'wind_speed': instance.wind_speed,
      'wind_deg': instance.wind_deg,
      'wind_gust': instance.wind_gust,
      'weather': instance.weather,
      'clouds': instance.clouds,
      'pop': instance.pop,
      'uvi': instance.uvi,
    };
