// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$splashPageRoute];

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
