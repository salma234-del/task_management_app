part of 'get_tasks_by_category_cubit.dart';

sealed class GetTasksByCategoryState extends Equatable {
  const GetTasksByCategoryState();

  @override
  List<Object> get props => [];
}

final class GetTasksByCategoryInitial extends GetTasksByCategoryState {}

final class GetTasksByCategoryLoading extends GetTasksByCategoryState {}

final class GetTasksByCategorySuccess extends GetTasksByCategoryState {
  final List<TaskEntity> tasks;
  final TaskCategory selectedCategory;

  const GetTasksByCategorySuccess(this.tasks, this.selectedCategory);

  @override
  List<Object> get props => [tasks];
}

final class GetTasksByCategoryFailure extends GetTasksByCategoryState {
  final String error;

  const GetTasksByCategoryFailure(this.error);

  @override
  List<Object> get props => [error];
}
