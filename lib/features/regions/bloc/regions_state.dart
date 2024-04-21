part of 'regions_bloc.dart';

enum RegionStatus{ initial, success, failure }

final class RegionState extends Equatable {

  const RegionState({
    this.status = RegionStatus.initial,
    this.regions = const [],
  });

  final RegionStatus status;
  final List<RegionModel> regions;

  @override
  List<Object?> get props => [status, regions];
}