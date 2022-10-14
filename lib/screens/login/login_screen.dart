import 'package:flutter/material.dart';
import 'package:papb/screens/home/home_screen.dart';
import 'package:papb/screens/register/register_screen.dart';
import 'package:papb/widgets/email_widget.dart';
import 'package:papb/widgets/logo_widget.dart';
import 'package:papb/widgets/password_widget.dart';
import 'package:papb/widgets/title_widget.dart';

import '../../constants/app_routes.dart';
import '../../widgets/button_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  var _email = "";
  var _password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const LogoWidget(),
                const TitleWidget("Login"),
                EmailWidget((value) => _email = value.toString()),
                PasswordWidget((value) => _password = value.toString()),
                loginButton(),
                loginRegister(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loginButton() => Builder(
        builder: (context) => ButtonWidget("Masuk", 8, () {
          FocusScope.of(context).unfocus();
          var isValid = _formKey.currentState!.validate();
          checkLoginStatus(context, isValid, _email, _password);
        }),
      );

  Widget loginRegister() => Builder(
      builder: (context) => ButtonWidget(
            "Register",
            8,
            () => navigateToRegister(context),
          ));

  void checkLoginStatus(
      BuildContext context, bool isValid, String email, String password) {
    if (isValid && (email == "test@gmail.com") && (password == "test")) {
      navigateToHomeScreen(context);
    } else {
      const message = "Credentials Wrong";
      const snackBar = SnackBar(
        content: Text(
          message,
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void navigateToHomeScreen(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.home);
  }

  void navigateToRegister(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.register);
  }
}
