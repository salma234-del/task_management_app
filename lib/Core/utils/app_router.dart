import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_management_app/Features/splash/presentation/views/splash_view.dart';
import 'package:task_management_app/Features/tasks/domain/entities/task_entity.dart';
import 'package:task_management_app/Features/tasks/presentation/views/add_task/add_task_view.dart';
import 'package:task_management_app/Features/tasks/presentation/views/search_tasks/views/search_tasks_view.dart';
import 'package:task_management_app/Features/tasks/presentation/views/tasks_list/tasks_list_view.dart';

abstract class AppRouter {
  static const String splash = '/';
  static const String tasksList = '/tasks-list';
  static const String addTask = '/add-task';
  static const String searchTasks = '/search-tasks';

  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: splash,
        pageBuilder: (context, state) => _buildTransitionPage(
          key: state.pageKey,
          child: SplashView(),
        ),
      ),
      GoRoute(
        path: AppRouter.tasksList,
        pageBuilder: (context, state) => _buildTransitionPage(
          key: state.pageKey,
          child: TasksListView(),
        ),
      ),
      GoRoute(
        path: addTask,
        pageBuilder: (context, state) {
          final task = state.extra as TaskEntity?;
          return _buildTransitionPage(
            key: state.pageKey,
            child: AddTaskView(taskToEdit: task),
          );
        },
      ),
      GoRoute(
        path: AppRouter.searchTasks,
        pageBuilder: (context, state) => _buildTransitionPage(
          key: state.pageKey,
          child: SearchTasksView(),
        ),
      ),
    ],
  );

  static CustomTransitionPage _buildTransitionPage({
    required LocalKey key,
    required Widget child,
  }) {
    return CustomTransitionPage(
      key: key,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 0.1);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        final fadeAnimation = CurvedAnimation(parent: animation, curve: curve);

        return SlideTransition(
          position: animation.drive(tween),
          child: FadeTransition(
            opacity: fadeAnimation,
            child: child,
          ),
        );
      },
    );
  }
}
