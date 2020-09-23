import 'package:authdemo/utils/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {

  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  final String refreshToken = "refresh_token";

  Future<bool> saveRefreshToken(String refreshToken) async {
    try{
      await secureStorage.write(key: refreshToken, value: refreshToken);
      debugPrint("Token was saved");
      return true;
    } catch(e){
      Logger.onError("Storage service", e.toString());
      return false;
    }
  }

   Future<bool> removeRefreshToken() async {
    try{
      await secureStorage.delete(key: refreshToken);
      return true;
    } catch(e){
      Logger.onError("Storage service", e.toString());
      return false;
    }
  }

}
