import 'package:authdemo/domain/model/coordinates.dart';
import 'package:authdemo/domain/model/weather.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class WeatherState extends Equatable {
  @override
  List<Object> get props => [];
}

class WeatherInitialState extends WeatherState {}

class WeatherStillFetching extends WeatherState {}

class WeatherFetchingError extends WeatherState {
   final String _error;

  WeatherFetchingError(this._error);

  String get getError => _error;

  @override
  List<Object> get props => [_error];
}

class WeatherFetchingSuccess extends WeatherState {
  final Weather _weather;

  WeatherFetchingSuccess(this._weather);

  Weather get getWeather => _weather;

  @override
  List<Object> get props => [_weather];
}
