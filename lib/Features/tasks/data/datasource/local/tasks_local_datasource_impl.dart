import 'package:task_management_app/Core/services/local_storage_service.dart';
import 'package:task_management_app/Features/tasks/data/datasource/local/tasks_local_datasource.dart';
import 'package:task_management_app/Features/tasks/data/models/task_model.dart';


class TasksLocalDatasourceImpl extends TasksLocalDataSource {
  final LocalStorageService<TaskModel> storage;

  TasksLocalDatasourceImpl(this.storage);

  @override
  Future<void> addTask({required TaskModel task}) async {
    await storage.save(task.id, task);
  }
}
