import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';
import 'package:fruits_hub/core/errors/failure.dart';
import 'package:fruits_hub/core/services/data_service.dart';
import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:fruits_hub/core/utils/backend_endpoint.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domain/entity/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;
  AuthRepoImpl({
    required this.firebaseAuthService,
    required this.databaseService,
  });
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPasswor(
        email: email,
        password: password,
      );
      var userEntity = UserEntity(name: name, email: email, uId: user.uid);
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(errMessage: e.message));
    } catch (e) {
      await deleteUser(user);
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword : ${e.toString()}',
      );
      return left(
        ServerFailure(errMessage: 'لقد حدث خطأ ما , الرجاء المحاولة مرة اخرى'),
      );
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPasswor(
    String email,
    String password,
  ) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPasswor(
        email: email,
        password: password,
      );
      var userEntity = await getUserData(uid: user.uid);
      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(errMessage: e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword : ${e.toString()}',
      );
      return left(
        ServerFailure(errMessage: 'لقد حدث خطأ ما , الرجاء المحاولة مرة اخرى'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      var userEntity = UserEntity(
        name: user.displayName ?? '',
        email: user.email ?? '',
        uId: user.uid,
      );
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(errMessage: e.message));
    } catch (e) {
      log('Exception in AuthRepoImpl.signInWithGoogle : ${e.toString()}');
      return left(
        ServerFailure(errMessage: 'لقد حدث خطأ ما , الرجاء المحاولة مرة اخرى'),
      );
    }
  }

  @override
  Future<dynamic> addUserData({required UserEntity user}) async {
    await databaseService.addData(
      BackendEndpoint.addUserdata,
      user.toMap(),
      user.uId,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uid}) async {
    var userData = await databaseService.getData(
      path: BackendEndpoint.getUserData,
      uId: uid,
    );
    return UserModel.fromMap(userData);
  }

  // @override
  // Future<Either<Failure, UserEntity>> signInWithFacebook() async {
  //   try {
  //     var user = await firebaseAuthService.signInWithFacebook();
  //     return right(UserModel.fromFirebaseUser(user));
  //   } on CustomException catch (e) {
  //     return left(ServerFailure(errMessage: e.message));
  //   } catch (e) {
  //     log(
  //       'Exception in AuthRepoImpl.signInWithFacebook : ${e.toString()}',
  //     );
  //     return left(
  //       ServerFailure(errMessage: 'لقد حدث خطأ ما , الرجاء المحاولة مرة اخرى'),
  //     );
  //   }
  // }
}
