import 'package:flutter/material.dart';
import 'package:papb/constants/app_routes.dart';
import 'package:papb/screens/detail/detail_user_arguments.dart';
import 'package:papb/widgets/button_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("HOME PAGE"),
            ButtonWidget(
              "Detail Screen + Data",
              16,
                  () {
                const args = DetailUserArguments("Mohammad Fahmi", 1181048);
                Navigator.pushNamed(
                    context, AppRoutes.detailUser, arguments: args);
              },
            )
          ],
        ),
      ),
    );
  }
}
