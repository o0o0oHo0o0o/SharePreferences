import 'package:shared_preferences/shared_preferences.dart';
class MySharedPreferences {
  static SharedPreferences? _preferences;

  static const _keyUsername = 'username';
  static const _keyBirthday = 'birthday';
  static const _keySexs = 'sexs';

  static Future<void> init() async {
  if (_preferences == null) {
  _preferences = await SharedPreferences.getInstance();
  }
  }

  // Lấy tên người dùng từ SharedPreferences
  static String? getUsername() {
  return _preferences?.getString(_keyUsername);
  }

  // Lưu tên người dùng vào SharedPreferences
  static Future<bool> setUsername(String username) {
  return _preferences!.setString(_keyUsername, username);
  }

  // Lấy ngày sinh từ SharedPreferences
  static DateTime? getBirthday() {
  final birthdayTimestamp = _preferences?.getInt(_keyBirthday);
  return birthdayTimestamp != null
  ? DateTime.fromMillisecondsSinceEpoch(birthdayTimestamp)
      : null;
  }

  // Lưu ngày sinh vào SharedPreferences
  static Future<bool> setBirthday(DateTime birthday) {
  return _preferences!.setInt(_keyBirthday, birthday.millisecondsSinceEpoch);
  }

  // Lấy danh sách giới tính từ SharedPreferences
  static List<String>? getSexs() {
  return _preferences?.getStringList(_keySexs);
  }

  // Lưu danh sách giới tính vào SharedPreferences
  static Future<bool> setSexs(List<String> sexs) {
  return _preferences!.setStringList(_keySexs, sexs);
  }
}
