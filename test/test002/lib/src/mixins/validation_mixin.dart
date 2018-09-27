
class ValidationMixin {
  String validateEmail(String email) {
    if (!email.contains('@') || !email.contains('.')) return "Не правильно введен почтовый адрес.";
    return null;
  }

  String validatePassword(String password) {
    if (password.length == 0) return "Пароль не заполнен.";
    else if (password.length < 6) return "Пароль должен быть длинее 6 символов.";
    return null;
  }
}