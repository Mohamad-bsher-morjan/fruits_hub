class AppValidators {
  const AppValidators._();

  static final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  static String? requiredField(
    String? value, [
    String message = 'هذا الحقل مطلوب',
  ]) {
    if (value == null || value.isEmpty) {
      return message;
    }
    return null;
  }

  static String? email(String? value) {
    final requiredError = requiredField(value);
    if (requiredError != null) {
      return requiredError;
    }
    if (!_emailRegex.hasMatch(value!.trim())) {
      return 'أدخل بريداً إلكترونياً صحيحاً';
    }
    return null;
  }

  static String? password(String? value, {int minLength = 6}) {
    final requiredError = requiredField(value);
    if (requiredError != null) {
      return requiredError;
    }
    if (value!.length < minLength) {
      return 'كلمة المرور يجب ألا تقل عن $minLength أحرف';
    }
    return null;
  }

  static String? confirmPassword(String? value, String password) {
    final requiredError = requiredField(value);
    if (requiredError != null) {
      return requiredError;
    }
    if (value != password) {
      return 'كلمتا المرور غير متطابقتين';
    }
    return null;
  }
}
