import 'package:flutter/material.dart';

import '../utils/helpers.dart';

class PasswordWidget extends StatelessWidget {
  final Function(String?) onChanged;
  const PasswordWidget(this.onChanged, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 20,
      ),
      width: double.infinity,
      child: TextFormField(
        decoration: const InputDecoration(
          labelText: "Password",
          prefixIcon: Icon(Icons.password),
          border: OutlineInputBorder(),
        ),
        validator: (value) => passwordValidator(value),
        onChanged: (value) => onChanged(value),
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
      ),
    );
  }
}

