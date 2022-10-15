import 'package:flutter/material.dart';

import '../models/classmates.dart';
import 'class_mates_item_widget.dart';

class ClassMateListWidget extends StatelessWidget {
  final List<ClassMates> classMatesData;

  const ClassMateListWidget(this.classMatesData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
          physics: const ScrollPhysics(parent: null),
          itemCount: classMatesData.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final data = classMatesData[index];
            return ClassMatesItemWidget(
              data.id,
              data.picture,
              data.name,
              data.degree,
            );
          },
        ),
      ),
    );
  }
}
