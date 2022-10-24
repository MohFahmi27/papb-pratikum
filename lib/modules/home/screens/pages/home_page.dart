import 'package:flutter/material.dart';
import 'package:papb/modules/home/models/classmates.dart';

import '../../widgets/class_mate_list_widget.dart';
import '../../widgets/home_banner_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ClassMates> classMatesData = <ClassMates>[
    ClassMates("11182312", "Someone 1", "Informatika 2018",
        "assets/images/profile.jpeg"),
    ClassMates("11182332", "Someone 2", "Informatika 2018",
        "assets/images/profile.jpeg"),
    ClassMates("11182311", "Someone 3", "Informatika 2019",
        "assets/images/profile.jpeg"),
    ClassMates("11182355", "Someone 4", "Informatika 2020",
        "assets/images/profile.jpeg"),
    ClassMates("11182552", "Someone 5", "Informatika 2021",
        "assets/images/profile.jpeg"),
    ClassMates("11182511", "Someone 6", "Informatika 2022",
        "assets/images/profile.jpeg"),
    ClassMates("111825342", "Someone 7", "Informatika 2021",
        "assets/images/profile.jpeg"),
    ClassMates("111825667", "Someone 8", "Informatika 2022",
        "assets/images/profile.jpeg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HomeBannerWidget(),
          Container(
            margin: const EdgeInsets.only(
              top: 24,
              left: 20,
            ),
            width: double.infinity,
            child: const Text(
              "Classmates",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ClassMateListWidget(classMatesData)
        ],
      ),
    );
  }
}
