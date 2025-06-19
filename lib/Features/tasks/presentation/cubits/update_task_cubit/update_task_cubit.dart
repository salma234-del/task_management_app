import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/Features/tasks/domain/entities/task_entity.dart';
import 'package:task_management_app/Features/tasks/domain/usecases/update_task_usecase.dart';

part 'update_task_state.dart';

class UpdateTaskCubit extends Cubit<UpdateTaskState> {
  UpdateTaskCubit(this.usecase) : super(UpdateTaskInitial());
  final UpdateTaskUsecase usecase;

  Future<void> updateTask(TaskEntity task) async {
    emit(UpdateTaskLoading());
    final result = await usecase.call(task);

    result.fold(
      (failure) => emit(UpdateTaskFailure(failure.message)),
      (tasks) => emit(UpdateTaskSuccess()),
    );
  }
}
