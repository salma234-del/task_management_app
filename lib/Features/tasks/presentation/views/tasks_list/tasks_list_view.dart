import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_management_app/Core/di/service_locator.dart';
import 'package:task_management_app/Core/enums/task_category.dart';
import 'package:task_management_app/Core/global/theme/app_theme/app_text_styles.dart';
import 'package:task_management_app/Core/utils/app_router.dart';
import 'package:task_management_app/Core/utils/app_strings.dart';
import 'package:task_management_app/Features/tasks/presentation/cubits/get_tasks_by_category_cubit/get_tasks_by_category_cubit.dart';
import 'package:task_management_app/Features/tasks/presentation/views/tasks_list/widgets/tasks_list_view_body.dart';

class TasksListView extends StatelessWidget {
  const TasksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetTasksByCategoryCubit(sl())..getTasksByCategory(TaskCategory.all),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              AppStrings.appName,
              style: AppTextStyles.of(context).text20Regular,
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
            ],
          ),
          body: TasksListViewBody(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.addTask);
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
