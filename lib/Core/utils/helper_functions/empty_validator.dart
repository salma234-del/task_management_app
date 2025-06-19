import 'package:task_management_app/Core/utils/app_strings.dart';

String? emptyValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return AppStrings.emptyField;
  }
  return null;
}
