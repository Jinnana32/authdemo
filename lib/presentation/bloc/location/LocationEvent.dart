import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class LocationEvent extends Equatable {
  LocationEvent();
}

class GetGeoLocationEvent extends LocationEvent {
  @override
  List<Object> get props => null;
}
