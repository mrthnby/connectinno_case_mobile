import 'package:connectinno_case_mobile/core/constants/app_constants.dart';
import 'package:connectinno_case_mobile/core/error/failures.dart';
import 'package:connectinno_case_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:connectinno_case_mobile/gen/locale_keys.g.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';

/// Use case responsible for sending a password reset link to the user's email.
///
/// This class handles input validation and delegates the actual sending
/// logic to [AuthRepository]. It returns either a [Failure] or [void] on success.
///
/// Example usage:
/// ```dart
/// final result = await ResetPasswordUsecase().call('user@example.com');
/// result.fold(
///   (failure) => print('Error: ${failure.message}'),
///   (_) => print('Reset link sent successfully'),
/// );
/// ```
@injectable
final class ResetPasswordUsecase {
  /// Constructs the use case with the required [AuthRepository].
  ResetPasswordUsecase(this.authRepository);

  /// Repository that handles authentication-related API calls.
  final AuthRepository authRepository;

  /// Executes the use case to send a password reset link.
  ///
  /// Performs the following validations:
  /// - Email must not be empty.
  /// - Email must match a valid regex pattern defined in [AppConstants.emailRegexPattern].
  ///
  /// Returns:
  /// - `Left<Failure>` if validation fails or repository returns an error.
  /// - `Right<void>` on success.
  Future<Either<Failure, void>> call(String email) async {
    // Email regex pattern from constants
    final emailRegex = RegExp(AppConstants.emailRegexPattern);

    // Validate email is not empty
    if (email.trim().isEmpty) {
      return Left(
        ValidationFailure(
          message: LocaleKeys.emailFieldCannotBeEmpty.tr(),
        ),
      );
    }

    // Validate email format
    if (!emailRegex.hasMatch(email.trim())) {
      return Left(
        ValidationFailure(
          message: LocaleKeys.pleaseEnterAValidEmailAddress.tr(),
        ),
      );
    }

    // Delegate sending reset link to repository
    return authRepository.sendResetLink(email);
  }
}
