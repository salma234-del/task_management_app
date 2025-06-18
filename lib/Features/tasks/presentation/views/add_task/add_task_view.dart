import 'package:flutter/material.dart';
import 'package:task_management_app/Features/tasks/presentation/views/add_task/widgets/add_task_view_body.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AddTaskViewBody(),
      ),
    );
  }
}
