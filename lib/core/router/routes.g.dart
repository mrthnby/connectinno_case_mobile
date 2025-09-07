// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $splashPageRoute,
  $authShellRoute,
  $homeShellRoute,
];

RouteBase get $splashPageRoute => GoRouteData.$route(
  path: '/',
  name: 'splash',
  factory: $SplashPageRoute._fromState,
);

mixin $SplashPageRoute on GoRouteData {
  static SplashPageRoute _fromState(GoRouterState state) => SplashPageRoute();

  @override
  String get location => GoRouteData.$location('/');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $authShellRoute => ShellRouteData.$route(
  factory: $AuthShellRouteExtension._fromState,
  routes: [
    GoRouteData.$route(
      path: '/login',
      name: 'login',
      factory: $LoginPageRoute._fromState,
    ),
    GoRouteData.$route(
      path: '/register',
      name: 'register',
      factory: $RegisterPageRoute._fromState,
    ),
    GoRouteData.$route(
      path: '/forgot-password',
      name: 'forgot-password',
      factory: $ForgotPasswordPageRoute._fromState,
    ),
  ],
);

extension $AuthShellRouteExtension on AuthShellRoute {
  static AuthShellRoute _fromState(GoRouterState state) => AuthShellRoute();
}

mixin $LoginPageRoute on GoRouteData {
  static LoginPageRoute _fromState(GoRouterState state) => LoginPageRoute();

  @override
  String get location => GoRouteData.$location('/login');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $RegisterPageRoute on GoRouteData {
  static RegisterPageRoute _fromState(GoRouterState state) =>
      RegisterPageRoute();

  @override
  String get location => GoRouteData.$location('/register');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ForgotPasswordPageRoute on GoRouteData {
  static ForgotPasswordPageRoute _fromState(GoRouterState state) =>
      ForgotPasswordPageRoute();

  @override
  String get location => GoRouteData.$location('/forgot-password');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $homeShellRoute => ShellRouteData.$route(
  factory: $HomeShellRouteExtension._fromState,
  routes: [
    GoRouteData.$route(
      path: '/home',
      name: 'home',
      factory: $HomePageRoute._fromState,
    ),
    GoRouteData.$route(
      path: '/note-editor',
      name: 'note-editor',
      factory: $NoteEditorPageRoute._fromState,
    ),
  ],
);

extension $HomeShellRouteExtension on HomeShellRoute {
  static HomeShellRoute _fromState(GoRouterState state) => HomeShellRoute();
}

mixin $HomePageRoute on GoRouteData {
  static HomePageRoute _fromState(GoRouterState state) => HomePageRoute();

  @override
  String get location => GoRouteData.$location('/home');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $NoteEditorPageRoute on GoRouteData {
  static NoteEditorPageRoute _fromState(GoRouterState state) =>
      NoteEditorPageRoute();

  @override
  String get location => GoRouteData.$location('/note-editor');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
