import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:task_management_app/Core/bloc_observer/bloc_observer.dart';
import 'package:task_management_app/Core/di/service_locator.dart';

Future<void> initMain() async {
  await Hive.initFlutter();
  await setupServiceLocator();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Bloc.observer = MyBlocObserver();
}
