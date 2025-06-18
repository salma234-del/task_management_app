import 'package:go_router/go_router.dart';
import 'package:task_management_app/Features/splash/presentation/views/splash_view.dart';
import 'package:task_management_app/Features/tasks/presentation/views/add_task/add_task_view.dart';
import 'package:task_management_app/Features/tasks/presentation/views/tasks_list/tasks_list_view.dart';

abstract class AppRouter {
  static const String splash = '/';
  static const String tasksList = '/tasks-list';
  static const String addTask = '/add-task';

  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: splash,
        builder: (context, state) => SplashView(),
      ),
      GoRoute(
        path: tasksList,
        builder: (context, state) => TasksListView(),
      ),
      GoRoute(
        path: addTask,
        builder: (context, state) => AddTaskView(),
      ),
    ],
  );
}
