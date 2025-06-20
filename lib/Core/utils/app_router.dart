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
        builder: (context, state) => SplashView(),
      ),
      GoRoute(
        path: AppRouter.tasksList,
        builder: (context, state) => TasksListView(),
      ),
      GoRoute(
        path: addTask,
        builder: (context, state) {
          final task = state.extra as TaskEntity?;
          if (task == null) {
            return AddTaskView();
          }
          return AddTaskView(taskToEdit: task);
        },
      ),
      GoRoute(
        path: AppRouter.searchTasks,
        builder: (context, state) => SearchTasksView(),
      ),
    ],
  );
}
