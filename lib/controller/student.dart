import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rfid_attendance_system/config/dbconfig.dart';
import 'dart:convert';

class StudentCtrl {
  static dynamic fetchAll() async {
    final uri = Uri.http(DbConfig.ip, "backend/fetch/get_data.php");
    final response = await http.post(uri);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return jsonData;
    } else {
      debugPrint("ERROR - Status Code: ${response.statusCode}");
    }
    return null;
  }
}
