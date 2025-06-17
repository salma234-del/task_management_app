import 'package:go_router/go_router.dart';
import 'package:task_management_app/Features/splash/presentation/views/splash_view.dart';
import 'package:task_management_app/Features/tasks/presentation/views/tasks_list/tasks_list_view.dart';

abstract class AppRouter {
  static const String splash = '/';
  static const String tasksList = '/tasks-list';

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
    ],
  );
}
