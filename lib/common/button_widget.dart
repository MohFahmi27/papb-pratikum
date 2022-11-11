import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String textButton;
  final double verticalMargin;
  final VoidCallback onPressedHandler;
// testing code space
  const ButtonWidget(
      this.textButton, this.verticalMargin, this.onPressedHandler,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: 14,
        vertical: verticalMargin,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onPressedHandler,
        child: Text(
          textButton,
          style: const TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
