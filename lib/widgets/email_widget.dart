import 'package:flutter/material.dart';

import '../utils/helpers.dart';

class EmailWidget extends StatelessWidget {
  final Function(String?) onChanged;

  const EmailWidget(this.onChanged, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      child: TextFormField(
        decoration: const InputDecoration(
          labelText: "Email",
          prefixIcon: Icon(Icons.email),
          border: OutlineInputBorder(),
        ),
        validator: (value) => emailValidator(value),
        onChanged: (value) => onChanged(value),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }
}
