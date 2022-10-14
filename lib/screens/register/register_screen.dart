import 'package:flutter/material.dart';
import 'package:papb/widgets/email_widget.dart';
import 'package:papb/widgets/logo_widget.dart';
import 'package:papb/widgets/password_widget.dart';
import 'package:papb/widgets/title_widget.dart';

import '../../widgets/button_widget.dart';
import '../login/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                const TitleWidget("Register"),
                EmailWidget((value) => _email = value.toString()),
                PasswordWidget((value) => _password = value.toString()),
                ButtonWidget(
                  "Register",
                  24,
                  () {
                    FocusScope.of(context).unfocus();
                    var isValid = _formKey.currentState!.validate();
                    checkRegisterStatus(context, isValid, _email, _password);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checkRegisterStatus(
      BuildContext context, bool isValid, String email, String password) {
    if (isValid && (email == "test@gmail.com") && (password == "test")) {
      _navigateToLoginScreen();
    } else {
      const message = "Register UnSuccessfully";
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

  void _navigateToLoginScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }
}
