import 'dart:convert';

import 'package:authdemo/data/constants/app-constants.dart';
import 'package:authdemo/domain/model/weather.dart';
import 'package:http/http.dart' as http;

class WeatherService {

  Future<Weather> fetchWeatherForecast(double latitude, double longitude) async {
    var url = _buildWeatherEnpoint(latitude, longitude);
    var response = await http.get(url);
    print(response.body);
    Map<String, dynamic> json = jsonDecode(response.body);
    return Weather.fromJson(json["current"]);
  }

  String _buildWeatherEnpoint(double latitude, double longitude) {
    return AppConstants.WEATHER_API_BASE_ENDPOINT + "?lat=$latitude&lon=$longitude&exclude=hourly,minutely&appid=${AppConstants.WEATHER_API_KEY}";
  }

}