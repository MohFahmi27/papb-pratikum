import 'package:flutter/material.dart';
import 'package:papb/utils/services/local_storage_service.dart';
import 'package:papb/widgets/email_widget.dart';
import 'package:papb/widgets/logo_widget.dart';
import 'package:papb/widgets/password_widget.dart';

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
                Container(
                  margin: const EdgeInsets.only(bottom: 24),
                  child: Column(
                    children: const [
                      Text(
                        "Welcome",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        "Masuk untuk dapat mengakses informasi dll",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
                EmailWidget((value) => _email = value.toString()),
                PasswordWidget((value) => _password = value.toString()),
                const SizedBox(
                  height: 18,
                ),
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
        builder: (context) => ButtonWidget("Masuk", 0, () {
          FocusScope.of(context).unfocus();
          var isValid = _formKey.currentState!.validate();
          checkLoginStatus(context, isValid, _email, _password);
        }),
      );

  Widget loginRegister() => Builder(
        builder: (context) => Container(
          height: 55,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 14,
          ),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.indigo),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () => navigateToRegister(context),
            child: const Text(
              "Register",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ),
      );

  void checkLoginStatus(
      BuildContext context, bool isValid, String email, String password) {
    if (isValid && (email == "test@gmail.com") && (password == "test")) {
      setLoginState();
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

  Future setLoginState() async {
    LocalStorageService.setStateLogin(true);
  }
}
