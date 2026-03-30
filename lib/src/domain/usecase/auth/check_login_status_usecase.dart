 import 'package:dartz/dartz.dart';
import '../../../../core/network/failure/failure.dart';
import '../../repository/auth_repository.dart';
import '../usecase.dart';
 class CheckAuthStatusUseCase extends UseCase<bool, NoParams> {
   final AuthRepository repository;

   CheckAuthStatusUseCase(this.repository);

   @override
   Future<Either<Failure, bool>> call(NoParams params) async {
     return await repository.checkAuthStatus();
   }
 }