/// A centralized class for storing application-wide constant values.
///
/// This class contains values that are used throughout the app, such as
/// the application name, api url, or other global constants.
///
/// Example usage:
/// ```dart
/// import 'package:connectinno_case_mobile/core/constants/app_constants.dart';
///
/// print(AppConstants.appName); // Outputs: Connectinno Case
/// ```
abstract class AppConstants {
  /// The name of the application used throughout the app.
  ///
  /// `value` : Connectinno Case
  static const String appName = 'Connectinno Case';

  /// The base url of the api.
  static const String apiBaseUrl = 'http://localhost:8000';

  /// The timeout of the network requests.
  static const Duration networkTimeout = Duration(seconds: 10);

  /// Regular expression pattern for email validation.
  /// Validates standard email format with alphanumeric characters,
  /// common special characters, and proper domain structure.
  static const String emailRegexPattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

  /// Regular expression pattern for name validation.
  /// Allows letters (including international characters with accents),
  /// spaces, hyphens, apostrophes, and requires minimum 2 characters.
  static const String nameRegexPattern =
      r"^[a-zA-ZÀ-ÿ\u0100-\u017F\u0180-\u024F\u1E00-\u1EFF\s\-']{2,}$";
}
