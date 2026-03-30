import 'package:dartz/dartz.dart';

import '../../../../core/network/failure/failure.dart';
import '../../entity/user_entity.dart';
import '../../repository/user_repository.dart';

class GetUserProfileUseCase {
  final UserRepository repository;

  const GetUserProfileUseCase(this.repository);

  Future<Either<Failure, UserEntity>> call() async {
    return await repository.getUserProfile();
  }
}