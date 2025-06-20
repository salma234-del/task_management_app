import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/Core/enums/task_category.dart';
import 'package:task_management_app/Features/tasks/domain/usecases/get_tasks_by_category_usecase.dart';
import 'package:task_management_app/Features/tasks/presentation/cubits/search_tasks_cubit/search_tasks_state.dart';

class SearchTasksCubit extends Cubit<SearchTasksState> {
  SearchTasksCubit(this.usecase) : super(SearchTasksInitial()) {
    _init();
  }

  final GetTasksByCategoryUsecase usecase;
  final _searchController = StreamController<String>();
  final TextEditingController searchController = TextEditingController();
  StreamSubscription? _subscription;

  void _init() {
    _subscription = _searchController.stream.listen((query) async {
      emit(SearchTasksLoading());

      final result = await usecase.call(GetTasksByCategoryUsecaseParams(category: TaskCategory.all));
      result.fold(
        (failure) => emit(SearchTasksFailure(failure.message)),
        (tasks) {
          final filtered = tasks.where((task) => task.title.toLowerCase().contains(query.toLowerCase())).toList();
          emit(SearchTasksSuccess(filtered));
        },
      );
    });
  }

  void search(String query) {
    if (query.trim().isNotEmpty) {
      _searchController.add(query);
    } else {
      emit(SearchTasksInitial());
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    _searchController.close();
    return super.close();
  }
}
