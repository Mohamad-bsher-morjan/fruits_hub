import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';
import 'dart:developer';
import 'package:google_sign_in/google_sign_in.dart';

const String _googleServerClientId =
    '1065569359358-l8hff9h33c62cmc3olc8ovs64voh9k6d.apps.googleusercontent.com';

final Future<void> _googleSignInInitialization = GoogleSignIn.instance
    .initialize(serverClientId: _googleServerClientId);

class FirebaseAuthService {
  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

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

  Future<User> signInWithGoogle() async {
    try {
      await _googleSignInInitialization;
      final GoogleSignInAccount googleUser = await GoogleSignIn.instance
          .authenticate(scopeHint: <String>['email', 'profile']);

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;
      if (googleAuth.idToken == null) {
        throw CustomException(
          message:
              'تعذر الحصول على بيانات تسجيل الدخول من جوجل. تأكد من إعدادات SHA و OAuth في Firebase.',
        );
      }

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      return (await FirebaseAuth.instance.signInWithCredential(
        credential,
      )).user!;
    } on GoogleSignInException catch (e) {
      log(
        'GoogleSignInException in FirebaseAuthService.signInWithGoogle : ${e.toString()}',
      );
      if (e.code == GoogleSignInExceptionCode.canceled) {
        throw CustomException(message: 'تم إلغاء تسجيل الدخول بواسطة جوجل');
      } else if (e.code == GoogleSignInExceptionCode.clientConfigurationError ||
          e.code == GoogleSignInExceptionCode.providerConfigurationError) {
        throw CustomException(
          message:
              'إعدادات تسجيل الدخول بجوجل غير مكتملة. أضف SHA-1/SHA-256 في Firebase ثم حمل google-services.json من جديد.',
        );
      } else {
        throw CustomException(
          message: 'تعذر تسجيل الدخول بواسطة جوجل، الرجاء المحاولة لاحقا',
        );
      }
    } on FirebaseAuthException catch (e) {
      log(
        'FirebaseAuthException in FirebaseAuthService.signInWithGoogle : ${e.toString()} and code is ${e.code}',
      );
      if (e.code == 'account-exists-with-different-credential') {
        throw CustomException(
          message: 'يوجد حساب بنفس البريد مسجل بطريقة دخول مختلفة',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'تأكد من اتصالك بالانترنت');
      } else {
        throw CustomException(
          message: 'تعذر تسجيل الدخول بواسطة جوجل، الرجاء المحاولة لاحقا',
        );
      }
    } on CustomException {
      rethrow;
    } catch (e) {
      log(
        'Exception in FirebaseAuthService.signInWithGoogle : ${e.toString()}',
      );
      throw CustomException(
        message: 'تعذر تسجيل الدخول بواسطة جوجل، الرجاء المحاولة مرة اخرى',
      );
    }
  }

  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }

  // final OAuthCredential facebookAuthCredential =
  //     FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
}
