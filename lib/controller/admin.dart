import 'package:http/http.dart' as http;
import 'package:rfid_attendance_system/config/dbconfig.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class AdminCtrl {
  static Future<bool> modifyAdmin(String currentName, String currentPass,
      String newName, String newPass) async {
    final uri = Uri.http(
        DbConfig.ip, "flutter-rfid-attendance-system-backend/auth/modify.php");
    final header = {"Content-Type": "application/json"};
    var req = http.Request('POST', uri);
    final oldPassBytes = utf8.encode(currentPass);
    final newPassBytes = utf8.encode(newPass);
    final sha256Old = sha256.convert(oldPassBytes);
    final sha256New = sha256.convert(newPassBytes);

    req.body =
        "{ \"oldname\":\"$currentName\",\"oldpass\":\"${sha256Old.toString()}\",\"newname\":\"$newName\",\"newpass\":\"${sha256New.toString()}\" }";
    req.headers.addAll(header);
    final response = await req.send();

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
