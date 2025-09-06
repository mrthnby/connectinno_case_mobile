import 'package:connectinno_case_mobile/core/error/failures.dart';
import 'package:connectinno_case_mobile/features/splash/data/datasources/splash_remote_datasource.dart';
import 'package:connectinno_case_mobile/features/splash/domain/repositories/splash_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

/// Implementation of [SplashRepository].
///
/// This class is responsible for fetching the current user ID
/// from a [SplashRemoteDatasource].
///
/// Responsibilities:
/// - Calls the data source to retrieve the user ID.
/// - Wraps the result in an [Either] to represent success ([Right])
///   or failure ([Left]) with a [Failure].
/// - Provides a clean API for the domain layer.
@LazySingleton(as: SplashRepository)
final class SplashRepositoryImpl implements SplashRepository {
  /// Creates a [SplashRepositoryImpl] with the required [SplashRemoteDatasource].
  SplashRepositoryImpl(this.splashRemoteDatasource);

  /// The remote data source used to fetch user-related information.
  final SplashRemoteDatasource splashRemoteDatasource;

  @override
  Future<Either<Failure, String?>> getCurrentUserID() async {
    try {
      // Attempt to fetch the current user ID from the remote data source.
      final result = await splashRemoteDatasource.currentUserID();

      // Return the user ID (can be null if not found).
      return Right(result);
    } catch (e) {
      // TODO: use proper failure
      return Left(UnknownFailure(message: e.toString()));
    }
  }
}
