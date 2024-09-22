import '../Models/user.dart';

class NewUserController {
  bool validation(String username, String password, String course) {
    if (username.isEmpty || password.isEmpty || course.isEmpty) {
      return false;
    }

    return true;
  }

  User createUser(String username, String password, String? course) {
    return User(username: username, password: password, course: course);
  }
}
