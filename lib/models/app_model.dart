import 'package:scoped_model/scoped_model.dart';

class AppModel extends Model {
  User user = User(name: '', email: '');

  String get user_name => user.name;

  updateUser(User foo) {
    user = foo;
    notifyListeners();
  }
}

class User {
  String email;
  String name;

  String last_name;

  String first_name;

  String id;

  User(
      {this.name,
      this.email,
      this.first_name = '',
      this.last_name = '',
      this.id = ''});
}
