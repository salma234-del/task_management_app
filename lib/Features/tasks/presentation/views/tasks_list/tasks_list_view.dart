import 'package:flutter/material.dart';
import 'package:task_management_app/Features/tasks/presentation/views/tasks_list/components/tasks_list_view_body.dart';

class TasksListView extends StatelessWidget {
  const TasksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TasksListViewBody(),
    );
  }
}
