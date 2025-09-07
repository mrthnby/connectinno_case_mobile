// ignore_for_file: unnecessary_lambdas

import 'package:connectinno_case_mobile/core/constants/app_constants.dart';
import 'package:connectinno_case_mobile/core/error/failures.dart';
import 'package:connectinno_case_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:connectinno_case_mobile/gen/locale_keys.g.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';

/// Use case responsible for logging in a user.
///
/// Handles input validation for email and password, then delegates
/// the login process to [AuthRepository]. Returns either a [Failure]
/// or the user ID ([String]) on success.
///
/// Example usage:
/// ```dart
/// final result = await LoginUsecase().call(
///   'user@example.com',
///   'securePass123',
/// );
///
/// result.fold(
///   (failure) => print('Error: ${failure.message}'),
///   (uid) => print('User logged in successfully with UID: $uid'),
/// );
/// ```
@injectable
final class LoginUsecase {
  /// Constructs the use case with the required [AuthRepository].
  LoginUsecase(this._authRepository);

  /// Repository that handles authentication-related API calls.
  final AuthRepository _authRepository;

  /// Executes the login process with validation.
  ///
  /// Validations:
  /// - Email must not be empty and must match [AppConstants.emailRegexPattern].
  /// - Password must not be empty.
  ///
  /// Returns:
  /// - `Left<Failure>` if validation fails or repository returns an error.
  /// - `Right<String>` containing the user's UID on successful login.
  Future<Either<Failure, String>> call(
    String email,
    String password,
  ) async {
    // Regex pattern from constants
    final emailRegex = RegExp(AppConstants.emailRegexPattern);

    // Validate email
    if (email.trim().isEmpty) {
      return  Left(
        ValidationFailure(
          message: LocaleKeys.emailCannotBeEmpty.tr(),
        ),
      );
    }

    if (!emailRegex.hasMatch(email.trim())) {
      return  Left(
        ValidationFailure(
          message: LocaleKeys.pleaseEnterAValidEmailAddress.tr(),
        ),
      );
    }

    // Validate password
    if (password.trim().isEmpty) {
      return  Left(
        ValidationFailure(
          message: LocaleKeys.passwordCannotBeEmpty.tr(),
        ),
      );
    }

    // Call repository to perform login
    final result = await _authRepository.login(email, password);

    return result.fold(
      (failure) => Left(failure),
      (uid) => Right(uid),
    );
  }
}
