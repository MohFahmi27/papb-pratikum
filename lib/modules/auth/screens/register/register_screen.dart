import 'package:flutter/material.dart';
import 'package:papb/modules/auth/widgets/email_widget.dart';
import 'package:papb/modules/auth/widgets/password_widget.dart';

import '../../../../common/button_widget.dart';
import '../../../../common/logo_widget.dart';
import '../../../../utils/services/rest_api_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _isLoading = false;

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
                    children: [
                      const Text(
                        "Daftar",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        child: const Text(
                          "Silahkan Register mendapatkan akun dll",
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
                ButtonWidget(
                  "Register",
                  24,
                  () {
                    FocusScope.of(context).unfocus();
                    var isValid = _formKey.currentState!.validate();
                    checkRegisterStatus(context, isValid);
                  },
                ),
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

  void checkRegisterStatus(BuildContext context, bool isValid) {
    if (isValid) {
      setState(() => _isLoading = true);
      RestApiService.register(_email.text, _password.text).then((value) {
        if (value.token!.isNotEmpty) {
          _navigateToLoginScreen();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              value.error ?? "Something Went Wrong",
              style: const TextStyle(fontSize: 20),
            ),
            backgroundColor: Colors.red,
          ));
        }
        setState(() => _isLoading = false);
      });
    }
  }

  void _navigateToLoginScreen() {
    Navigator.pop(context);
  }
}
