import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/Core/di/service_locator.dart';
import 'package:task_management_app/Core/global/theme/app_theme/app_colors.dart';
import 'package:task_management_app/Features/tasks/domain/entities/task_entity.dart';
import 'package:task_management_app/Features/tasks/presentation/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:task_management_app/Features/tasks/presentation/views/add_task/widgets/add_task_view_body.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({
    this.taskToEdit,
    super.key,
  });

  final TaskEntity? taskToEdit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskCubit(sl()),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.of(context).blueBg,
            body: AddTaskViewBody(taskToEdit: taskToEdit),
          ),
        ),
      ),
    );
  }
}
