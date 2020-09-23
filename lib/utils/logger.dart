import 'package:flutter/material.dart';

class Logger {

  static onError(String moduleName, String message){
    debugPrint("$moduleName: $message");
  }

}