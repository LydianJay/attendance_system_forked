import 'package:rfid_attendance_system/model/coursemodel.dart';
import 'package:rfid_attendance_system/model/nstpcoursemodel.dart';

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
  final int nstpid;
  CourseModel? course;
  NTSPCourseModel? nstp;
  StudentModel({
    this.course,
    this.nstp,
    required this.rfid,
    required this.fname,
    required this.mname,
    required this.lname,
    required this.bday,
    required this.bmonth,
    required this.byear,
    required this.gender,
    required this.courseid,
    required this.nstpid,
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
      "nstpID": nstpid,
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
      "\"nstpID\"": "\"${nstpid.toString()}\"",
    };
  }
}
