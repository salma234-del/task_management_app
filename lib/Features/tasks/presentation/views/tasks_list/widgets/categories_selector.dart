import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/Core/enums/task_category.dart';
import 'package:task_management_app/Core/global/theme/app_theme/app_colors.dart';
import 'package:task_management_app/Core/global/theme/app_theme/app_text_styles.dart';
import 'package:task_management_app/Features/tasks/presentation/cubits/get_tasks_by_category_cubit/get_tasks_by_category_cubit.dart';

class CategoriesSelector extends StatelessWidget {
  const CategoriesSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTasksByCategoryCubit, GetTasksByCategoryState>(
      builder: (context, state) {
        final selectedCategory = state is GetTasksByCategorySuccess ? state.selectedCategory : TaskCategory.all;

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: TaskCategory.values.map((category) {
            final isSelected = category == selectedCategory;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: GestureDetector(
                onTap: () {
                  context.read<GetTasksByCategoryCubit>().getTasksByCategory(category);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.of(context).purble : AppColors.of(context).background,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected ? AppColors.of(context).primary : AppColors.of(context).grey,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
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
}
