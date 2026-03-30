import '../../../../core/network/failure/failure.dart';
import '../../repository/auth_repository.dart';

import 'package:dartz/dartz.dart';

import '../usecase.dart';

class LoginUseCase extends UseCase<bool, bool> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(bool rememberMe) async {
    return await repository.signInWithEmail(rememberMe);
  }
}
