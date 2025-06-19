import 'package:dartz/dartz.dart';
import 'package:task_management_app/Core/enums/task_category.dart';
import 'package:task_management_app/Core/error/exceptions/cache_exception.dart';
import 'package:task_management_app/Core/error/failures/failure.dart';
import 'package:task_management_app/Features/tasks/data/datasource/local/tasks_local_datasource.dart';
import 'package:task_management_app/Features/tasks/data/models/task_model.dart';
import 'package:task_management_app/Features/tasks/domain/entities/task_entity.dart';
import 'package:task_management_app/Features/tasks/domain/repository/base_tasks_repo.dart';

class TasksRepoImpl extends BaseTasksRepo {
  final TasksLocalDataSource tasksLocalDataSource;

  TasksRepoImpl(this.tasksLocalDataSource);

  @override
  Future<Either<Failure, void>> addTask({required TaskEntity task}) async {
    try {
      final model = TaskModel.fromEntity(task);
      await tasksLocalDataSource.addTask(task: model);
      return Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> getTasksByCategory(
      TaskCategory category) async {
    try {
      final tasks = await tasksLocalDataSource.getTasksByCategory(category);
      final taskEntities = tasks.map((task) => task.toEntity()).toList();
      return Right(taskEntities);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    }
  }
}
