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
      switch (category) {
        case TaskCategory.todo:
          return tasks.where((task) => !task.isCompleted).toList();
        case TaskCategory.done:
          return tasks.where((task) => task.isCompleted).toList();
        default:
          return tasks;
      }
    });
  }
}

class GetTasksByCategoryUsecaseParams extends Equatable {
  final TaskCategory category;

  const GetTasksByCategoryUsecaseParams({required this.category});

  @override
  List<Object?> get props => [category];
}
