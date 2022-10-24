import 'package:flutter/material.dart';

import 'detail_user_arguments.dart';

class DetailUserScreen extends StatelessWidget {
  final DetailUserArguments args;
  const DetailUserScreen(this.args, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Detail",
        ),
        centerTitle: true,
      ),
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

