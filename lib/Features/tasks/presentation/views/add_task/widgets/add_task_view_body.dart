import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_management_app/Core/global/theme/app_theme/app_text_styles.dart';
import 'package:task_management_app/Core/utils/app_strings.dart';
import 'package:task_management_app/Core/utils/assets.dart';
import 'package:task_management_app/Core/utils/helper_functions/show_custom_loading.dart';
import 'package:task_management_app/Core/utils/helper_functions/show_custom_snack_bar.dart';
import 'package:task_management_app/Core/widgets/custom_text_form_field.dart';
import 'package:task_management_app/Features/tasks/domain/entities/task_entity.dart';
import 'package:task_management_app/Features/tasks/presentation/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:task_management_app/Features/tasks/presentation/views/add_task/widgets/close_icon.dart';

class AddTaskViewBody extends StatelessWidget {
  const AddTaskViewBody({
    this.taskToEdit,
    super.key,
  });
  final TaskEntity? taskToEdit;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 30),
        child: BlocConsumer<AddTaskCubit, AddTaskState>(
          listener: (context, state) {
            if (state is AddTaskLoading) {
              _buildAddTaskLoading(context);
            }
            if (state is AddTaskFailure) {
              _buildAddTaskFailure(context, state.error);
            }
            if (state is AddTaskSuccess) {
              _buildAddTaskSuccess(context);
            }
          },
          builder: (context, state) {
            var bloc = context.read<AddTaskCubit>();
            return Form(
              key: bloc.formKey,
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
                              taskToEdit == null
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
                    controller: bloc.taskTitleController,
                  ),
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    hintText: AppStrings.taskDescription,
                    controller: bloc.taskDescriptionController,
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      if (bloc.formKey.currentState!.validate()) {
                        if (taskToEdit != null) {
                        } else {
                          bloc.addTask();
                        }
                      }
                    },
                    child: Text(
                      taskToEdit == null
                          ? AppStrings.addTask
                          : AppStrings.edit,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _buildAddTaskFailure(BuildContext context, String message) {
    Navigator.of(context).pop();
    showCustomSnackBar(
      context: context,
      message: message,
      isSuccess: false,
    );
  }

  void _buildAddTaskSuccess(BuildContext context) {
    GoRouter.of(context).pop();
    showCustomSnackBar(
      context: context,
      message: AppStrings.taskAdded,
      isSuccess: true,
    );
  }

  Future<void> _buildAddTaskLoading(BuildContext context) async {
    await showCustomLoading(context: context);
    if (context.mounted) Navigator.of(context).pop();
  }
}
