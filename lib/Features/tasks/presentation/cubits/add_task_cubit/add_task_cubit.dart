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

  Future<void> addTask(TaskEntity? task) async {
    emit(AddTaskLoading());
    final result = await usecase.call(
      TaskEntity(
        id: task == null ? Uuid().v4() : task.id,
        title: taskTitleController.text.trim(),
        description: taskDescriptionController.text.trim(),
        createdAt: task == null ? DateTime.now() : task.createdAt,
      ),
    );

    result.fold(
      (failure) => emit(AddTaskFailure(failure.message)),
      (success) => emit(AddTaskSuccess()),
    );
  }

  void initializeFields(TaskEntity taskToEdit) {
    taskTitleController.text = taskToEdit.title;
    taskDescriptionController.text = taskToEdit.description;
  }

  @override
  Future<void> close() {
    taskTitleController.dispose();
    taskDescriptionController.dispose();
    return super.close();
  }
}
