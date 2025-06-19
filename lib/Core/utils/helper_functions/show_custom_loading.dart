import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:task_management_app/Core/global/theme/app_theme/app_colors.dart';

Future<void> showCustomLoading({
  required BuildContext context,
}) async {
  await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => SpinKitDoubleBounce(
      color: AppColors.of(context).primary,
      size: 50.0,
    ),
  );
}
