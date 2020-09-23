import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class WeatherEvent extends Equatable {
  WeatherEvent();
}

class WeatherIsFetchingEvent extends WeatherEvent {
  @override
  List<Object> get props => null;
}