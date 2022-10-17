import 'package:flutter/material.dart';

import '../../../utils/helpers/validator_helpers.dart';

class EmailWidget extends StatelessWidget {
  final TextEditingController controller;

  const EmailWidget(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Email",
          prefixIcon: const Icon(Icons.email),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        validator: (value) => emailValidator(value),
        controller: controller,
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }
}
