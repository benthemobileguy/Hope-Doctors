import 'package:flutter/material.dart';
import 'package:hope_doctor/model/user.dart';


class MainBloc with ChangeNotifier{

  String _bearerToken;
  User _user;


  String get bearerToken {
    return _bearerToken;
  }

  User get user {
    return _user;
  }

  set bearerToken(token) {
    _bearerToken = token;
  }

  set user(User _data) {
    this._user = _data;
    notifyListeners();
  }
}
