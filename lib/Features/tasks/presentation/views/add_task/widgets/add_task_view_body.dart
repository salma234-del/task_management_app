import 'package:flutter/material.dart';
import 'package:task_management_app/Core/global/theme/app_theme/app_text_styles.dart';
import 'package:task_management_app/Core/utils/app_strings.dart';
import 'package:task_management_app/Core/utils/assets.dart';
import 'package:task_management_app/Core/widgets/custom_text_form_field.dart';
import 'package:task_management_app/Features/tasks/domain/entities/task.dart';
import 'package:task_management_app/Features/tasks/presentation/views/add_task/widgets/close_icon.dart';

class AddTaskViewBody extends StatefulWidget {
  const AddTaskViewBody({
    this.taskToEdit,
    super.key,
  });
  final Task? taskToEdit;

  @override
  State<AddTaskViewBody> createState() => _AddTaskViewBodyState();
}

class _AddTaskViewBodyState extends State<AddTaskViewBody> {
  final formKey = GlobalKey<FormState>();
  final taskTitleController = TextEditingController();
  final taskDescriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 30),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Expanded(
                    child: Column(
                      children: [
                        Image.asset(Assets.imagesStar),
                        Text(
                          widget.taskToEdit == null
                              ? AppStrings.newTask
                              : AppStrings.editTask,
                          style: AppTextStyles.of(context).text24Medium,
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    child: CloseIcon(),
                  )
                ],
              ),
              const SizedBox(height: 32),
              CustomTextFormField(
                hintText: AppStrings.taskTitle,
                controller: taskTitleController,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: AppStrings.taskDescription,
                controller: taskDescriptionController,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (widget.taskToEdit != null) {
                    } else {}
                  }
                },
                child: Text(
                  widget.taskToEdit == null
                      ? AppStrings.addTask
                      : AppStrings.edit,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
