import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:task_management_app/Core/enums/task_category.dart';
import 'package:task_management_app/Core/error/failures/failure.dart';
import 'package:task_management_app/Features/tasks/data/models/task_model.dart';
import 'package:task_management_app/Features/tasks/domain/entities/task_entity.dart';
import 'package:task_management_app/Features/tasks/domain/usecases/add_task_usecase.dart';
import 'package:task_management_app/Features/tasks/domain/usecases/delete_task_usecase.dart';
import 'package:task_management_app/Features/tasks/domain/usecases/get_tasks_by_category_usecase.dart';
import 'package:task_management_app/Features/tasks/domain/usecases/update_task_usecase.dart';
import 'package:task_management_app/Features/tasks/presentation/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:task_management_app/Features/tasks/presentation/cubits/delete_task_cubit/delete_task_cubit.dart';
import 'package:task_management_app/Features/tasks/presentation/cubits/get_tasks_by_category_cubit/get_tasks_by_category_cubit.dart';
import 'package:task_management_app/Features/tasks/presentation/cubits/search_tasks_cubit/search_tasks_cubit.dart';
import 'package:task_management_app/Features/tasks/presentation/cubits/search_tasks_cubit/search_tasks_state.dart';
import 'package:task_management_app/Features/tasks/presentation/cubits/update_task_cubit/update_task_cubit.dart';

class MockAddUsecase extends Mock implements AddTaskUsecase {}

class MockDeleteUsecase extends Mock implements DeleteTaskUsecase {}

class MockGetUsecase extends Mock implements GetTasksByCategoryUsecase {}

class MockUpdateUsecase extends Mock implements UpdateTaskUsecase {}

class FakeTaskEntity extends Fake implements TaskEntity {}

class FakeDeleteParams extends Fake implements DeleteTaskUsecaseParams {}

class FakeTaskModel extends Fake implements TaskModel {}

class FakeGetTasksByCategoryParams extends Fake implements GetTasksByCategoryUsecaseParams {}

class MockUsecase extends Mock implements GetTasksByCategoryUsecase {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeGetTasksByCategoryParams());
    registerFallbackValue(FakeTaskEntity());
    registerFallbackValue(FakeTaskModel());
    registerFallbackValue(FakeDeleteParams());
  });

  final task = TaskEntity(
    id: '1',
    title: 'Test Task',
    description: 'Test Description',
    createdAt: DateTime.now(),
  );

  group('AddTaskCubit', () {
    late AddTaskCubit cubit;
    late MockAddUsecase mockUsecase;

    setUp(() {
      mockUsecase = MockAddUsecase();
      cubit = AddTaskCubit(mockUsecase);
    });

    blocTest<AddTaskCubit, AddTaskState>(
      'emits loading then success',
      build: () {
        when(() => mockUsecase.call(any())).thenAnswer((_) async => Right(null));
        return cubit;
      },
      act: (cubit) async {
        cubit.taskTitleController.text = 'Title';
        cubit.taskDescriptionController.text = 'Desc';
        await cubit.addTask(null);
      },
      expect: () => [AddTaskLoading(), AddTaskSuccess()],
    );

    blocTest<AddTaskCubit, AddTaskState>(
      'emits failure on error',
      build: () {
        when(() => mockUsecase.call(any())).thenAnswer((_) async => Left(Failure(message: 'error')));
        return cubit;
      },
      act: (cubit) async {
        cubit.taskTitleController.text = 'Title';
        cubit.taskDescriptionController.text = 'Desc';
        await cubit.addTask(null);
      },
      expect: () => [AddTaskLoading(), AddTaskFailure('error')],
    );
  });

  group('DeleteTaskCubit', () {
    late DeleteTaskCubit cubit;
    late MockDeleteUsecase mockUsecase;

    setUp(() {
      mockUsecase = MockDeleteUsecase();
      cubit = DeleteTaskCubit(mockUsecase);
    });

    blocTest<DeleteTaskCubit, DeleteTaskState>(
      'emits success on valid delete',
      build: () {
        when(() => mockUsecase.call(any())).thenAnswer((_) async => Right(null));
        return cubit;
      },
      act: (cubit) => cubit.deleteTask('1'),
      expect: () => [DeleteTaskLoading(), DeleteTaskSuccess()],
    );

    blocTest<DeleteTaskCubit, DeleteTaskState>(
      'emits failure on error',
      build: () {
        when(() => mockUsecase.call(any())).thenAnswer((_) async => Left(Failure(message: 'fail')));
        return cubit;
      },
      act: (cubit) => cubit.deleteTask('1'),
      expect: () => [DeleteTaskLoading(), DeleteTaskFailure('fail')],
    );
  });

  group('GetTasksByCategoryCubit', () {
    late GetTasksByCategoryCubit cubit;
    late MockGetUsecase mockUsecase;

    setUp(() {
      mockUsecase = MockGetUsecase();
      cubit = GetTasksByCategoryCubit(mockUsecase);
    });

    blocTest<GetTasksByCategoryCubit, GetTasksByCategoryState>(
      'emits tasks list',
      build: () {
        when(() => mockUsecase.call(any())).thenAnswer((_) async => Right([task]));
        return cubit;
      },
      act: (cubit) => cubit.getTasksByCategory(TaskCategory.todo),
      expect: () => [
        GetTasksByCategoryLoading(),
        GetTasksByCategorySuccess([task], TaskCategory.todo)
      ],
    );

    blocTest<GetTasksByCategoryCubit, GetTasksByCategoryState>(
      'emits failure state',
      build: () {
        when(() => mockUsecase.call(any())).thenAnswer((_) async => Left(Failure(message: 'err')));
        return cubit;
      },
      act: (cubit) => cubit.getTasksByCategory(TaskCategory.done),
      expect: () => [GetTasksByCategoryLoading(), GetTasksByCategoryFailure('err')],
    );
  });

  group('UpdateTaskCubit', () {
    late UpdateTaskCubit cubit;
    late MockUpdateUsecase mockUsecase;

    setUp(() {
      mockUsecase = MockUpdateUsecase();
      cubit = UpdateTaskCubit(mockUsecase);
    });

    blocTest<UpdateTaskCubit, UpdateTaskState>(
      'emits success on update',
      build: () {
        when(() => mockUsecase.call(any())).thenAnswer((_) async => Right(null));
        return cubit;
      },
      act: (cubit) => cubit.updateTask(task),
      expect: () => [UpdateTaskLoading(), UpdateTaskSuccess()],
    );

    blocTest<UpdateTaskCubit, UpdateTaskState>(
      'emits failure on error',
      build: () {
        when(() => mockUsecase.call(any())).thenAnswer((_) async => Left(Failure(message: 'error')));
        return cubit;
      },
      act: (cubit) => cubit.updateTask(task),
      expect: () => [UpdateTaskLoading(), UpdateTaskFailure('error')],
    );
  });

  group('SearchTasksCubit', () {
    late SearchTasksCubit cubit;
    late MockUsecase mockUsecase;
    final mockTasks = [
      TaskEntity(
        id: '1',
        title: 'Buy Milk',
        description: 'Go to the store',
        createdAt: DateTime.now(),
      ),
      TaskEntity(
        id: '2',
        title: 'Walk Dog',
        description: 'Evening walk',
        createdAt: DateTime.now(),
      ),
    ];

    setUp(() {
      mockUsecase = MockUsecase();
      cubit = SearchTasksCubit(mockUsecase);
    });

    tearDown(() async {
      await cubit.close();
    });

    blocTest<SearchTasksCubit, SearchTasksState>(
      'emits [Loading, Success] when tasks match query',
      build: () {
        when(() => mockUsecase.call(any())).thenAnswer((_) async => Right(mockTasks));
        return cubit;
      },
      act: (cubit) async {
        cubit.search('milk');
        await Future.delayed(Duration(milliseconds: 100));
      },
      wait: const Duration(milliseconds: 200),
      expect: () => [
        SearchTasksLoading(),
        SearchTasksSuccess([mockTasks[0]])
      ],
    );

    blocTest<SearchTasksCubit, SearchTasksState>(
      'emits [Loading, Failure] on repository failure',
      build: () {
        when(() => mockUsecase.call(any())).thenAnswer((_) async => Left(Failure(message: 'fetch error')));
        return cubit;
      },
      act: (cubit) async {
        cubit.search('milk');
        await Future.delayed(Duration(milliseconds: 100));
      },
      wait: const Duration(milliseconds: 200),
      expect: () => [
        SearchTasksLoading(),
        SearchTasksFailure('fetch error'),
      ],
    );

    blocTest<SearchTasksCubit, SearchTasksState>(
      'emits [Initial] on empty query',
      build: () => cubit,
      act: (cubit) => cubit.search(''),
      expect: () => [SearchTasksInitial()],
    );
  });
}
