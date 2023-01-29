import 'package:flutter/material.dart';
import 'package:papb/modules/auth/widgets/email_widget.dart';
import 'package:papb/modules/auth/widgets/password_widget.dart';
import 'package:papb/utils/services/local_storage_service.dart';
import 'package:papb/utils/services/rest_api_service.dart';

import '../../../../common/button_widget.dart';
import '../../../../common/logo_widget.dart';
import '../../../../constants/app_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  final _email = TextEditingController();
  final _password = TextEditingController();

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
                    children: [
                      const Text(
                        "Welcome",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        child: const Text(
                          "Masuk untuk dapat mengakses informasi dll",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                EmailWidget(_email),
                PasswordWidget(_password),
                const SizedBox(
                  height: 18,
                ),
                loginButton(),
                registerButton(),
                if (_isLoading)
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: const CircularProgressIndicator(),
                    ),
                  )
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
          checkLoginStatus(context, isValid);
        }),
      );

  Widget registerButton() => Builder(
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

  checkLoginStatus(BuildContext context, bool isValid) {
    if (isValid) {
      setState(() => _isLoading = true);
      RestApiService.login(_email.text, _password.text).then((value) {
        if (value.token!.isNotEmpty) {
          setLoginState();
          navigateToHomeScreen(context);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              value.error ?? "Credentials Wrong",
              style: const TextStyle(fontSize: 20),
            ),
            backgroundColor: Colors.red,
          ));
        }
        setState(() => _isLoading = false);
      });
    }
  }

  void navigateToHomeScreen(BuildContext context) {
    Navigator.popAndPushNamed(context, AppRoutes.home);
  }

  void navigateToRegister(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.register);
  }

  Future setLoginState() async {
    LocalStorageService.setStateLogin(true);
  }
}
