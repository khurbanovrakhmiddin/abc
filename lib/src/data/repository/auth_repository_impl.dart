import 'package:dartz/dartz.dart';
import '../../../core/network/failure/failure.dart';
import '../../domain/repository/auth_repository.dart';
import '../request/local/local_storage.dart';

class MockAuthRepository implements AuthRepository {
  final StorageService storage;

  MockAuthRepository(this.storage);

  @override
  Future<Either<Failure, Unit>> signInWithGoogle(bool rememberMe) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      await storage.saveToken("mock_jwt_token_2026");
      await storage.setRememberMe(rememberMe);
      return const Right(unit);
    } catch (e) {
      return const Left(ServerFailure("Ошибка входа через Google"));
    }
  }

  @override
  Future<Either<Failure, bool>> signInWithEmail(bool rememberMe) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      await storage.saveToken("mock_jwt_token_2026");
      await storage.setRememberMe(rememberMe);
      return const Right(true);
    } catch (e) {
      return const Left(ServerFailure("Неверный логин или пароль"));
    }
  }

  @override
  Future<Either<Failure, Unit>> signOut() async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      await storage.deleteToken();
      await storage.setRememberMe(false);
      return const Right(unit);
    } catch (e) {
      return const Left(CacheFailure("Не удалось очистить данные сессии"));
    }
  }

  @override
  Future<Either<Failure, bool>> checkAuthStatus() async {
    try {
      final token = storage.getToken();
      return Right(token != null && token.isNotEmpty);
    } catch (e) {
      return const Left(CacheFailure("Ошибка при проверке токена"));
    }
  }

  @override
  Future<Either<Failure, String?>> getToken() async {
    try {
      final token = storage.getToken();
      return Right(token);
    } catch (e) {
      return const Left(CacheFailure("Ошибка доступа к хранилищу"));
    }
  }
}
