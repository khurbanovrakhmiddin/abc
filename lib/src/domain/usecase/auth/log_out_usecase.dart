import 'package:dartz/dartz.dart';

import '../../../../core/network/failure/failure.dart';
import '../../repository/auth_repository.dart';
import '../usecase.dart';

class LogoutUseCase extends UseCase<Unit, NoParams> {
  final AuthRepository repository;

  LogoutUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(NoParams params) async {
    return await repository.signOut();
  }
}
