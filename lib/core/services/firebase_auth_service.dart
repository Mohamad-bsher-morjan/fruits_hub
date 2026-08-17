import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';
import 'dart:developer';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPasswor({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exception in FirebaseAuthService.createUserWithEmailAndPassword : ${e.toString()} and code is ${e.code}',
      );
      if (e.code == 'weak-password') {
        throw CustomException(message: 'الرقم السري ضعيف جدا');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          message: 'لقد قمت بالتسجيل مسبقا, الرجاء تسجيل الدخول',
        );
      } else if (e.code == ' network-request-failed') {
        throw CustomException(message: 'تأكد من اتصالك بالانترنت');
      } else {
        return throw CustomException(
          message: 'لقد حدث خطأ ما, الرجاء المحاولة لاحقا',
        );
      }
    } catch (e) {
      log(
        'Exception in FirebaseAuthService.createUserWithEmailAndPassword : ${e.toString()}',
      );
      throw CustomException(
        message: 'لقد حدث خطأ ما , الرجاء المحاولة مرة اخرى',
      );
    }
  }

  Future<User> signInWithEmailAndPasswor({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exception in FirebaseAuthService.signInWithEmailAndPasswor : ${e.toString()} and code is ${e.code}',
      );
      if (e.code == 'user-not-found') {
        throw CustomException(message: 'لم يتم العثور على المستخدم');
      } else if (e.code == 'wrong-password') {
        throw CustomException(
          message: 'كلمة المرور او البريد الالكتروني غير صحيح',
        );
      } else {
        throw CustomException(message: 'لقد حدث خطأ ما, الرجاء المحاولة لاحقا');
      }
    } catch (e) {
      log(
        'Exception in FirebaseAuthService.signInWithEmailAndPasswor : ${e.toString()}',
      );
      throw CustomException(
        message: 'لقد حدث خطأ ما , الرجاء المحاولة مرة اخرى',
      );
    }
  }
}
