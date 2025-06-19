import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:task_management_app/Core/enums/task_category.dart';
import 'package:task_management_app/Core/error/failures/failure.dart';
import 'package:task_management_app/Core/usecase/base_usecase.dart';
import 'package:task_management_app/Features/tasks/domain/entities/task_entity.dart';
import 'package:task_management_app/Features/tasks/domain/repository/base_tasks_repo.dart';

class GetTasksByCategoryUsecase
    extends BaseUsecase<List<TaskEntity>, GetTasksByCategoryUsecaseParams> {
  final BaseTasksRepo tasksRepo;

  GetTasksByCategoryUsecase(this.tasksRepo);

  @override
  Future<Either<Failure, List<TaskEntity>>> call(
      [GetTasksByCategoryUsecaseParams? params]) async {
    final category = params?.category ?? TaskCategory.all;

    final result = await tasksRepo.getTasksByCategory(category);
    // Filter tasks based on the category
    return result.map((tasks) {
      // Filter based on category
      List<TaskEntity> filteredTasks;
      switch (category) {
        case TaskCategory.todo:
          filteredTasks = tasks.where((task) => !task.isCompleted).toList();
          break;
        case TaskCategory.done:
          filteredTasks = tasks.where((task) => task.isCompleted).toList();
          break;
        default:
          filteredTasks = tasks;
      }

      // Sort tasks by createdAt descending (newest first)
      filteredTasks.sort(
        (a, b) => b.createdAt.compareTo(a.createdAt),
      );

      return filteredTasks;
    });
  }
}

class GetTasksByCategoryUsecaseParams extends Equatable {
  final TaskCategory category;

  const GetTasksByCategoryUsecaseParams({required this.category});

  @override
  List<Object?> get props => [category];
}
