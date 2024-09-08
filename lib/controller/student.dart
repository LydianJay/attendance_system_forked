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

    // final response = await http.post(uri, body: student.toJSON());
    final header = {"Content-Type": "application/json"};
    var req = http.Request('POST', uri);

    req.body = student.toJsonString().toString();
    req.headers.addAll(header);
    final response = await req.send();
    if (response.statusCode == 200) {
      // final jsonData = jsonDecode(response.body);
      debugPrint(await response.stream.bytesToString());
    } else {
      debugPrint("ERROR - Status Code: ${response.statusCode}");
    }
  }
}
