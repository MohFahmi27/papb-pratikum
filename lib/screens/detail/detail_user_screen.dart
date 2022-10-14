import 'package:flutter/material.dart';
import 'package:papb/screens/detail/detail_user_arguments.dart';

class DetailUserScreen extends StatelessWidget {
  final DetailUserArguments args;
  const DetailUserScreen(this.args, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("idUser: ${args.idUser}"),
            Text("Nama: ${args.userName}"),
          ],
        ),
      ),
    );
  }
}

