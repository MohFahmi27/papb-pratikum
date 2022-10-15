import 'package:flutter/material.dart';
import 'package:papb/widgets/email_widget.dart';
import 'package:papb/widgets/logo_widget.dart';
import 'package:papb/widgets/password_widget.dart';

import '../../widgets/button_widget.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Register",
        ),
        centerTitle: true,
    ),
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const LogoWidget(),
                Container(
                  margin: const EdgeInsets.only(bottom: 24),
                  child: Column(
                    children: const [
                      Text(
                        "Daftar",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        "Silahkan Register mendapatkan akun dll",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
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
    Navigator.pop(context);
  }
}
