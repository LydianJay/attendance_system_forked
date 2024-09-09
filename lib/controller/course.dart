import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rfid_attendance_system/config/dbconfig.dart';
import 'package:rfid_attendance_system/model/coursemodel.dart';
import 'dart:convert';

class CourseCtrl {
  static Future<List<CourseModel>> getCourseListByName(
      String courseName) async {
    final uri = Uri.http(DbConfig.ip,
        "flutter-rfid-attendance-system-backend/fetch/search_course.php");

    final header = {"Content-Type": "application/json"};
    var req = http.Request('POST', uri);
    final List<CourseModel> listModel = [];
    req.body = "{ \"value\":\"$courseName\" }";

    req.headers.addAll(header);
    final response = await req.send();
    if (response.statusCode == 200) {
      final result = await response.stream.bytesToString();
      final List<dynamic> list = jsonDecode(result);

      for (final jsonData in list) {
        listModel.add(
          CourseModel(
              id: int.parse(jsonData['id']),
              name: jsonData['name'],
              abbr: jsonData['abbr']),
        );
      }
    } else {
      debugPrint("ERROR - Status Code: ${response.statusCode}");
    }
    return listModel;
  }

  static Future<CourseModel?> getCourseByID(int rfid) async {
    final uri = Uri.http(DbConfig.ip,
        "flutter-rfid-attendance-system-backend/fetch/search_course.php");

    final header = {"Content-Type": "application/json"};
    var req = http.Request('POST', uri);
    req.body = "{ \"value\":\"$rfid\" }";

    req.headers.addAll(header);
    final response = await req.send();
    if (response.statusCode == 200) {
      final result = await response.stream.bytesToString();
      final List<dynamic> list = jsonDecode(result);

      if (list.isNotEmpty) {
        return CourseModel(
          id: rfid,
          name: list.first['name'],
          abbr: list.first['abbr'],
        );
      }
    } else {
      debugPrint("ERROR - Status Code: ${response.statusCode}");
    }
    return null;
  }
}
