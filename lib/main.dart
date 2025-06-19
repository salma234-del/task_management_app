import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/Core/di/service_locator.dart';
import 'package:task_management_app/Core/enums/task_category.dart';
import 'package:task_management_app/Core/global/theme/app_theme/app_light_theme.dart';
import 'package:task_management_app/Core/utils/helper_functions/init_main.dart';
import 'package:task_management_app/Core/utils/app_router.dart';
import 'package:task_management_app/Features/tasks/presentation/cubits/get_tasks_by_category_cubit/get_tasks_by_category_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initMain();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetTasksByCategoryCubit(sl())
            ..getTasksByCategory(TaskCategory.all),
        )
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppLightTheme.getTheme(context),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
