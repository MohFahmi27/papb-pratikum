import 'package:flutter/material.dart';
import 'package:papb/utils/helpers/color_helper.dart';

class CoursesItemWidget extends StatelessWidget {
  final String name;
  final int year;
  final String courseColor;
  final String courseNumber;

  const CoursesItemWidget(this.name, this.year, this.courseColor, this.courseNumber,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
        ),
        child: ListTile(
          leading: Container(
            width: 60,
            height: 250,
            color: courseColor.toColor(),
          ),
          title: Text(
            name.toUpperCase(),
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Container(
            margin: const EdgeInsets.only(top: 6),
            child: Text(
              "$year | $courseNumber",
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
