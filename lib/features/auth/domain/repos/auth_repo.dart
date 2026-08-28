import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/features/auth/domain/entity/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  );
  Future<Either<Failure, UserEntity>> signInWithEmailAndPasswor(
    String email,
    String password,
  );
  Future<Either<Failure, UserEntity>> signInWithGoogle();
  Future addUserData({required UserEntity user});

  Future<UserEntity> getUserData({required String uid});
}
