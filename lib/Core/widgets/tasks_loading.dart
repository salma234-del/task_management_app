import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:task_management_app/Core/enums/task_category.dart';
import 'package:task_management_app/Features/tasks/domain/entities/task_entity.dart';
import 'package:task_management_app/Features/tasks/presentation/views/tasks_list/widgets/task_widget.dart';

class TasksLoading extends StatelessWidget {
  const TasksLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 16),
        physics: const BouncingScrollPhysics(),
        itemCount: 3,
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemBuilder: (context, index) => TaskWidget(
          task: TaskEntity(
            id: '1',
            title: 'Go to the gym',
            description: 'Complete the workout routine',
            createdAt: DateTime.now(),
            isCompleted: false,
          ),
          category: TaskCategory.todo,
        ),
      ),
    );
  }
}
