// ignore_for_file: unnecessary_lambdas

import 'package:connectinno_case_mobile/core/constants/app_constants.dart';
import 'package:connectinno_case_mobile/core/error/failures.dart';
import 'package:connectinno_case_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:connectinno_case_mobile/gen/locale_keys.g.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';

/// Use case responsible for registering a new user.
///
/// Handles input validation for name, email, and password, then delegates
/// the registration process to [AuthRepository]. Returns either a [Failure]
/// or the user ID ([String]) on success.
///
/// Example usage:
/// ```dart
/// final result = await RegisterUsecase().call(
///   email: 'user@example.com',
///   name: 'John Doe',
///   password: 'securePass123',
///   confirmPassword: 'securePass123',
/// );
///
/// result.fold(
///   (failure) => print('Error: ${failure.message}'),
///   (uid) => print('User registered successfully with UID: $uid'),
/// );
/// ```
@injectable
final class RegisterUsecase {
  /// Constructs the use case with the required [AuthRepository].
  RegisterUsecase(this.authRepository);

  /// Repository that handles authentication-related API calls.
  final AuthRepository authRepository;

  /// Executes the registration process with validation.
  ///
  /// Validations:
  /// - Name must not be empty and must match [AppConstants.nameRegexPattern].
  /// - Email must not be empty and must match [AppConstants.emailRegexPattern].
  /// - Password must be at least 6 characters long.
  /// - Password and confirmPassword must match.
  ///
  /// Returns:
  /// - `Left<Failure>` if validation fails or repository returns an error.
  /// - `Right<String>` containing the user's UID on successful registration.
  Future<Either<Failure, String>> call({
    required String email,
    required String name,
    required String password,
    required String confirmPassword,
  }) async {
    // Regex patterns from constants
    final emailRegex = RegExp(AppConstants.emailRegexPattern);
    final nameRegex = RegExp(AppConstants.nameRegexPattern);

    // Validate name
    if (name.trim().isEmpty) {
      return Left(
        ValidationFailure(
          message: LocaleKeys.nameFieldCannotBeEmpty.tr(),
        ),
      );
    }

    if (!nameRegex.hasMatch(name.trim())) {
      return Left(
        ValidationFailure(
          message: LocaleKeys
              .nameCanOnlyContainLettersSpacesHyphensApostrophesAndMustBeAtLeast2CharactersLong
              .tr(),
        ),
      );
    }

    // Validate email
    if (email.trim().isEmpty) {
      return Left(
        ValidationFailure(
          message: LocaleKeys.emailFieldCannotBeEmpty.tr(),
        ),
      );
    }

    if (!emailRegex.hasMatch(email.trim())) {
      return Left(
        ValidationFailure(
          message: LocaleKeys.pleaseEnterAValidEmailAddress.tr(),
        ),
      );
    }

    // Validate password length
    if (password.length < 6) {
      return Left(
        ValidationFailure(
          message: LocaleKeys.passwordMustBeAtLeast6CharactersLong.tr(),
        ),
      );
    }

    // Validate password match
    if (password != confirmPassword) {
      return Left(
        ValidationFailure(
          message: LocaleKeys.passwordsDoNotMatch.tr(),
        ),
      );
    }

    // Call repository to register the user
    final result = await authRepository.register(email, password, name);

    return result.fold(
      (failure) => Left(failure),
      (uid) => Right(uid),
    );
  }
}
