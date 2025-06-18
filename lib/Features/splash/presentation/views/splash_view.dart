import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_management_app/Core/utils/app_router.dart';
import 'package:task_management_app/Core/utils/assets.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (!mounted) return;
        GoRouter.of(context).pushReplacement(AppRouter.tasksList);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(Assets.imagesSplashLogo),
      ),
    );
  }
}
