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

  List<String> toListString() {
    return [
      rfid.toRadixString(16),
      day.toString(),
      month.toString(),
      year.toString(),
      hour.toString(),
      min.toString(),
      type == 1 ? 'Time In' : 'Time Out',
    ];
  }

  static String getHeaderTitleAsString() {
    return "RFID,Day,Month,Year,Hour,Minutes,Type";
  }

  String toCSV() {
    return "${rfid.toRadixString(16).toUpperCase()},${day.toString()},${month.toString()},${year.toString()},${hour.toString()},${min.toString()},${type == 1 ? 'Time In' : 'Time Out'}";
  }

  static List<String> getHeaderTitle() {
    return [
      'RFID',
      'Day',
      'Month',
      'Year',
      'Hour',
      'Minutes',
      'Type',
    ];
  }
}
