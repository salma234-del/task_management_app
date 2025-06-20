import 'package:flutter/material.dart';
import 'package:task_management_app/Core/global/theme/app_theme/app_colors.dart';
import 'package:task_management_app/Core/utils/helper_functions/empty_validator.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    required this.hintText,
    required this.controller,
    this.readOnly = false,
    this.onTap,
    this.onChanged,
    super.key,
  });
  final String hintText;
  final TextEditingController controller;
  final bool readOnly;
  final VoidCallback? onTap;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 21,
            vertical: 28,
          ),
          decoration: BoxDecoration(
            color: AppColors.of(context).textFormFieldBg,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 21,
          ),
          child: TextFormField(
            controller: controller,
            onChanged: onChanged,
            validator: emptyValidator,
            decoration: InputDecoration(
              isDense: true,
              hintText: hintText,
            ),
            readOnly: readOnly,
            onTap: onTap,
          ),
        ),
      ],
    );
  }
}
