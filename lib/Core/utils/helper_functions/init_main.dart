import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/Core/bloc_observer/bloc_observer.dart';
import 'package:task_management_app/Core/di/service_locator.dart';

void initMain() {
  setupServiceLocator();
  Bloc.observer = MyBlocObserver();
}
