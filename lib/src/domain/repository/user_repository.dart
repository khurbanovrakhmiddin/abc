import 'package:dartz/dartz.dart';

import '../../../core/network/failure/failure.dart';
import '../entity/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> getUserProfile();
}