import 'package:connectinno_case_mobile/core/clients/auth/auth_client.dart';
import 'package:injectable/injectable.dart';

/// Contract for accessing user-related data from a remote source.
///
/// Responsibilities:
/// - Defines how to retrieve the currently authenticated user ID.
/// - Keeps the data layer flexible by decoupling the implementation.
abstract class SplashRemoteDatasource {
  /// Retrieves the currently authenticated user's ID.
  ///
  /// Returns:
  /// - A [String] user ID if available.
  /// - `null` if no user is currently authenticated.
  Future<String?> currentUserID();
}

/// Implementation of [SplashRemoteDatasource] that uses [AuthClient].
///
/// Responsibilities:
/// - Delegates the fetching of the current user ID to [AuthClient].
/// - Serves as a bridge between the data source and repository layer.
@LazySingleton(as: SplashRemoteDatasource)
final class SplashRemoteDatasourceImpl implements SplashRemoteDatasource {
  /// Creates a [SplashRemoteDatasourceImpl] with the required [AuthClient].
  SplashRemoteDatasourceImpl(this.authClient);

  /// Client responsible for communicating with the authentication service.
  final AuthClient authClient;

  @override
  Future<String?> currentUserID() {
    // Delegates the call to AuthClient to fetch the current user ID.
    return authClient.currentUserID();
  }
}
