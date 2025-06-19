import 'package:dartz/dartz.dart';
import 'package:task_management_app/Core/enums/task_category.dart';
import 'package:task_management_app/Core/error/failures/failure.dart';
import 'package:task_management_app/Features/tasks/domain/entities/task_entity.dart';

abstract class BaseTasksRepo {
  Future<Either<Failure, void>> addTask({required final TaskEntity task});
  Future<Either<Failure, List<TaskEntity>>> getTasksByCategory(TaskCategory category);
  Future<Either<Failure, void>> updateTask({required final TaskEntity task});
}
