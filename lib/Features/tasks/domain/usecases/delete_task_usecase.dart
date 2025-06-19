import 'package:dartz/dartz.dart';
import 'package:task_management_app/Core/error/failures/failure.dart';
import 'package:task_management_app/Core/usecase/base_usecase.dart';
import 'package:task_management_app/Features/tasks/domain/repository/base_tasks_repo.dart';

class DeleteTaskUsecase extends BaseUsecase<void, DeleteTaskUsecaseParams> {
  final BaseTasksRepo tasksRepo;
  DeleteTaskUsecase(this.tasksRepo);

  @override
  Future<Either<Failure, void>> call([DeleteTaskUsecaseParams? params]) async {
    return await tasksRepo.deleteTask(taskId: params!.taskId);
  }
}

class DeleteTaskUsecaseParams {
  final String taskId;

  const DeleteTaskUsecaseParams({required this.taskId});
}
