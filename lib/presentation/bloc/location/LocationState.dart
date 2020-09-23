import 'package:authdemo/domain/model/coordinates.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class LocationState extends Equatable {
  @override
  List<Object> get props => [];
}

class LocationInitialState extends LocationState {}

class LocationOnGeolocationFetched extends LocationState {
  final Coordinates _coordinates;

  LocationOnGeolocationFetched(this._coordinates);

  Coordinates get getCoordinates => _coordinates;

  @override
  List<Object> get props => [_coordinates];
}

class LocationIsShowState extends LocationState {
  final bool _isLocationShown;

  LocationIsShowState(this._isLocationShown);

  bool get getIsLocationShown => _isLocationShown;

  @override
  List<Object> get props => [_isLocationShown];
}