import 'package:flutter/material.dart';
import 'package:hope_doctor/bloc/default.dart';
import 'package:hope_doctor/screens/components/default-text-form-field.dart';
import 'package:hope_doctor/screens/components/main-button.dart';
import 'package:hope_doctor/screens/home/base.dart';
import 'package:hope_doctor/services/api-exception.dart';
import 'package:hope_doctor/services/authentication-service.dart';
import 'package:hope_doctor/theme/style.dart';
import 'package:hope_doctor/utils/alert-manager.dart';
import 'package:hope_doctor/utils/color.dart';
import 'package:hope_doctor/utils/validator.dart';
import 'package:provider/provider.dart';
import 'package:mdi/mdi.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode emailFocus = new FocusNode(), passwordFocus = new FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false, _loading = false,
      _isInitialised = false;
  String _email, _password;
  MainBloc mainBloc;
  AuthenticationService authenticationService;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    mainBloc = Provider.of<MainBloc>(context, listen:false);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authenticationService = new AuthenticationService(context: context);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Hero(
                  tag:"logo",
                  child: new Image.asset(
                    'images/logo.png',
                    fit: BoxFit.cover,
                    width: 167,
                    height: 59,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Welcome Back",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Lato',
                    color: HexColor("#444444"),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Provide Your Details To Sign In",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'Lato',
                    color: HexColor("#444444"),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                DefaultTextFormField(
                  hintText: "E-mail Address",
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) {
                    if (!validateEmail(val)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  nextFocus: passwordFocus,
                  onChanged: (text) {
                    setState(() {
                      _email = text;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                DefaultTextFormField(
                    hintText: "Password",
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Password cannot be empty';
                      }
                      if (val.length < 6) {
                        return 'Minimum characters is 6';
                      }
                      return null;
                    },
                    obscureText: !_showPassword,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: (text) {
                      setState(() {
                        _password = text;
                      });
                    },
                    suffixIcon: IconButton(
                      icon: _showPassword?
                      Icon(Mdi.eye, color: HexColor("#666666"),)
                          :Icon(Mdi.eyeOff,
                          color: HexColor("#666666")),
                      onPressed: (){
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                    )
                ),
                SizedBox(
                  height: 40,
                ),

                Container(
                  height: 60,
                  child: MainButton(
                    color: primaryColor,
                    child: !_loading ? Text(
                      "Sign In",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Lato',
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ):SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor:
                        new AlwaysStoppedAnimation<Color>(
                            Colors.white),
                      ),
                    ),
                    onPressed: () {
                      signIn();
                    },
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signIn() async{
    if (_formKey.currentState.validate()) {
      setState(() {
        _loading = true;
      });
      try{
        Map<String, dynamic> _res = await
        authenticationService.login(_email.trim(), _password.trim());
        if(_res['user']['role'] == "doctor"){
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context)
              => Base()));
          setState(() {
            _loading = false;
          });
        }else{
          AlertManager.showToast("Oops! Only doctor login required");
          AlertManager.showToast("Oops! Only doctor login required");
          setState(() {
            _loading = false;
          });
        }
      } on ApiException catch (e){
        setState(() {
          _loading = false;
        });
        AlertManager.showToast(e.message.toString());
      }
    }
  }
}
