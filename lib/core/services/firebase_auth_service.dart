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

  Future<void> updateDisplayName(String name) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw CustomException(message: 'يجب تسجيل الدخول أولاً');
      }
      await user.updateDisplayName(name);
    } on CustomException {
      rethrow;
    } on FirebaseAuthException catch (e) {
      log(
        'FirebaseAuthException in FirebaseAuthService.updateDisplayName : ${e.toString()} and code is ${e.code}',
      );
      throw CustomException(message: _getProfileUpdateErrorMessage(e));
    } catch (e) {
      log('Exception in FirebaseAuthService.updateDisplayName : ${e.toString()}');
      throw CustomException(
        message: 'لقد حدث خطأ ما , الرجاء المحاولة مرة اخرى',
      );
    }
  }

  Future<void> verifyBeforeUpdateEmail(String newEmail) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw CustomException(message: 'يجب تسجيل الدخول أولاً');
      }
      await user.verifyBeforeUpdateEmail(newEmail);
    } on CustomException {
      rethrow;
    } on FirebaseAuthException catch (e) {
      log(
        'FirebaseAuthException in FirebaseAuthService.verifyBeforeUpdateEmail : ${e.toString()} and code is ${e.code}',
      );
      throw CustomException(message: _getProfileUpdateErrorMessage(e));
    } catch (e) {
      log(
        'Exception in FirebaseAuthService.verifyBeforeUpdateEmail : ${e.toString()}',
      );
      throw CustomException(
        message: 'لقد حدث خطأ ما , الرجاء المحاولة مرة اخرى',
      );
    }
  }

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw CustomException(message: 'يجب تسجيل الدخول أولاً');
    }

    final hasPasswordProvider = user.providerData.any(
      (provider) => provider.providerId == 'password',
    );
    if (!hasPasswordProvider) {
      throw CustomException(
        message: 'هذا الحساب مسجل بواسطة جوجل ولا يملك كلمة مرور',
      );
    }

    final email = user.email;
    if (email == null) {
      throw CustomException(message: 'لا يوجد بريد إلكتروني مرتبط بهذا الحساب');
    }

    try {
      final credential = EmailAuthProvider.credential(
        email: email,
        password: currentPassword,
      );

      await user.reauthenticateWithCredential(credential);
      await user.updatePassword(newPassword);
    } on FirebaseAuthException catch (e) {
      log(
        'FirebaseAuthException in FirebaseAuthService.changePassword : ${e.toString()} and code is ${e.code}',
      );
      throw CustomException(message: _getPasswordChangeErrorMessage(e));
    } on CustomException {
      rethrow;
    } catch (e) {
      log('Exception in FirebaseAuthService.changePassword : ${e.toString()}');
      throw CustomException(
        message: 'لقد حدث خطأ ما , الرجاء المحاولة مرة اخرى',
      );
    }
  }

  String _getPasswordChangeErrorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'wrong-password':
      case 'invalid-credential':
        return 'كلمة المرور الحالية غير صحيحة';
      case 'weak-password':
        return 'كلمة المرور الجديدة ضعيفة جداً';
      case 'too-many-requests':
        return 'محاولات كثيرة، حاول مرة أخرى لاحقاً';
      case 'network-request-failed':
        return 'تأكد من اتصالك بالانترنت';
      default:
        return 'لقد حدث خطأ ما, الرجاء المحاولة لاحقا';
    }
  }

  String _getProfileUpdateErrorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'requires-recent-login':
        return 'سجل الدخول مرة أخرى ثم حاول تغيير البريد الإلكتروني';
      case 'email-already-in-use':
        return 'هذا البريد الإلكتروني مستخدم بالفعل';
      case 'invalid-email':
        return 'البريد الإلكتروني غير صحيح';
      case 'network-request-failed':
        return 'تأكد من اتصالك بالانترنت';
      default:
        return 'لقد حدث خطأ ما, الرجاء المحاولة لاحقا';
    }
  }

  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }

  // final OAuthCredential facebookAuthCredential =
  //     FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
}
