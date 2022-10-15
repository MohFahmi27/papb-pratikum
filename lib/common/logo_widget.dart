import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 28),
      child: Image.asset(
        'assets/images/logo_itk.png',
        width: 150,
        height: 150,
      ),
    );
  }
}

