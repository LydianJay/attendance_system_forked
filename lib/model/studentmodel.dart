import 'package:rfid_attendance_system/model/coursemodel.dart';

class StudentModel {
  final int rfid;
  final String fname;
  final String mname;
  final String lname;
  final int bday;
  final int bmonth;
  final int byear;
  final int gender;
  final int courseid;
  CourseModel? course;
  StudentModel({
    this.course,
    required this.rfid,
    required this.fname,
    required this.mname,
    required this.lname,
    required this.bday,
    required this.bmonth,
    required this.byear,
    required this.gender,
    required this.courseid,
  });

  Map<String, dynamic> toJSON() {
    return {
      "rfid": rfid,
      "fname": fname,
      "mname": mname,
      "lname": lname,
      "bday": bday,
      "bmonth": bmonth,
      "byear": byear,
      "gender": gender,
      "courseID": courseid,
    };
  }

  Map<String, String> toJsonString() {
    return {
      "\"rfid\"": "\"${rfid.toString()}\"",
      "\"fname\"": "\"$fname\"",
      "\"mname\"": "\"$mname\"",
      "\"lname\"": "\"$lname\"",
      "\"bday\"": "\"${bday.toString()}\"",
      "\"bmonth\"": "\"${bmonth.toString()}\"",
      "\"byear\"": "\"${byear.toString()}\"",
      "\"gender\"": "\"${gender.toString()}\"",
      "\"courseID\"": "\"${courseid.toString()}\"",
    };
  }
}
