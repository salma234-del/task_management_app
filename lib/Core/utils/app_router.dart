import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String splash = '/';

  static GoRouter router = GoRouter(
    routes: [
      // GoRoute(
      //   path: splash,
      //   builder: (context, state) => Scaffold(),
      // ),
    ],
  );
}
