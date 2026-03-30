import 'package:dartz/dartz.dart';

import '../../../core/network/failure/failure.dart';

abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

class NoParams {}
