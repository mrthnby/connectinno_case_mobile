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
}
