import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rfid_attendance_system/config/dbconfig.dart';
import 'package:rfid_attendance_system/model/studentmodel.dart';
import 'dart:convert';

class StudentCtrl {
  static dynamic fetchAll() async {
    final uri = Uri.http(DbConfig.ip,
        "flutter-rfid-attendance-system-backend/fetch/get_data.php");
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return jsonData;
    } else {
      debugPrint("ERROR - Status Code: ${response.statusCode}");
    }
    return null;
  }

  static void insertUser(StudentModel student) async {
    final uri = Uri.http(DbConfig.ip,
        "flutter-rfid-attendance-system-backend/set/insert_student.php");

    final header = {"Content-Type": "application/json"};
    var req = http.Request('POST', uri);

    req.body = student.toJsonString().toString();
    req.headers.addAll(header);
    final response = await req.send();
    if (response.statusCode == 200) {
      debugPrint(await response.stream.bytesToString());
    } else {
      debugPrint("ERROR - Status Code: ${response.statusCode}");
    }
  }

  static Future<StudentModel?>? searchStudent(int rfid) async {
    final uri = Uri.http(DbConfig.ip,
        "flutter-rfid-attendance-system-backend/fetch/search_student.php");

    final header = {"Content-Type": "application/json"};
    var req = http.Request('POST', uri);
    req.body = "{ \"value\":\"$rfid\" }";
    req.headers.addAll(header);
    final response = await req.send();
    if (response.statusCode == 200) {
      final bytes = await response.stream.bytesToString();

      final List<dynamic> result = jsonDecode(bytes);
      if (result.isNotEmpty) {
        final r = result.first;

        return StudentModel(
          rfid: rfid,
          fname: r["fname"],
          mname: r["mname"],
          lname: r["lname"],
          bday: int.parse(r["bday"]),
          bmonth: int.parse(r["bmonth"]),
          byear: int.parse(r["byear"]),
          gender: int.parse(r["gender"]),
          courseid: int.parse(r["courseID"]),
        );
      }
    } else {
      debugPrint("ERROR - Status Code: ${response.statusCode}");
    }

    return null;
  }

  static void modifyStudent(StudentModel student) async {
    final uri = Uri.http(DbConfig.ip,
        "flutter-rfid-attendance-system-backend/set/modify_student.php");

    final header = {"Content-Type": "application/json"};
    var req = http.Request('POST', uri);

    req.body = student.toJsonString().toString();
    req.headers.addAll(header);
    final response = await req.send();
    if (response.statusCode == 200) {
      debugPrint(await response.stream.bytesToString());
    } else {
      debugPrint("ERROR - Status Code: ${response.statusCode}");
    }
  }

  static Future<List<int>> getStudentCount() async {
    final uri = Uri.http(DbConfig.ip,
        "flutter-rfid-attendance-system-backend/fetch/count_student.php");
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return [int.parse(jsonData.first['num']), int.parse(jsonData[1]['num'])];
    } else {
      debugPrint("ERROR - Status Code: ${response.statusCode}");
    }
    return [];
  }

  static Future<bool> deleteStudent(int rfid) async {
    final uri = Uri.http(DbConfig.ip,
        "flutter-rfid-attendance-system-backend/delete/delete_student.php");

    final header = {"Content-Type": "application/json"};
    var req = http.Request('POST', uri);
    req.body = "{ \"value\":\"$rfid\" }";
    req.headers.addAll(header);
    final response = await req.send();
    if (response.statusCode == 200) {
      final bytes = await response.stream.bytesToString();

      if (bytes.isNotEmpty) {
        debugPrint(bytes.toString());
        return bytes == "success";
      }
    } else {
      debugPrint("ERROR - Status Code: ${response.statusCode}");
    }

    return false;
  }
}
