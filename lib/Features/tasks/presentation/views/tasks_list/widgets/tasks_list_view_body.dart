import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/Core/enums/task_category.dart';
import 'package:task_management_app/Core/global/theme/app_theme/app_colors.dart';
import 'package:task_management_app/Core/global/theme/app_theme/app_text_styles.dart';
import 'package:task_management_app/Core/widgets/empty_data_widget.dart';
import 'package:task_management_app/Features/tasks/presentation/cubits/get_tasks_by_category_cubit/get_tasks_by_category_cubit.dart';
import 'package:task_management_app/Features/tasks/presentation/views/tasks_list/widgets/task_widget.dart';
import 'package:task_management_app/Features/tasks/presentation/views/tasks_list/widgets/tasks_loading.dart';

class TasksListViewBody extends StatelessWidget {
  const TasksListViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          _buildCategories(context),
          const SizedBox(height: 20),
          Expanded(child: _buildTasksList(context)),
        ],
      ),
    );
  }

  Widget _buildCategories(BuildContext context) {
    return BlocBuilder<GetTasksByCategoryCubit, GetTasksByCategoryState>(
      builder: (context, state) {
        final selectedCategory = state is GetTasksByCategorySuccess
            ? state.selectedCategory
            : TaskCategory.all;

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: TaskCategory.values.map((category) {
            final isSelected = category == selectedCategory;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: GestureDetector(
                onTap: () {
                  context
                      .read<GetTasksByCategoryCubit>()
                      .getTasksByCategory(category);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.of(context).purble
                        : AppColors.of(context).background,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected
                          ? AppColors.of(context).primary
                          : AppColors.of(context).grey,
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                  child: Text(
                    category.name,
                    style: isSelected
                        ? AppTextStyles.of(context).text12Medium
                        : AppTextStyles.of(context).text12Bold.copyWith(
                              color: AppColors.of(context).grey,
                            ),
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildTasksList(BuildContext context) {
    return BlocBuilder<GetTasksByCategoryCubit, GetTasksByCategoryState>(
      builder: (context, state) {
        if (state is GetTasksByCategoryLoading) {
          return TasksLoading();
        } else if (state is GetTasksByCategoryFailure) {
          return Center(child: Text(state.error));
        } else if (state is GetTasksByCategorySuccess) {
          if (state.tasks.isEmpty) {
            return EmptyDataWidget();
          }
          return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 16),
            physics: const BouncingScrollPhysics(),
            itemCount: state.tasks.length,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) => TaskWidget(
              task: state.tasks[index],
              category: state.selectedCategory,
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
