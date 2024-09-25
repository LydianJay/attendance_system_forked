import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rfid_attendance_system/model/attendancemodel.dart';
import 'package:rfid_attendance_system/config/dbconfig.dart';
import 'dart:convert';

import 'package:rfid_attendance_system/model/csvmodel.dart';

class AttendanceCtrl {
  static Future<List<AttendanceModel>> fetchAll() async {
    final uri = Uri.http(DbConfig.ip,
        "flutter-rfid-attendance-system-backend/fetch/get_attendance.php");
    final header = {"Content-Type": "application/json"};
    final List<AttendanceModel> attendance = [];
    var req = http.Request('POST', uri);
    req.headers.addAll(header);
    final response = await req.send();
    if (response.statusCode == 200) {
      final bytes = await response.stream.bytesToString();

      final List<dynamic> list = jsonDecode(bytes);
      for (final jsonData in list) {
        attendance.add(
          AttendanceModel(
            rfid: int.parse(jsonData['rfid']),
            day: int.parse(jsonData['day']),
            month: int.parse(jsonData['month']),
            year: int.parse(jsonData['year']),
            hour: int.parse(jsonData['time'].toString().split(':').first),
            min: int.parse(jsonData['time'].toString().split(':').last),
            type: int.parse(jsonData['type']),
          ),
        );
      }
      return attendance;
    } else {
      debugPrint("ERROR - Status Code: ${response.statusCode}");
    }
    return [];
  }

  static Future<List<AttendanceModel>> fetchAttendance(
      int month, int min, int max, int year) async {
    final uri = Uri.http(DbConfig.ip,
        "flutter-rfid-attendance-system-backend/fetch/get_attendance_param.php");
    final header = {"Content-Type": "application/json"};
    final req = http.Request('POST', uri);
    req.headers.addAll(header);
    req.body =
        "{ \"month\":\"$month\",\"min\":\"$min\", \"max\":\"$max\", \"year\":\"$year\"}";
    final response = await req.send();
    final List<AttendanceModel> attendance = [];

    if (response.statusCode == 200) {
      final bytes = await response.stream.bytesToString();
      final List<dynamic> list = jsonDecode(bytes);
      for (final jsonData in list) {
        attendance.add(
          AttendanceModel(
            rfid: int.parse(jsonData['rfid']),
            day: int.parse(jsonData['day']),
            month: int.parse(jsonData['month']),
            year: int.parse(jsonData['year']),
            hour: int.parse(jsonData['time'].toString().split(':').first),
            min: int.parse(jsonData['time'].toString().split(':').last),
            type: int.parse(jsonData['type']),
          ),
        );
      }
      return attendance;
    }
    return [];
  }

  static Future<List<CSVModel>> fetchAssocAttendance(
      int month, int min, int max, int year) async {
    final uri = Uri.http(DbConfig.ip,
        "flutter-rfid-attendance-system-backend/fetch/get_student_attendance.php");
    final header = {"Content-Type": "application/json"};
    final req = http.Request('POST', uri);
    req.headers.addAll(header);
    req.body =
        "{ \"month\":\"$month\",\"min\":\"$min\", \"max\":\"$max\", \"year\":\"$year\"}";
    final response = await req.send();
    final List<CSVModel> attendance = [];

    if (response.statusCode == 200) {
      final bytes = await response.stream.bytesToString();
      debugPrint("From Controller: $bytes");
      final List<dynamic> list = jsonDecode(bytes);
      for (final jsonData in list) {
        attendance.add(
          CSVModel(
            rfid: int.parse(jsonData['rfid']),
            fname: jsonData['fname'],
            mname: jsonData['mname'],
            lname: jsonData['lname'],
            gender: int.parse(jsonData['gender']),
            nstp: jsonData['nstp'],
            course: jsonData['course_name'],
            day: int.parse(jsonData['day']),
            type: int.parse(jsonData['type']),
            time: jsonData['time'],
          ),
        );
      }
      return attendance;
    } else {
      debugPrint("Fetching attendance error ${response.statusCode}");
    }
    return [];
  }
}
