//TODO:[SHARED-CODE] Move to shared package fyyne-core-v2
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

enum AuthStatus { LOGGED_IN, LOGGED_OUT, IS_LOADING }

const AUTH_TOKEN = 'auth_token';

SharedPreferences? prefs;

class LocalStoreHelper {
  static Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static saveInfo(token) => prefs!.setString(AUTH_TOKEN, token);

  static isAuth() async {
    final token = getUserToken();
    return token.isNotEmpty ? AuthStatus.LOGGED_IN : AuthStatus.LOGGED_OUT;
  }

  static String getUserToken() => prefs!.getString(AUTH_TOKEN) ?? '';

  static Future<bool> removeUserToken() => prefs!.remove(AUTH_TOKEN);

  static Future<bool> clearCustomer() => prefs!.clear();
}
