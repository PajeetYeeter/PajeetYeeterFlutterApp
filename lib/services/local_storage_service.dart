import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String userPreferencesKey = 'userPreferences';
  static const String darkThemeKey = 'darkTheme';
  static const String appUsageKey = 'appUsage';

  static LocalStorageService? _instance;
  static SharedPreferences? _preferences;
  static Future<LocalStorageService?> getInstance() async {
    _instance ??= LocalStorageService();
    _preferences ??= await SharedPreferences.getInstance();
    return _instance;
  }

  UserPreferences get userPreferences {
    var userPreferencesJson = _getFromDisk(userPreferencesKey);
    if (userPreferencesJson == null) {
      return UserPreferences.fromJson(
          json.decode('{"darkTheme":false,"appUsage":1}'));
    }
    return UserPreferences.fromJson(json.decode(userPreferencesJson));
  }

  set userPreferences(UserPreferences userPreferencesToSave) {
    saveStringToDisk(
        userPreferencesKey, json.encode(userPreferencesToSave.toJson()));
  }

  dynamic _getFromDisk(String key) {
    var value = _preferences!.get(key);
    return value;
  }

  void saveStringToDisk(String key, String content) {
    _preferences!.setString(userPreferencesKey, content);
  }

  bool get darkTheme => _getFromDisk(darkThemeKey) ?? false;
  set darkTheme(bool value) => _saveToDisk(darkThemeKey, value);

  int get appUsage => _getFromDisk(appUsageKey) ?? 1;
  set appUsage(int value) => _saveToDisk(appUsageKey, value);

  void _saveToDisk<T>(String key, T content) {
    if (content is String) {
      _preferences!.setString(key, content);
    }
    if (content is bool) {
      _preferences!.setBool(key, content);
    }
    if (content is int) {
      _preferences!.setInt(key, content);
    }
    if (content is double) {
      _preferences!.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences!.setStringList(key, content);
    }
  }
}

class UserPreferences {
  final bool? darkTheme;
  final int? appUsage;

  UserPreferences({
    this.darkTheme,
    this.appUsage,
  });

  UserPreferences.fromJson(Map<String, dynamic> json)
      : darkTheme = json['darkTheme'],
        appUsage = json['appUsage'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, String>{};
    data['darkTheme'] = darkTheme;
    data['appUsage'] = appUsage;
    return data;
  }
}
