import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/Core/di/service_locator.dart';
import 'package:task_management_app/Core/global/theme/app_theme/app_colors.dart';
import 'package:task_management_app/Features/tasks/presentation/cubits/search_tasks_cubit/search_tasks_cubit.dart';
import 'package:task_management_app/Features/tasks/presentation/views/search_tasks/widgets/search_tasks_view_body.dart';

class SearchTasksView extends StatelessWidget {
  const SearchTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchTasksCubit(sl()),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.of(context).background,
          appBar: AppBar(backgroundColor: AppColors.of(context).background),
          body: SearchTasksViewBody(),
        ),
      ),
    );
  }
}
