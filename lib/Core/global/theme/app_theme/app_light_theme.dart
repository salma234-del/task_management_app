import 'package:flutter/material.dart';
import 'package:task_management_app/Core/global/theme/app_theme/app_colors.dart';
import 'package:task_management_app/Core/global/theme/app_theme/app_text_styles.dart';
import 'package:task_management_app/Core/utils/app_constants.dart';

class AppLightTheme {
  static ThemeData getTheme(BuildContext context) {
    final colors = AppColors.of(context);

    return ThemeData(
      brightness: Brightness.light,
      primaryColor: colors.primary,
      fontFamily: AppConstants.appFontFamily,
      scaffoldBackgroundColor: colors.background,
      appBarTheme: AppBarTheme(
        backgroundColor: colors.primary,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: colors.light,
          backgroundColor: colors.primary,
          textStyle: AppTextStyles.of(context).text24Medium,
          minimumSize: const Size(215, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colors.background,
        iconSize: 25,
        shape: CircleBorder(),
      ),
      useMaterial3: true,
    );
  }
}
