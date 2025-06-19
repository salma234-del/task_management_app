import 'package:flutter/material.dart';
import 'package:task_management_app/Features/tasks/presentation/views/tasks_list/widgets/categories_selector.dart';
import 'package:task_management_app/Features/tasks/presentation/views/tasks_list/widgets/tasks_list.dart';

class TasksListViewBody extends StatelessWidget {
  const TasksListViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          SizedBox(height: 20),
          CategoriesSelector(),
          SizedBox(height: 20),
          Expanded(child: TasksList()),
        ],
      ),
    );
  }
}
