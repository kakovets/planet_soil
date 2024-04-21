import 'package:json_annotation/json_annotation.dart';
part 'region_model.g.dart';

typedef Json = Map<String, dynamic>;

@JsonSerializable()
class RegionModel {
  final String code;
  final String name;
  @JsonKey(name: 'nameEs')
  final String nameSpanish;
  @JsonKey(name: 'nameFr')
  final String nameFrench;
  final String latitude;
  final String longitude;

  RegionModel({
    required this.code,
    required this.name,
    required this.nameSpanish,
    required this.nameFrench,
    required this.latitude,
    required this.longitude,
  });

  factory RegionModel.fromJson(Json json) => _$RegionModelFromJson(json);
  Json toJson() => _$RegionModelToJson(this);
}