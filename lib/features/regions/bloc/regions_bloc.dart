import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/region_model.dart';
import '../services/regions_api.dart';
part 'regions_event.dart';
part 'regions_state.dart';

class RegionBloc extends Bloc<RegionEvent, RegionState> {
  RegionBloc() : super(const RegionState()) {
    on<RegionFetched>(
      _onRegionFetched,
    );
  }

  Future<void> _onRegionFetched(RegionFetched event, Emitter<RegionState> emit) async {
    try {
      final regions = await _fetchRegions();
      return emit(RegionState(status: RegionStatus.success, regions: regions));
    } catch(_) {
      emit(const RegionState(status: RegionStatus.failure));
    }
  }

  Future<List<RegionModel>> _fetchRegions() async {
    final regionsApi = RegionsApi(
      Dio(
        BaseOptions(
          contentType: 'application/json',
        ),
      ),
    );
    final apiResponseList = await regionsApi.getRegionsList();
    List<RegionModel> regions = apiResponseList.regions;
    return regions;
  }
}