import 'package:auto_route/auto_route.dart';
import 'package:eproject_sem4/app/routes/guards/auth_guard.dart';
import 'package:eproject_sem4/app/routes/routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        // add your routes here
        AutoRoute(path: "/home", initial: true, page: HomeView.page, children: [
          AutoRoute(path: "register", page: RegisterView.page),
          AutoRoute(
              path: "recover", page: RecoveryView.page, guards: [AuthGuard()])
        ]),
        AutoRoute(path: "/login", page: LoginView.page),
      ];
}
