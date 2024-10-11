import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rfid_attendance_system/config/dbconfig.dart';

class SystemCtrl {
  static Future<bool> checkUpdates() async {
    final uri = Uri.https('raw.githubusercontent.com',
        'LydianJay/flutter-rfid-attendance-system/refs/heads/main/pubspec.yaml');

    final header = {"Content-Type": "text/html; charset=utf-8"};
    var req = http.Request('GET', uri);
    req.headers.addAll(header);
    final response = await req.send();

    if (response.statusCode == 200) {
      final body = await response.stream.bytesToString();
      final data = body.toString().split('\n');
      for (final line in data) {
        if (line.contains('version:')) {
          DbConfig.newVersion = line
              .split(' ')
              .last
              .replaceAll(RegExp(r' '), '')
              .split('+')
              .first;
          debugPrint('Version: ${DbConfig.newVersion}');
        }
        // else {
        //   debugPrint('$lineNum $line');
        // }
      }
    } else {
      debugPrint("Error CODE: ${response.statusCode}");
    }
    final info = await PackageInfo.fromPlatform();
    DbConfig.currentVersion = info.version;

    final cVal = info.version.split('.');
    final nVal = DbConfig.newVersion.split('.');
    double cVer = double.parse(cVal.first);
    double nVer = double.parse(nVal.first);
    for (int i = 1; i < 3; i++) {
      cVer += double.parse(cVal[i]) / 100.0;
      cVer *= 10.0;
      nVer += double.parse(nVal[i]) / 100.0;
      nVer *= 10.0;
    }

    debugPrint(cVal.toString());
    debugPrint(nVal.toString());
    debugPrint("Current Val: $cVer");
    debugPrint("New Val: $nVer");

    return (nVer > cVer);
  }
}
