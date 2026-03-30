import '../../../core/network/failure/failure.dart';
import '../../domain/entity/business_entity.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/repository/user_repository.dart';

import 'package:dartz/dartz.dart';

class MockUserRepository implements UserRepository {
  @override
  Future<Either<Failure, UserEntity>> getUserProfile() async {
    try {
      await Future.delayed(const Duration(seconds: 1));

      const user = UserEntity(
        id: "u1",
        name: "Rakhmiddin",
        email: "khurbanovrakhmiddin@gmail.com",
        businesses: [
          BusinessEntity(
            id: "b1",
            name: "Flutter Dev Studio",
            type: "IT Services",
          ),
          BusinessEntity(id: "b2", name: "Tashkent Coffee", type: "F&B"),
          BusinessEntity(id: "b3", name: "Tashkent Medical Centre", type: "RQ"),
          BusinessEntity(id: "b4", name: "Tashkent Dental Centre", type: "RF"),
        ],
      );

      return const Right(user);
    } catch (e) {
      return const Left(ServerFailure("Не удалось загрузить данные профиля"));
    }
  }
}
