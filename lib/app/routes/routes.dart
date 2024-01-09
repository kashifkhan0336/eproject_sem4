import 'package:eproject_sem4/app/modules/auth/login/views/form_view.dart';
import 'package:eproject_sem4/app/modules/auth/recovery/views/form_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const RecoveryView(),
      ),
    ],
  );

  static GoRouter get router => _router;
}
