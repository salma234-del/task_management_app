import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/Core/di/service_locator.dart';
import 'package:task_management_app/Core/global/theme/app_theme/app_text_styles.dart';
import 'package:task_management_app/Core/utils/app_strings.dart';
import 'package:task_management_app/Core/utils/assets.dart';
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
    return BlocProvider(
      create: (context) => AddTaskCubit(sl()),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 30),
          child: BlocConsumer<AddTaskCubit, AddTaskState>(
            listener: (context, state) {
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
      ),
    );
  }
}
