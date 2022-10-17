import 'package:flutter/material.dart';

import '../../../../utils/services/rest_api_service.dart';
import '../../models/user.dart';
import '../../widgets/class_mate_list_widget.dart';
import '../../widgets/home_banner_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Datum>> _usersData;

  @override
  void initState() {
    _usersData = RestApiService.usersData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HomeBannerWidget(),
          Container(
            margin: const EdgeInsets.only(
              top: 24,
              bottom: 14,
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
          fetchUserData()
        ],
      ),
    );
  }

  FutureBuilder<List<Datum>> fetchUserData() =>
      FutureBuilder<List<Datum>>(
        future: _usersData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ClassMateListWidget(snapshot.data as List<Datum>);
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"),);
          }
          return const CircularProgressIndicator();
        },
      );
}
