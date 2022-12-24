import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManager {
  static const String AUTH_TOKEN = 'token';

  Future<void> setTokenValue(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(AUTH_TOKEN, value);
  }

  Future<bool?> getTokenValue() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final response = sharedPreferences.getBool(AUTH_TOKEN) ?? false;
    return response;
  }

  Future<void> logOut() async {
    await setTokenValue(false);
  }
}
