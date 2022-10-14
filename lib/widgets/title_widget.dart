import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String titlePage;
  const TitleWidget(this.titlePage, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 20,
      ),
      child: Text(
        titlePage,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 30,
        ),
      ),
    );
  }
}
