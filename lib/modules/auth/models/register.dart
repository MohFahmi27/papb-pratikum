// To parse this JSON data, do
//
//     final register = registerFromJson(jsonString);

import 'dart:convert';

class Register {
  Register({
    this.id,
    this.token,
    this.error,
  });

  final int? id;
  final String? token;
  final String? error;

  String toRawJson(email, password) => json.encode(toJson(email, password));

  factory Register.fromJson(Map<String, dynamic> json) => Register(
    id: json["id"] ?? 0,
    token: json["token"] ?? "",
    error: json["error"] ?? "",
  );

  Map<String, String> toJson(email, password) => {
    "email": email,
    "password": password,
  };
}
