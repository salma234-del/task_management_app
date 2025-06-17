import 'package:flutter/material.dart';
import 'package:task_management_app/Core/global/theme/app_colors/app_dark_colors.dart';
import 'package:task_management_app/Core/global/theme/app_colors/app_light_colors.dart';

class AppColors {
  final Color primary;
  final Color secondary;
  final Color background;
  final Color light;
  final Color grey;
  final Color textFormFieldBg;
  final Color dark;
  final Color pink;
  final Color purble;
  final Color blueBg;
  final Color pinkBg;
  final Color primaryText;
  final Color secondaryText;
  final List<Color> cardColors;

  const AppColors._({
    required this.primary,
    required this.secondary,
    required this.background,
    required this.light,
    required this.grey,
    required this.textFormFieldBg,
    required this.dark,
    required this.pink,
    required this.purble,
    required this.blueBg,
    required this.pinkBg,
    required this.primaryText,
    required this.secondaryText,
    required this.cardColors,
  });

  static final AppColors lightTheme = AppColors._(
    primary: primaryColorLight,
    secondary: secondaryColorLight,
    background: backgroundColorLight,
    light: lightColorLight,
    grey: greyColorLight,
    textFormFieldBg: textFormFieldBgLight,
    dark: darkColorLight,
    pink: pinkColorLight,
    purble: purbleColorLight,
    blueBg: blueBgLight,
    pinkBg: pinkBgLight,
    primaryText: primaryTextLight,
    secondaryText: secondaryTextLight,
    cardColors: cardColorsLight,
  );

  static final AppColors darkTheme = AppColors._(
    primary: primaryColorDark,
    secondary: secondaryColorDark,
    background: backgroundColorDark,
    light: lightColorDark,
    grey: greyColorDark,
    textFormFieldBg: textFormFieldBgDark,
    dark: darkColorDark,
    pink: pinkColorDark,
    purble: purbleColorDark,
    blueBg: blueBgDark,
    pinkBg: pinkBgDark,
    primaryText: primaryTextDark,
    secondaryText: secondaryTextDark,
    cardColors: cardColorsDark,
  );

  static AppColors of(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark ? darkTheme : lightTheme;
  }
}
