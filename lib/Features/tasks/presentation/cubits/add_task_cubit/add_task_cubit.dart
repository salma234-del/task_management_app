import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/Features/tasks/domain/entities/task_entity.dart';
import 'package:task_management_app/Features/tasks/domain/usecases/add_task_usecase.dart';
import 'package:uuid/uuid.dart';
part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit(this.usecase) : super(AddTaskInitial());

  final AddTaskUsecase usecase;

  final formKey = GlobalKey<FormState>();
  final taskTitleController = TextEditingController();
  final taskDescriptionController = TextEditingController();

  Future<void> addTask() async {
    emit(AddTaskLoading());
    final result = await usecase.call(
      TaskEntity(
        id: Uuid().v4(),
        title: taskTitleController.text,
        description: taskDescriptionController.text,
        createdAt: DateTime.now(),
      ),
    );

    result.fold(
      (failure) => emit(AddTaskFailure(failure.message)),
      (success) => emit(AddTaskSuccess()),
    );
  }

  @override
  Future<void> close() {
    taskTitleController.dispose();
    taskDescriptionController.dispose();
    return super.close();
  }
}
