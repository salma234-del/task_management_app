import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/Core/global/theme/app_theme/app_colors.dart';

class AppTextStyles {
  final TextStyle text64Bold;
  final TextStyle text24ExtraBold;
  final TextStyle text24Medium;
  final TextStyle text20Regular;
  final TextStyle text18Bold;
  final TextStyle text18Medium;
  final TextStyle text16Medium;
  final TextStyle text14Light;
  final TextStyle text14Regular;
  final TextStyle text14Medium;
  final TextStyle text14Bold;
  final TextStyle text12Medium;
  final TextStyle text12Bold;

  AppTextStyles({
    required this.text64Bold,
    required this.text24ExtraBold,
    required this.text24Medium,
    required this.text20Regular,
    required this.text18Bold,
    required this.text18Medium,
    required this.text16Medium,
    required this.text14Light,
    required this.text14Regular,
    required this.text14Medium,
    required this.text14Bold,
    required this.text12Medium,
    required this.text12Bold,
  });

  static AppTextStyles of(BuildContext context) {
    final colors = AppColors.of(context);

    return AppTextStyles(
      text64Bold: TextStyle(
        fontSize: 64.sp,
        fontWeight: FontWeight.w600,
        color: colors.primaryText,
      ),
      text24ExtraBold: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w900,
        color: colors.primaryText,
      ),
      text24Medium: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w500,
        color: colors.primaryText,
      ),
      text20Regular: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
        color: colors.primaryText,
      ),
      text18Bold: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        color: colors.primary,
      ),
      text18Medium: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: colors.primaryText,
      ),
      text16Medium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: colors.primaryText,
      ),
      text14Light: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w300,
        color: colors.primaryText,
      ),
      text14Regular: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: colors.primaryText,
      ),
      text14Medium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: colors.primaryText,
      ),
      text14Bold: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        color: colors.primaryText,
      ),
      text12Medium: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: colors.primaryText,
      ),
      text12Bold: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w700,
        color: colors.primaryText,
      ),
    );
  }
}
