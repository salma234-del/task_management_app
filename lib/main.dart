import 'package:flutter/material.dart';
import 'package:task_management_app/Core/global/theme/app_theme/app_light_theme.dart';
import 'package:task_management_app/Core/utils/helper_functions/init_main.dart';
import 'package:task_management_app/Core/utils/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initMain();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppLightTheme.getTheme(context),
      routerConfig: AppRouter.router,
    );
  }
}
