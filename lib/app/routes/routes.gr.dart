// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:eproject_sem4/app/data/models/product.dart' as _i11;
import 'package:eproject_sem4/app/modules/auth/login/views/form_view.dart'
    as _i3;
import 'package:eproject_sem4/app/modules/auth/recovery/views/form_view.dart'
    as _i5;
import 'package:eproject_sem4/app/modules/auth/register/views/form_view.dart'
    as _i6;
import 'package:eproject_sem4/app/modules/cart/views/cart_view.dart' as _i1;
import 'package:eproject_sem4/app/modules/home/views/home_view.dart' as _i2;
import 'package:eproject_sem4/app/modules/product_detail/views/product_detail_view.dart'
    as _i4;
import 'package:eproject_sem4/app/modules/root/views/root_view.dart' as _i7;
import 'package:eproject_sem4/app/modules/wishlist/views/wishlist_view.dart'
    as _i8;
import 'package:flutter/material.dart' as _i10;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    CartView.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CartView(),
      );
    },
    HomeView.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeView(),
      );
    },
    LoginView.name: (routeData) {
      final args =
          routeData.argsAs<LoginViewArgs>(orElse: () => const LoginViewArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.LoginView(
          key: args.key,
          onResult: args.onResult,
        ),
      );
    },
    ProductDetailView.name: (routeData) {
      final args = routeData.argsAs<ProductDetailViewArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.ProductDetailView(
          key: args.key,
          product: args.product,
        ),
      );
    },
    RecoveryView.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.RecoveryView(),
      );
    },
    RegisterView.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.RegisterView(),
      );
    },
    RootView.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.RootView(),
      );
    },
    WishlistView.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.WishlistView(),
      );
    },
  };
}

/// generated route for
/// [_i1.CartView]
class CartView extends _i9.PageRouteInfo<void> {
  const CartView({List<_i9.PageRouteInfo>? children})
      : super(
          CartView.name,
          initialChildren: children,
        );

  static const String name = 'CartView';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeView]
class HomeView extends _i9.PageRouteInfo<void> {
  const HomeView({List<_i9.PageRouteInfo>? children})
      : super(
          HomeView.name,
          initialChildren: children,
        );

  static const String name = 'HomeView';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginView]
class LoginView extends _i9.PageRouteInfo<LoginViewArgs> {
  LoginView({
    _i10.Key? key,
    dynamic Function(bool?)? onResult,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          LoginView.name,
          args: LoginViewArgs(
            key: key,
            onResult: onResult,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginView';

  static const _i9.PageInfo<LoginViewArgs> page =
      _i9.PageInfo<LoginViewArgs>(name);
}

class LoginViewArgs {
  const LoginViewArgs({
    this.key,
    this.onResult,
  });

  final _i10.Key? key;

  final dynamic Function(bool?)? onResult;

  @override
  String toString() {
    return 'LoginViewArgs{key: $key, onResult: $onResult}';
  }
}

/// generated route for
/// [_i4.ProductDetailView]
class ProductDetailView extends _i9.PageRouteInfo<ProductDetailViewArgs> {
  ProductDetailView({
    _i10.Key? key,
    required _i11.Product product,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          ProductDetailView.name,
          args: ProductDetailViewArgs(
            key: key,
            product: product,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDetailView';

  static const _i9.PageInfo<ProductDetailViewArgs> page =
      _i9.PageInfo<ProductDetailViewArgs>(name);
}

class ProductDetailViewArgs {
  const ProductDetailViewArgs({
    this.key,
    required this.product,
  });

  final _i10.Key? key;

  final _i11.Product product;

  @override
  String toString() {
    return 'ProductDetailViewArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i5.RecoveryView]
class RecoveryView extends _i9.PageRouteInfo<void> {
  const RecoveryView({List<_i9.PageRouteInfo>? children})
      : super(
          RecoveryView.name,
          initialChildren: children,
        );

  static const String name = 'RecoveryView';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.RegisterView]
class RegisterView extends _i9.PageRouteInfo<void> {
  const RegisterView({List<_i9.PageRouteInfo>? children})
      : super(
          RegisterView.name,
          initialChildren: children,
        );

  static const String name = 'RegisterView';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i7.RootView]
class RootView extends _i9.PageRouteInfo<void> {
  const RootView({List<_i9.PageRouteInfo>? children})
      : super(
          RootView.name,
          initialChildren: children,
        );

  static const String name = 'RootView';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.WishlistView]
class WishlistView extends _i9.PageRouteInfo<void> {
  const WishlistView({List<_i9.PageRouteInfo>? children})
      : super(
          WishlistView.name,
          initialChildren: children,
        );

  static const String name = 'WishlistView';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
