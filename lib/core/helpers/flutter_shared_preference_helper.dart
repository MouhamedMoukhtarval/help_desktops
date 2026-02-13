import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FlutterSharedPreferenceHelper {
  FlutterSharedPreferenceHelper._();

  /// Remove a value from SharedPreferences with the given [key].
  static Future<bool> removeData(String key) async {
    debugPrint("SharedPreferenceHelper : data with key $key removed");
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.remove(key);
  }

  /// Remove all values and keys from SharedPreferences.
  static Future<bool> clearData() async {
    debugPrint("SharedPreferenceHelper : all data has been removed.");
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.clear();
  }

  /// Saves a [value] with a [key] to SharedPreferences.
  static Future<dynamic> saveData(String key, dynamic value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    debugPrint("SharedPreferenceHelper : save $value with key $key");
    switch (value.runtimeType) {
      case const (String):
        await sharedPreferences.setString(key, value);
        break;
      case const (int):
        await sharedPreferences.setInt(key, value);
        break;
      case const (bool):
        await sharedPreferences.setBool(key, value);
        break;
      case const (double):
        await sharedPreferences.setDouble(key, value);
        break;
      default:
        return null;
    }
  }

  /// Get a boolean value from SharedPreferences with the given [key].
  static Future<bool> getBoolData(String key) async {
    debugPrint("SharedPreferenceHelper : get bool with key $key");
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(key) ?? false;
  }

  /// Get a double value from SharedPreferences with the given [key].
  static Future<double> getDoubleData(String key) async {
    debugPrint("SharedPreferenceHelper : get double with key $key");
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getDouble(key) ?? 0.0;
  }

  /// Get a int value from SharedPreferences with the given [key].
  static Future<int> getIntData(String key) async {
    debugPrint("SharedPreferenceHelper : get int with key $key");
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(key) ?? 0;
  }

  /// Get a int value from SharedPreferences with the given [key].
  static Future<String?> getStringData(String key) async {
    debugPrint("SharedPreferenceHelper : get String with key $key");
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key) ?? '';
  }

  /// Set secure token
  static Future<void> setSecureToken(String token, String value) async {
    final flutterSecureStorage = FlutterSecureStorage();
    debugPrint("FlutterSecureStorage : secure $token with value");
    await flutterSecureStorage.write(key: token, value: value);
  }

  static Future<void> setUserRole(String roleKey, String value) async {
    final fSS = FlutterSecureStorage();
    await fSS.write(key: roleKey, value: value);
  }

  static Future<String?> getUserRole(String userRole) async {
    const fSS = FlutterSecureStorage();
    return await fSS.read(key: userRole);
  }

  /// Get secure token
  static Future<String?> getSecureToken(String token) async {
    const flutterSecureStorage = FlutterSecureStorage();
    debugPrint("FlutterSecureStorage : get secure $token");
    return await flutterSecureStorage.read(key: token);
  }
}
