import 'package:dartz/dartz.dart';
import '../../../../core/network/failure/failure.dart';
import '../../repository/auth_repository.dart';

import '../usecase.dart';

class LoginWithGoogleUseCase extends UseCase<Unit, bool> {
  final AuthRepository repository;

  LoginWithGoogleUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(bool rememberMe) async {
    return await repository.signInWithGoogle(rememberMe);
  }
}