import 'package:auto_route/auto_route.dart';
import 'package:eproject_sem4/app/data/services/auth_service.dart';
import 'package:eproject_sem4/app/routes/routes.gr.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGuard extends AutoRouteGuard {
  final _authService = Get.find<AuthService>();
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    print("onNavigation called!");
    if (await _authService.isAuth()) {
      resolver.next(true);
    } else {
      resolver.redirect(LoginView(onResult: (success) {
        resolver.next(success!);
      }));
    }
  }

  // final AuthService authService = Get.find();
  // final isAuth = authService.getIsAuth;
  // if (isAuth) {
  //   print(isAuth);
  //   resolver.next(true);
  // } else {
  //   resolver.redirect(LoginView(onResult: (success) {
  //     resolver.next(success!);
  //   }));
  // }
  // resolver.next();
}
