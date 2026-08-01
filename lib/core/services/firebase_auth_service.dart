import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/exceptions.dart';

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
      if (e.code == 'weak-password') {
        throw CustomException(message: 'الرقم السري ضعيف جدا');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          message: 'لقد قمت بالتسجيل مسبقا, الرجاء تسجيل الدخول',
        );
      } else {
        return throw CustomException(
          message: 'لقد حدث خطأ ما, الرجاء المحاولة لاحقا',
        );
      }
    } catch (e) {
      throw CustomException(
        message: 'لقد حدث خطأ ما , الرجاء المحاولة مرة اخرى',
      );
    }
  }
}
