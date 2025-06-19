import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_management_app/Core/utils/app_router.dart';
import 'package:task_management_app/Core/utils/app_strings.dart';
import 'package:task_management_app/Core/utils/helper_functions/show_custom_snack_bar.dart';
import 'package:task_management_app/Core/widgets/empty_data_widget.dart';
import 'package:task_management_app/Features/tasks/domain/entities/task_entity.dart';
import 'package:task_management_app/Features/tasks/presentation/cubits/delete_task_cubit/delete_task_cubit.dart';
import 'package:task_management_app/Features/tasks/presentation/cubits/get_tasks_by_category_cubit/get_tasks_by_category_cubit.dart';
import 'package:task_management_app/Features/tasks/presentation/cubits/update_task_cubit/update_task_cubit.dart';
import 'package:task_management_app/Features/tasks/presentation/views/tasks_list/widgets/task_widget.dart';
import 'package:task_management_app/Features/tasks/presentation/views/tasks_list/widgets/tasks_loading.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<UpdateTaskCubit, UpdateTaskState>(
          listener: (context, state) {
            if (state is UpdateTaskSuccess) {
              _onUpdateTaskSuccess(context);
            } else if (state is UpdateTaskFailure) {
              _onUpdateTaskFailure(context, state);
            }
          },
        ),
        BlocListener<DeleteTaskCubit, DeleteTaskState>(
          listener: (context, state) {
            if (state is DeleteTaskFailure) {
              showCustomSnackBar(
                context: context,
                message: state.error,
                isSuccess: false,
              );
            }
            if (state is DeleteTaskSuccess) {
              showCustomSnackBar(
                context: context,
                message: AppStrings.taskDeleted,
                isSuccess: true,
              );
            }
          },
        ),
      ],
      child: BlocBuilder<GetTasksByCategoryCubit, GetTasksByCategoryState>(
        builder: (context, state) {
          if (state is GetTasksByCategoryLoading) {
            return const TasksLoading();
          } else if (state is GetTasksByCategoryFailure) {
            return Center(child: Text(state.error));
          } else if (state is GetTasksByCategorySuccess) {
            if (state.tasks.isEmpty) {
              return const EmptyDataWidget();
            }
            return ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 16),
              physics: const BouncingScrollPhysics(),
              itemCount: state.tasks.length,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) => TaskWidget(
                task: state.tasks[index],
                category: state.selectedCategory,
                onDone: () => _onDone(context, state, index),
                onUndo: () => _onUndo(context, state, index),
                onDelete: () => _onDelete(context, state, index),
                onEdit: () => _onEdit(context, state, index),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  void _onUpdateTaskFailure(BuildContext context, UpdateTaskFailure state) {
    showCustomSnackBar(
      context: context,
      message: state.error,
      isSuccess: false,
    );
  }

  void _onUpdateTaskSuccess(BuildContext context) {
    showCustomSnackBar(
      context: context,
      message: AppStrings.taskUpdated,
      isSuccess: true,
    );
  }

  void _onUndo(BuildContext context, GetTasksByCategorySuccess state, int index) {
    context.read<UpdateTaskCubit>().updateTask(
          state.tasks[index].copyWith(isCompleted: false),
        );
    context.read<GetTasksByCategoryCubit>().getTasksByCategory(
          state.selectedCategory,
        );
  }

  void _onDone(BuildContext context, GetTasksByCategorySuccess state, int index) {
    context.read<UpdateTaskCubit>().updateTask(state.tasks[index].copyWith(isCompleted: true));
    context.read<GetTasksByCategoryCubit>().getTasksByCategory(
          state.selectedCategory,
        );
  }

  void _onDelete(BuildContext context, GetTasksByCategorySuccess state, int index) {
    context.read<DeleteTaskCubit>().deleteTask(state.tasks[index].id);
    context.read<GetTasksByCategoryCubit>().getTasksByCategory(
          state.selectedCategory,
        );
  }

  void _onEdit(BuildContext context, GetTasksByCategorySuccess state, int index) {
    GoRouter.of(context).push(AppRouter.addTask, extra: state.tasks[index]);
  }
}
