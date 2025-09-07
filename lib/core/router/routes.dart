import 'package:connectinno_case_mobile/core/di/injection.dart';
import 'package:connectinno_case_mobile/features/auth/presentation/controllers/auth_bloc.dart';
import 'package:connectinno_case_mobile/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:connectinno_case_mobile/features/auth/presentation/pages/login_page.dart';
import 'package:connectinno_case_mobile/features/auth/presentation/pages/register_page.dart';
import 'package:connectinno_case_mobile/features/splash/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

/// Auth Shell Route with BlocProvider
@TypedShellRoute<AuthShellRoute>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<LoginPageRoute>(
      path: '/login',
      name: 'login',
    ),
    TypedGoRoute<RegisterPageRoute>(
      path: '/register',
      name: 'register',
    ),
    TypedGoRoute<ForgotPasswordPageRoute>(
      path: '/forgot-password',
      name: 'forgot-password',
    ),
  ],
)
final class AuthShellRoute extends ShellRouteData {
  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: navigator,
    );
  }
}

/// Login Page Route
final class LoginPageRoute extends GoRouteData with $LoginPageRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginPage();
  }
}

/// Register Page Route
final class RegisterPageRoute extends GoRouteData with $RegisterPageRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const RegisterPage();
  }
}

/// Forgot Password Page Route
final class ForgotPasswordPageRoute extends GoRouteData
    with $ForgotPasswordPageRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ForgotPasswordPage();
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
