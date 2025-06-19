part of 'delete_task_cubit.dart';

sealed class DeleteTaskState extends Equatable {
  const DeleteTaskState();

  @override
  List<Object> get props => [];
}

final class DeleteTaskInitial extends DeleteTaskState {}

final class DeleteTaskLoading extends DeleteTaskState {}

final class DeleteTaskSuccess extends DeleteTaskState {}

final class DeleteTaskFailure extends DeleteTaskState {
  final String error;

  const DeleteTaskFailure(this.error);

  @override
  List<Object> get props => [error];
}
