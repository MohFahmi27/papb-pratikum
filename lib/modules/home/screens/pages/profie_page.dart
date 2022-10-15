import 'package:flutter/material.dart';

import '../../../../common/button_widget.dart';
import '../../../../constants/app_routes.dart';
import '../../../../utils/services/local_storage_service.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ButtonWidget(
          "Logout",
          16,
          () async {
            LocalStorageService.setStateLogin(false);
            Navigator.pushReplacementNamed(context, AppRoutes.login);
          },
        ),
      ),
    );
  }
}
