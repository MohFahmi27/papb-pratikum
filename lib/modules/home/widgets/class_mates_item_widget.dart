import 'package:flutter/material.dart';

import '../../../constants/app_routes.dart';
import '../screens/detail/detail_user_arguments.dart';

class ClassMatesItemWidget extends StatelessWidget {
  final String id;
  final String assetImage;
  final String title;
  final String subTitle;

  const ClassMatesItemWidget(this.id, this.assetImage, this.title, this.subTitle, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            assetImage,
            width: 45,
            height: 40,
          ),
        ),
        title: Text(
          title,
        ),
        subtitle: Text(subTitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          var args = DetailUserArguments(title, id);
          Navigator.pushNamed(context, AppRoutes.detailUser, arguments: args);
        },
      ),
    );
  }
}
