import 'package:task_management_app/Features/tasks/data/models/task_model.dart';

abstract class TasksLocalDataSource {
  Future<void> addTask({required final TaskModel task});
}
