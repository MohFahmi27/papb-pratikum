import 'dart:convert';

import 'package:http/http.dart';
import 'package:papb/constants/api_path.dart';
import 'package:papb/modules/auth/models/login.dart';
import 'package:papb/modules/auth/models/register.dart';
import 'package:papb/modules/home/models/courses.dart';
import 'package:papb/modules/home/models/user.dart';

class RestApiService {
  static Future<Login> login(String email, String password) async {
    final response = await post(
      Uri.parse(ApiPath.loginRequestUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 400) {
      return Login.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load Data");
    }
  }

  static Future<Register> register(String email, String password) async {
    final response = await post(
      Uri.parse(ApiPath.registerRequestUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: Register().toRawJson(email, password),
    );

    if (response.statusCode == 200 || response.statusCode == 400) {
      return Register.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load Data");
    }
  }

  static Future<List<Datum>> usersData() async {
    final response = await get(
      Uri.parse(ApiPath.getUsersRequestUrl)
    );

    if (response.statusCode == 200) {
      var results = User.fromJson(jsonDecode(response.body));
      return results.data;
    } else {
      throw Exception("Failed to load Data");
    }
  }

  static Future<List<DataCourses>> coursesData() async {
    final response = await get(
        Uri.parse(ApiPath.getCoursesRequestUrl)
    );

    if (response.statusCode == 200) {
      var results = Courses.fromJson(jsonDecode(response.body));
      return results.data;
    } else {
      throw Exception("Failed to load Data");
    }
  }
}
