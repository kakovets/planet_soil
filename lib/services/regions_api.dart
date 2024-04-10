import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/http.dart';
import '../models/region_model.dart';
part 'regions_api.g.dart';

@RestApi(baseUrl: "https://api.thecompaniesapi.com/v1/locations/continents")
abstract class RegionsApi {
  factory RegionsApi(Dio dio) = _RegionsApi;

  @GET('')
  Future<ApiResponseList> getRegionsList();

  // example: https://api.thecompaniesapi.com/v1/locations/continents?search=africa
  @GET('')
  Future<ApiResponseList> getRegion(@Query('search') String cont);

}

@JsonSerializable()
class ApiResponseList {
  @JsonKey(name: 'continents')
  final List<RegionModel> regions;
  final Meta meta;

  ApiResponseList({required this.regions, required this.meta});

  factory ApiResponseList.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseListFromJson(json);
}

@JsonSerializable()
class Meta {
  final int currentPage;
  final int firstPage;
  final int lastPage;
  final int perPage;
  final int total;

  Meta({
    required this.currentPage,
    required this.firstPage,
    required this.lastPage,
    required this.perPage,
    required this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}