import 'package:papb/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static SharedPreferences? _preferences;

  static Future initializePreference() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future setStateLogin(bool state) async =>
      await _preferences?.setBool(AppConstants.loginStateKey, state);

  static bool getStateLogin() =>
      _preferences?.getBool(AppConstants.loginStateKey) ?? false;
}
