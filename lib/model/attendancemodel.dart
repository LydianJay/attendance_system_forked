class AttendanceModel {
  final int rfid;
  final int day;
  final int month;
  final int year;
  final int hour;
  final int min;
  final int type;

  AttendanceModel({
    required this.rfid,
    required this.day,
    required this.month,
    required this.year,
    required this.hour,
    required this.min,
    required this.type,
  });
}
