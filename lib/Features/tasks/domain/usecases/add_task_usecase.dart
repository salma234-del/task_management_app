import 'package:dartz/dartz.dart';
import 'package:task_management_app/Core/error/failures/failure.dart';
import 'package:task_management_app/Core/usecase/base_usecase.dart';
import 'package:task_management_app/Features/tasks/domain/entities/task_entity.dart';
import 'package:task_management_app/Features/tasks/domain/repository/base_tasks_repo.dart';

class AddTaskUsecase extends BaseUsecase<void, TaskEntity> {
  final BaseTasksRepo tasksRepo;
  AddTaskUsecase(this.tasksRepo);

  @override
  Future<Either<Failure, void>> call([TaskEntity? params]) async {
    return await tasksRepo.addTask(task: params!);
  }
}
