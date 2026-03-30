import 'package:dartz/dartz.dart';

import '../../../core/network/failure/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, Unit>> signInWithGoogle(bool rememberMe);

  Future<Either<Failure, bool>> signInWithEmail(bool rememberMe);

  Future<Either<Failure, Unit>> signOut();

  Future<Either<Failure, bool>> checkAuthStatus();

  Future<Either<Failure, String?>> getToken();
}
