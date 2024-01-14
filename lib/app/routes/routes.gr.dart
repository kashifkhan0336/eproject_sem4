// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:eproject_sem4/app/modules/auth/login/views/form_view.dart'
    as _i2;
import 'package:eproject_sem4/app/modules/auth/recovery/views/form_view.dart'
    as _i3;
import 'package:eproject_sem4/app/modules/auth/register/views/form_view.dart'
    as _i4;
import 'package:eproject_sem4/app/modules/home/views/home_view.dart' as _i1;
import 'package:eproject_sem4/app/modules/root/views/root_view.dart' as _i5;
import 'package:flutter/material.dart' as _i7;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    HomeView.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomeView(),
      );
    },
    LoginView.name: (routeData) {
      final args =
          routeData.argsAs<LoginViewArgs>(orElse: () => const LoginViewArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.LoginView(
          key: args.key,
          onResult: args.onResult,
        ),
      );
    },
    RecoveryView.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.RecoveryView(),
      );
    },
    RegisterView.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.RegisterView(),
      );
    },
    RootView.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.RootView(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomeView]
class HomeView extends _i6.PageRouteInfo<void> {
  const HomeView({List<_i6.PageRouteInfo>? children})
      : super(
          HomeView.name,
          initialChildren: children,
        );

  static const String name = 'HomeView';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.LoginView]
class LoginView extends _i6.PageRouteInfo<LoginViewArgs> {
  LoginView({
    _i7.Key? key,
    dynamic Function(bool?)? onResult,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          LoginView.name,
          args: LoginViewArgs(
            key: key,
            onResult: onResult,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginView';

  static const _i6.PageInfo<LoginViewArgs> page =
      _i6.PageInfo<LoginViewArgs>(name);
}

class LoginViewArgs {
  const LoginViewArgs({
    this.key,
    this.onResult,
  });

  final _i7.Key? key;

  final dynamic Function(bool?)? onResult;

  @override
  String toString() {
    return 'LoginViewArgs{key: $key, onResult: $onResult}';
  }
}

/// generated route for
/// [_i3.RecoveryView]
class RecoveryView extends _i6.PageRouteInfo<void> {
  const RecoveryView({List<_i6.PageRouteInfo>? children})
      : super(
          RecoveryView.name,
          initialChildren: children,
        );

  static const String name = 'RecoveryView';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.RegisterView]
class RegisterView extends _i6.PageRouteInfo<void> {
  const RegisterView({List<_i6.PageRouteInfo>? children})
      : super(
          RegisterView.name,
          initialChildren: children,
        );

  static const String name = 'RegisterView';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.RootView]
class RootView extends _i6.PageRouteInfo<void> {
  const RootView({List<_i6.PageRouteInfo>? children})
      : super(
          RootView.name,
          initialChildren: children,
        );

  static const String name = 'RootView';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
