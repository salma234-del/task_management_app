import 'package:flutter/material.dart';
import 'package:task_management_app/Core/widgets/custom_snack_bar.dart';

void showCustomSnackBar({
  required BuildContext context,
  required String message,
  required bool isSuccess,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: CustomSnackBar(
        message: message,
        isSuccess: isSuccess,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      duration: const Duration(seconds: 5),
    ),
  );
}
