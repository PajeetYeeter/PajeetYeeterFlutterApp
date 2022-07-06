import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../service_locator.dart';
import '../services/local_storage_service.dart';

final currentThemeProvider = StateProvider<bool>((ref) {
  return locator<LocalStorageService>().darkTheme;
});

ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: const Color(0xFF00B4B1),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 28),
    ),
    cardColor: Colors.grey.shade900);

ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: const Color(0xFF00B4B1),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 28),
    ),
    cardColor: Colors.grey.shade100);
