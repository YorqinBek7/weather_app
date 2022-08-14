// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Temp _$TempFromJson(Map<String, dynamic> json) => Temp(
      day: (json['day'] as num?)?.toDouble() ?? 0.0,
      eve: (json['eve'] as num?)?.toDouble() ?? 0.0,
      max: (json['max'] as num?)?.toDouble() ?? 0.0,
      min: (json['min'] as num?)?.toDouble() ?? 0.0,
      morn: (json['morn'] as num?)?.toDouble() ?? 0.0,
      night: (json['night'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$TempToJson(Temp instance) => <String, dynamic>{
      'day': instance.day,
      'min': instance.min,
      'max': instance.max,
      'night': instance.night,
      'eve': instance.eve,
      'morn': instance.morn,
    };
