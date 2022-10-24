import 'package:flutter/material.dart';

import '../../../utils/helpers/validator_helpers.dart';

class PasswordWidget extends StatelessWidget {
  final Function(String?) onChanged;
  const PasswordWidget(this.onChanged, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
      width: double.infinity,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Password",
          prefixIcon: const Icon(Icons.password),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        validator: (value) => passwordValidator(value),
        onChanged: (value) => onChanged(value),
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
      ),
    );
  }
}

