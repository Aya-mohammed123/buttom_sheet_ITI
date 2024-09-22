import '../Models/user.dart';

class UserController {
  bool validation(String username, String password) {
    if (username.isEmpty || password.isEmpty) {
      return false;
    }

    return true;
  }

  User createUser(String username, String password) {
    return User(username: username, password: password);
  }
}
