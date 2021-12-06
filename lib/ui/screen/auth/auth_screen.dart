import 'package:flutter/material.dart';
import 'package:travel_app/ui/screen/login/login_screen.dart';
import 'package:travel_app/ui/screen/signup/signup_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLoginScreen = true;

  void _changeAuthMethod(){
    setState(() {
      isLoginScreen = !isLoginScreen;
    });
  }


  @override
  Widget build(BuildContext context) {
    if(isLoginScreen){
      return LoginScreen(onSignUpPressed: _changeAuthMethod);
    }
    return SignUpScreen(onSignInPressed: _changeAuthMethod);
  }
}
