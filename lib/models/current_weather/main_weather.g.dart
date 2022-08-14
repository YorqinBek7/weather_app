// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Main _$MainFromJson(Map<String, dynamic> json) => Main(
      feels_like: (json['feels_like'] as num?)?.toDouble() ?? 0.0,
      humidity: json['humidity'] as int? ?? 0,
      pressure: json['pressure'] as int? ?? 0,
      temp: (json['temp'] as num?)?.toDouble() ?? 0.0,
      temp_max: (json['temp_max'] as num?)?.toDouble() ?? 0.0,
      temp_min: (json['temp_min'] as num?)?.toDouble() ?? 0.0,
      seaLevel: json['sea_level'] as int? ?? 0,
      grndLevel: json['grnd_level'] as int? ?? 0,
    );

Map<String, dynamic> _$MainToJson(Main instance) => <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feels_like,
      'temp_min': instance.temp_min,
      'temp_max': instance.temp_max,
      'sea_level': instance.seaLevel,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'grnd_level': instance.grndLevel,
    };
