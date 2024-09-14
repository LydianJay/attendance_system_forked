import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:rfid_attendance_system/config/dbconfig.dart';


class Authenticator {
  static Future<bool> authenticateAdmin(
      String username, String password) async {
    final uri = Uri.http(
        DbConfig.ip, "flutter-rfid-attendance-system-backend/auth/auth.php");
    final header = {"Content-Type": "application/json"};
    var req = http.Request('POST', uri);
    req.headers.addAll(header);

    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    req.body = "{ \"uname\":\"$username\",\"pass\":\"${digest.toString()}\" }";
    final response = await req.send();
    if (response.statusCode == 200) {
      final code = await response.stream.bytesToString();
      return code == "ok";
    }
    return false;
  }
}
