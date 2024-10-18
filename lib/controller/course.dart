import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rfid_attendance_system/config/dbconfig.dart';
import 'package:rfid_attendance_system/model/coursemodel.dart';
import 'dart:convert';

import 'package:rfid_attendance_system/model/nstpcoursemodel.dart';

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
            abbr: jsonData['abbr'],
          ),
        );
      }
    } else {
      debugPrint("ERROR - Status Code: ${response.statusCode}");
    }
    return listModel;
  }

  static Future<List<NTSPCourseModel>> getNSTPCourse() async {
    final uri = Uri.http(DbConfig.ip,
        "flutter-rfid-attendance-system-backend/fetch/get_nstp_course.php");
    final header = {"Content-Type": "application/json"};
    var req = http.Request('GET', uri);
    req.headers.addAll(header);
    List<NTSPCourseModel> resultlist = [];
    final response = await req.send();
    if (response.statusCode == 200) {
      final result = await response.stream.bytesToString();
      final List<dynamic> list = jsonDecode(result);

      for (final jsonData in list) {
        resultlist.add(
          NTSPCourseModel(
            id: int.parse(jsonData['id']),
            name: jsonData['name'],
            abbr: jsonData['abbr'],
          ),
        );
      }
    }

    return resultlist;
  }

  static Future<CourseModel?> getCourseByID(int rfid) async {
    final uri = Uri.http(DbConfig.ip,
        "flutter-rfid-attendance-system-backend/fetch/get_course_by_id.php");

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

  static Future<List<NTSPCourseModel>> getNSTPListByName(
      String courseName) async {
    final uri = Uri.http(DbConfig.ip,
        "flutter-rfid-attendance-system-backend/fetch/search_nstp.php");

    final header = {"Content-Type": "application/json"};
    var req = http.Request('POST', uri);
    final List<NTSPCourseModel> listModel = [];
    req.body = "{ \"value\":\"$courseName\" }";

    req.headers.addAll(header);
    final response = await req.send();
    if (response.statusCode == 200) {
      final result = await response.stream.bytesToString();
      debugPrint(result);
      final List<dynamic> list = jsonDecode(result);

      for (final jsonData in list) {
        listModel.add(
          NTSPCourseModel(
            id: int.parse(jsonData['id']),
            name: jsonData['name'],
            abbr: jsonData['abbr'],
          ),
        );
      }
    } else {
      debugPrint("ERROR - Status Code: ${response.statusCode}");
    }
    return listModel;
  }
}
