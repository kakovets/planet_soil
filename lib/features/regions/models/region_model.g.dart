// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegionModel _$RegionModelFromJson(Map<String, dynamic> json) => RegionModel(
      code: json['code'] as String,
      name: json['name'] as String,
      nameSpanish: json['nameEs'] as String,
      nameFrench: json['nameFr'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
    );

Map<String, dynamic> _$RegionModelToJson(RegionModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'nameEs': instance.nameSpanish,
      'nameFr': instance.nameFrench,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
