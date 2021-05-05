import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hope_doctor/bloc/default.dart';
import 'package:hope_doctor/screens/auth/login-screen.dart';
import 'package:hope_doctor/utils/alert-manager.dart';
import 'package:hope_doctor/utils/pref-manager.dart';
import 'package:provider/provider.dart';

class ApiException implements Exception {
  int code;
  String message;
  PrefManager prefManager = PrefManager();
  Map<String, dynamic> errors;
  bool preventRedirect;
  BuildContext context;

  ApiException(
      {this.code,
        this.message,
        this.preventRedirect = false,
        this.errors,
        @required this.context}) {
    switch (code) {
      case 401:
        logOut();
        AlertManager.showToast("Your session has expired. Please login");
        break;
      default:
        Fluttertoast.showToast(msg: message, backgroundColor: Colors.red);
        break;
    }
  }

  void logOut() {
    prefManager.clearSharedPreferences().then((value){
      Provider.of<MainBloc>(context, listen:false).bearerToken= null;
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context)
          => LoginScreen()));
    });
  }
}

