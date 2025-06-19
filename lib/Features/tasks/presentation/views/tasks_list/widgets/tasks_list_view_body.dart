import 'package:flutter/material.dart';
import 'package:task_management_app/Core/enums/task_category.dart';
import 'package:task_management_app/Core/global/theme/app_theme/app_colors.dart';
import 'package:task_management_app/Core/global/theme/app_theme/app_text_styles.dart';
import 'package:task_management_app/Features/tasks/domain/entities/task_entity.dart';
import 'package:task_management_app/Features/tasks/presentation/views/tasks_list/widgets/task_widget.dart';

class TasksListViewBody extends StatefulWidget {
  const TasksListViewBody({super.key});

  @override
  State<TasksListViewBody> createState() => _TasksListViewBodyState();
}

class _TasksListViewBodyState extends State<TasksListViewBody> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              TaskCategory.values.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: _buildCategoryItem(
                  index: index,
                  categoryItem: TaskCategory.values[index],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 16),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return TaskWidget(
                  task: TaskEntity(
                    id: 'task_$index',
                    title: 'Task $index',
                    description: 'Description for task $index',
                    createdAt: DateTime.now(),
                  ),
                  category: TaskCategory.all,
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: 20,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCategoryItem({
    required final int index,
    required final TaskCategory categoryItem,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: selectedIndex == index
              ? AppColors.of(context).purble
              : AppColors.of(context).background,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selectedIndex == index
                ? AppColors.of(context).primary
                : AppColors.of(context).grey,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 7,
        ),
        margin: const EdgeInsetsDirectional.only(end: 8),
        child: Text(
          categoryItem.name,
          style: selectedIndex == index
              ? AppTextStyles.of(context).text12Medium
              : AppTextStyles.of(context).text12Bold.copyWith(
                    color: AppColors.of(context).grey,
                  ),
        ),
      ),
    );
  }
}
