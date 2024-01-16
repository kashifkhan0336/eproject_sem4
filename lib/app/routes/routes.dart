import 'package:auto_route/auto_route.dart';


import 'package:eproject_sem4/app/routes/guards/auth_guard.dart';
import 'package:eproject_sem4/app/routes/routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        // add your routes here
        AutoRoute(path: "/", page: RootView.page, guards: [
          AuthGuard()
        ], children: [
          AutoRoute(path: "home", initial: true, page: HomeView.page),
          AutoRoute(path: "wishlist",page: WishlistView.page),
          AutoRoute(path: "product_detail", page: ProductDetailView.page),
        ]),
        AutoRoute(path: "/login", page: LoginView.page),
        AutoRoute(path: "/register", page: RegisterView.page),
        AutoRoute(
          path: "/recover",
          page: RecoveryView.page,
        )
      ];
}
