import 'package:connectinno_case_mobile/core/constants/app_constants.dart';
import 'package:connectinno_case_mobile/core/router/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// The root widget of the application.
///
/// This widget is responsible for:
/// - Providing the top-level [MaterialApp] configuration.
/// - Setting application-wide configurations such as title, theme, router, and localization.
/// - Serving as the entry point for the app's presentation layer.
///
/// This widget should be passed to [runApp] that handles
/// initialization such as dependency injection, error handling, or other services.
class App extends StatelessWidget {
  /// Creates a new instance of [App].
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConstants.appName,
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
