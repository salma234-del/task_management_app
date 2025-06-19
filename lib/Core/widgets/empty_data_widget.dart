import 'package:flutter/material.dart';
import 'package:task_management_app/Core/global/theme/app_theme/app_text_styles.dart';
import 'package:task_management_app/Core/utils/app_strings.dart';
import 'package:task_management_app/Core/utils/assets.dart';

class EmptyDataWidget extends StatelessWidget {
  const EmptyDataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(Assets.imagesNoData),
        const SizedBox(height: 24),
        Text(
          AppStrings.noData,
          style: AppTextStyles.of(context).text16Medium,
        ),
      ],
    );
  }
}
