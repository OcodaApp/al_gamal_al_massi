import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../assets_path/fonts_path.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: AppColors.createMaterialColor(AppColors.primaryColor),
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.whiteColor),
    indicatorColor: AppColors.primaryColor,
    primaryColor: AppColors.primaryColor,
    useMaterial3: true,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryColor,
      ),
    ),
    scaffoldBackgroundColor: AppColors.whiteColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: AppColors.primaryTextColor,
        fontFamily: FontsPath.inter,
      ),
      bodyLarge: TextStyle(
        color: AppColors.secondaryTextColor,
        fontFamily: FontsPath.inter,
      ),
      titleLarge: TextStyle(
        color: AppColors.whiteColor,
        fontFamily: FontsPath.inter,
      ),
      titleMedium: TextStyle(
        color: AppColors.primaryColor,
        fontFamily: FontsPath.inter,
      ),
      titleSmall: TextStyle(
        color: AppColors.greyTextColor73,
        fontFamily: FontsPath.inter,
      ),
    ),
  );
}
