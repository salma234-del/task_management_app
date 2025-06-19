import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/Features/tasks/domain/usecases/delete_task_usecase.dart';

part 'delete_task_state.dart';

class DeleteTaskCubit extends Cubit<DeleteTaskState> {
  DeleteTaskCubit(this.usecase) : super(DeleteTaskInitial());

  final DeleteTaskUsecase usecase;

  Future<void> deleteTask(String taskId) async {
    emit(DeleteTaskLoading());
    final result = await usecase.call(DeleteTaskUsecaseParams(taskId: taskId));

    result.fold(
      (failure) => emit(DeleteTaskFailure(failure.message)),
      (success) => emit(DeleteTaskSuccess()),
    );
  }
}
