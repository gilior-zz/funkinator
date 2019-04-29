import 'package:scoped_model/scoped_model.dart';

class AppModel extends Model {
  User user = User(first_name: '', email: '');

  String get user_name => user.first_name;

//  updateUser(User foo) {
//    user = foo;
//    notifyListeners();
//  }
  updateUser({String email, String first_name, String last_name, String id}) {
    user.email = email;
    user.id = id;
    user.last_name = last_name;
    user.first_name = first_name;
    notifyListeners();
  }
}

class User {
  String email;

  String last_name;

  String first_name;

  String id;

  User({this.email, this.first_name = '', this.last_name = '', this.id = ''});
}
