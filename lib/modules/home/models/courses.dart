// To parse this JSON data, do
//
//     final courses = coursesFromJson(jsonString);

import 'dart:convert';

class Courses {
  Courses({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
  });

  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<DataCourses> data;

  factory Courses.fromRawJson(String str) => Courses.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Courses.fromJson(Map<String, dynamic> json) => Courses(
    page: json["page"],
    perPage: json["per_page"],
    total: json["total"],
    totalPages: json["total_pages"],
    data: List<DataCourses>.from(json["data"].map((x) => DataCourses.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "per_page": perPage,
    "total": total,
    "total_pages": totalPages,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DataCourses {
  DataCourses({
    required this.id,
    required this.name,
    required this.year,
    required this.color,
    required this.pantoneValue,
  });

  final int id;
  final String name;
  final int year;
  final String color;
  final String pantoneValue;

  factory DataCourses.fromRawJson(String str) => DataCourses.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DataCourses.fromJson(Map<String, dynamic> json) => DataCourses(
    id: json["id"],
    name: json["name"],
    year: json["year"],
    color: json["color"],
    pantoneValue: json["pantone_value"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "year": year,
    "color": color,
    "pantone_value": pantoneValue,
  };
}
