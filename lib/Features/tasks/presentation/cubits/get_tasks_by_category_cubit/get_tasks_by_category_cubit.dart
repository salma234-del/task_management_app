import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/Core/enums/task_category.dart';
import 'package:task_management_app/Features/tasks/domain/entities/task_entity.dart';
import 'package:task_management_app/Features/tasks/domain/usecases/get_tasks_by_category_usecase.dart';

part 'get_tasks_by_category_state.dart';

class GetTasksByCategoryCubit extends Cubit<GetTasksByCategoryState> {
  GetTasksByCategoryCubit(this.usecase) : super(GetTasksByCategoryInitial());

  final GetTasksByCategoryUsecase usecase;

  Future<void> getTasksByCategory(TaskCategory category) async {
    emit(GetTasksByCategoryLoading());
    final result =
        await usecase.call(GetTasksByCategoryUsecaseParams(category: category));

    result.fold(
      (failure) => emit(GetTasksByCategoryFailure(failure.message)),
      (tasks) => emit(GetTasksByCategorySuccess(tasks, category)),
    );
  }
}
