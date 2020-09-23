import 'package:jiffy/jiffy.dart';

class Weather {
  DateTime date;
  double temp;
  String description;
  String main;
  int pressure;
  int humidity;

  Weather.fromJson(Map<String, dynamic> json)
  : date = DateTime.fromMillisecondsSinceEpoch(json["dt"] * 1000),
    temp = json["temp"],
    description = json["weather"][0]["description"],
    main = json["weather"][0]["main"],
    pressure = json["pressure"],
    humidity = json["humidity"];

}