// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'regions_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseList _$ApiResponseListFromJson(Map<String, dynamic> json) =>
    ApiResponseList(
      regions: (json['continents'] as List<dynamic>)
          .map((e) => RegionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiResponseListToJson(ApiResponseList instance) =>
    <String, dynamic>{
      'continents': instance.regions,
      'meta': instance.meta,
    };

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      currentPage: json['currentPage'] as int,
      firstPage: json['firstPage'] as int,
      lastPage: json['lastPage'] as int,
      perPage: json['perPage'] as int,
      total: json['total'] as int,
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'currentPage': instance.currentPage,
      'firstPage': instance.firstPage,
      'lastPage': instance.lastPage,
      'perPage': instance.perPage,
      'total': instance.total,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _RegionsApi implements RegionsApi {
  _RegionsApi(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://api.thecompaniesapi.com/v1/locations/continents';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ApiResponseList> getRegionsList() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ApiResponseList>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ApiResponseList.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ApiResponseList> getRegion(String cont) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'search': cont};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ApiResponseList>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ApiResponseList.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
