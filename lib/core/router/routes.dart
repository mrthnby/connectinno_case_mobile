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
    return const Placeholder();
  }
}
