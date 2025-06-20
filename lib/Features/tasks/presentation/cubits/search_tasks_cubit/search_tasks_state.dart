import 'package:equatable/equatable.dart';
import 'package:task_management_app/Features/tasks/domain/entities/task_entity.dart';

sealed class SearchTasksState extends Equatable {
  const SearchTasksState();
  @override
  List<Object?> get props => [];
}

final class SearchTasksInitial extends SearchTasksState {}

final class SearchTasksLoading extends SearchTasksState {}

final class SearchTasksSuccess extends SearchTasksState {
  final List<TaskEntity> tasks;
  const SearchTasksSuccess(this.tasks);

  @override
  List<Object?> get props => [tasks];
}

final class SearchTasksFailure extends SearchTasksState {
  final String error;
  const SearchTasksFailure(this.error);

  @override
  List<Object?> get props => [error];
}
