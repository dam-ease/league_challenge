import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  SessionManager._internal();

  SharedPreferences? sharedPreferences;

  static SessionManager _instance = SessionManager._internal();

  factory SessionManager() => _instance;

  static SessionManager get instance => _instance;

  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static const String KEY_AUTH_TOKEN = 'api_key';

  String get authToken => sharedPreferences!.getString(KEY_AUTH_TOKEN) ?? '';
  set authToken(String authToken) =>
      sharedPreferences!.setString(KEY_AUTH_TOKEN, authToken);
}
