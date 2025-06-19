import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:task_management_app/Core/services/hive_local_storage_service.dart';
import 'package:task_management_app/Core/services/local_storage_service.dart';
import 'package:task_management_app/Core/utils/app_constants.dart';
import 'package:task_management_app/Features/tasks/data/datasource/local/tasks_local_datasource.dart';
import 'package:task_management_app/Features/tasks/data/datasource/local/tasks_local_datasource_impl.dart';
import 'package:task_management_app/Features/tasks/data/models/task_model.dart';
import 'package:task_management_app/Features/tasks/data/repository/tasks_repo_impl.dart';
import 'package:task_management_app/Features/tasks/domain/repository/base_tasks_repo.dart';
import 'package:task_management_app/Features/tasks/domain/usecases/add_task_usecase.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  // 1. Hive Initialization
  Hive.registerAdapter(TaskModelAdapter());

  sl.registerLazySingleton<LocalStorageService<TaskModel>>(
    () => HiveStorageService<TaskModel>(AppConstants.tasksBox),
  );

  // 3. Data Source
  sl.registerLazySingleton<TasksLocalDataSource>(
      () => TasksLocalDatasourceImpl(sl()));

  // 4. Repository
  sl.registerLazySingleton<BaseTasksRepo>(() => TasksRepoImpl(sl()));

  // 5. Use Cases
  sl.registerLazySingleton(() => AddTaskUsecase(sl()));
}
