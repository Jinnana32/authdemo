import 'dart:convert';
import 'package:authdemo/data/constants/app-constants.dart';
import 'package:authdemo/domain/model/user.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:http/http.dart' as http;
import 'package:authdemo/utils/logger.dart';

class AuthService {

  final FlutterAppAuth appAuth = FlutterAppAuth();

  Future<User> getAuthorization() async {
     try {
      final AuthorizationTokenResponse result =
          await appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          AppConstants.AUTH0_CLIENT_ID,
          AppConstants.AUTH0_REDIRECT_URI,
          issuer: 'https://${AppConstants.AUTH0_DOMAIN}',
          scopes: ['openid', 'profile', 'offline_access'],
          promptValues: ['login']
        ),
      );

      final idToken = parseIdToken(result.idToken);
      final profile = await _getUserDetails(result.accessToken);

      return User(
            name: idToken['name'],
            githubUrl: _parseGithubLink(profile['nickname']));

    } catch (e) {
      Logger.onError("AuthService", e.toString());
      return null;
    }
  }

  String _parseGithubLink(String nickName){
    return "https//github.com/$nickName";
  }

  Map<String, dynamic> parseIdToken(String idToken) {
    final parts = idToken.split(r'.');
    assert(parts.length == 3);

    return jsonDecode(
        utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))));
  }

  Future<Map> _getUserDetails(String accessToken) async {
    final url = 'https://${AppConstants.AUTH0_DOMAIN}/userinfo';
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get user details');
    }
  }

}