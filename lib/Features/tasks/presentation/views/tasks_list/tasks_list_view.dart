import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task_management_app/Core/di/service_locator.dart';
import 'package:task_management_app/Core/global/theme/app_theme/app_colors.dart';
import 'package:task_management_app/Core/global/theme/app_theme/app_text_styles.dart';
import 'package:task_management_app/Core/global/theme/theme_cubit/theme_cubit.dart';
import 'package:task_management_app/Core/global/theme/theme_cubit/theme_state.dart';
import 'package:task_management_app/Core/utils/app_router.dart';
import 'package:task_management_app/Core/utils/app_strings.dart';
import 'package:task_management_app/Features/tasks/presentation/cubits/delete_task_cubit/delete_task_cubit.dart';
import 'package:task_management_app/Features/tasks/presentation/cubits/update_task_cubit/update_task_cubit.dart';
import 'package:task_management_app/Features/tasks/presentation/views/tasks_list/widgets/tasks_list_view_body.dart';

class TasksListView extends StatelessWidget {
  const TasksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UpdateTaskCubit>(create: (_) => UpdateTaskCubit(sl())),
        BlocProvider<DeleteTaskCubit>(create: (_) => DeleteTaskCubit(sl())),
      ],
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.of(context).background,
          appBar: AppBar(
            title: Text(
              AppStrings.appName,
              style: AppTextStyles.of(context).text20Regular,
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () => GoRouter.of(context).push(AppRouter.searchTasks),
              ),
              BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
                final isDark = state.themeMode == ThemeMode.dark;
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) => RotationTransition(
                    turns: animation,
                    child: FadeTransition(opacity: animation, child: child),
                  ),
                  child: IconButton(
                    key: ValueKey(isDark),
                    icon: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
                    onPressed: () => context.read<ThemeCubit>().toggleTheme(),
                  ),
                );
              }),
            ],
          ),
          body: TasksListViewBody(),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.of(context).primary,
            onPressed: () => GoRouter.of(context).push(AppRouter.addTask),
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
