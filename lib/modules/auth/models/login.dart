class Login {
  final String? token;
  final String? error;

  Login({this.token, this.error});

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(token: json["token"] ?? "",
        error: json["error"] ?? "");
  }

}