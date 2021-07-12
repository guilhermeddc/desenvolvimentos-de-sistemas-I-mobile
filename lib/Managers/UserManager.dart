import 'package:ds1/http/Api.dart';
import 'package:ds1/interfaces/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserManager extends ChangeNotifier {
  UserManager() {
    _loadCurrentUser();
  }

  User user;

  String token = '';

  bool get isLoggedIn => user != null;

  bool _loading = false;
  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> signIn({User user, Function onFail, Function onSuccess}) async {
    loading = true;

    try {
      final response = await http.post(Uri.parse('${Api.BASE_URL}/sessions'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'email': user.email,
            'password': user.password
          }));

      print(response.body);
      token = json.decode(response.body)['token'] as String;
      user.email = json.decode(response.body)['user']['email'] as String;
      user.id = json.decode(response.body)['user']['id'] as int;

      onSuccess();
      notifyListeners();
    } catch (e) {
      onFail(e);
    }
    loading = false;
  }

  Future<void> signUp({User user, Function onFail, Function onSuccess}) async {
    loading = true;

    try {
      onSuccess();
    } catch (e) {
      onFail(e.code);
    }

    loading = false;
  }

  void signOut() {
    user = null;
    notifyListeners();
  }

  Future<void> _loadCurrentUser({User user}) async {
    User currentUser = user; // ?? await auth.currentUser();

    if (currentUser != null) {
      notifyListeners();
    }
  }
}
