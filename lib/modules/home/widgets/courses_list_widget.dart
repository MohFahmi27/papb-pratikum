import 'package:flutter/material.dart';

import '../models/courses.dart';
import 'courses_item_widget.dart';

class CoursesListWidget extends StatelessWidget {
  final List<DataCourses> dataCourses;

  const CoursesListWidget(this.dataCourses, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Container(
          padding: const EdgeInsets.only(bottom: 16),
          child: ListView.builder(
            physics: const ScrollPhysics(parent: null),
            itemCount: dataCourses.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final data = dataCourses[index];
              return CoursesItemWidget(
                data.name,
                data.year,
                data.color,
                data.pantoneValue,
              );
            },
          ),
        ),
      ),
    );
  }
}

