import 'package:task_management_app/Core/enums/task_category.dart';
import 'package:task_management_app/Features/tasks/data/models/task_model.dart';

abstract class TasksLocalDataSource {
  Future<void> addTask({required final TaskModel task});
  Future<List<TaskModel>> getTasksByCategory(TaskCategory category);
  Future<void> updateTask({required final TaskModel task});
  Future<void> deleteTask({required final String taskId});
}
