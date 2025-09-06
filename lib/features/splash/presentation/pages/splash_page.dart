import 'package:connectinno_case_mobile/core/di/injection.dart';
import 'package:connectinno_case_mobile/core/router/routes.dart';
import 'package:connectinno_case_mobile/features/splash/presentation/controllers/splash_bloc.dart';
import 'package:connectinno_case_mobile/features/splash/presentation/controllers/splash_event.dart';
import 'package:connectinno_case_mobile/features/splash/presentation/controllers/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// The [SplashPage] is the first screen displayed when the app launches.
///
/// Responsibilities:
/// - Provides and initializes the [SplashBloc].
/// - Dispatches the [SplashInitializeEvent] when created.
/// - Listens to [SplashState] changes to decide navigation:
///   - Navigates to [HomePageRoute] if a user ID is found.
///   - Navigates to [LoginPageRoute] if no user ID is found.
class SplashPage extends StatelessWidget {
  /// The [SplashPage] constructor.
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SplashBloc>()..add(const SplashInitializeEvent()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          state.maybeWhen(
            // If user ID is found, navigate to Home page.
            userIDFound: (userID) {
              HomePageRoute().pushReplacement(context);
            },
            // If no user ID exists, navigate to Login page.
            userIDNotFound: () {
              LoginPageRoute().pushReplacement(context);
            },
            // No-op for other states.
            orElse: () {},
          );
        },
        child: const Scaffold(
          body: Center(
            child: Text(
              '📔',
              style: TextStyle(fontSize: 48),
            ),
          ),
        ),
      ),
    );
  }
}
