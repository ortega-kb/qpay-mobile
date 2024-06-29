
import 'package:flutter/material.dart';
import 'package:qpay/core/theme/app_color.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: "Helvetica",
    colorScheme: const ColorScheme.light(primary: AppColor.primary),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: AppColor.background,
    appBarTheme: const AppBarTheme(
      surfaceTintColor: AppColor.background,
      backgroundColor: AppColor.background,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 1,
      backgroundColor: AppColor.surface,
      selectedIconTheme: IconThemeData(color: AppColor.primary),
      selectedLabelStyle: TextStyle(color: AppColor.primary),
      unselectedIconTheme: IconThemeData(color: AppColor.greyColor),
      unselectedLabelStyle: TextStyle(color: AppColor.greyColor),
    ),
  );
}