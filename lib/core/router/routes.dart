import 'package:connectinno_case_mobile/features/splash/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'routes.g.dart';

/// Splash Page Route
@TypedGoRoute<SplashPageRoute>(
  path: '/',
  name: 'splash',
)
final class SplashPageRoute extends GoRouteData with $SplashPageRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashPage();
  }
}

/// Login Page Route
@TypedGoRoute<LoginPageRoute>(
  path: '/login',
  name: 'login',
)
final class LoginPageRoute extends GoRouteData with $LoginPageRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Text('Login Page');
  }
}

/// Home Page Route
@TypedGoRoute<HomePageRoute>(
  path: '/home',
  name: 'home',
)
final class HomePageRoute extends GoRouteData with $HomePageRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Text('Home Page');
  }
}
