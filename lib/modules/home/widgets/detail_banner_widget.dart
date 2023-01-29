import 'package:flutter/material.dart';

class DetailBannerWidget extends StatelessWidget {
  final String fullName;
  final String email;
  final String avatarUrl;

  const DetailBannerWidget(this.fullName, this.email, this.avatarUrl,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 350,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          color: Colors.indigo.shade800,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 75,
                backgroundColor: Colors.indigo.shade400,
                child: CircleAvatar(
                  radius: 70,
                  foregroundImage: NetworkImage(avatarUrl),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 25),
                child: Text(
                  fullName,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 14),
                child: Text(
                  email,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
