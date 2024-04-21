part of 'regions_bloc.dart';

sealed class RegionEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class RegionFetched extends RegionEvent {}