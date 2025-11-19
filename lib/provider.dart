import 'package:flutter/material.dart';
import 'package:note_toker_app/model/user_model.dart';


class UserProvider extends ChangeNotifier {
  UserModel _user = UserModel(
    id: "",
    username: "",
    email: "",
    password: "",
  );

  UserModel get user => _user;

  void setUser(String user) {
    _user = UserModel.fromJson(user);
    notifyListeners();
  }

  void logOut() {
    _user = UserModel(
      id: "",
      username: "",
      email: "",
      password: "",
    );

    notifyListeners();
  }
}