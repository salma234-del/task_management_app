import 'package:flutter/material.dart';
import 'package:task_management_app/Core/global/theme/app_theme/app_colors.dart';

class CloseIcon extends StatelessWidget {
  const CloseIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topEnd,
      child: CircleAvatar(
        radius: 30,
        backgroundColor: AppColors.of(context).secondary,
        child: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
