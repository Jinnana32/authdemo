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

class LocationOnGeolocationError extends LocationState {
  final String _error;

  LocationOnGeolocationError(this._error);

  String get getCoordinates => _error;

  @override
  List<Object> get props => [_error];
}