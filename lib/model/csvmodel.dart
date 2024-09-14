class CSVModel {
  final int rfid;
  final String fname;
  final String mname;
  final String lname;
  final int gender;
  final String nstp;
  final String course;
  final int day;
  final int type;
  final String time;

  CSVModel({
    required this.rfid,
    required this.fname,
    required this.mname,
    required this.lname,
    required this.gender,
    required this.nstp,
    required this.course,
    required this.day,
    required this.type,
    required this.time,
  });

  String toStringCSV() {
    final a = rfid.toRadixString(16).toUpperCase();
    final b = fname, c = mname, d = lname;
    final e = gender == 1 ? "Male" : "Female";
    final f = nstp, g = course, h = day.toString();
    final j = type == 1 ? "Time In" : "Time Out";
    final i = time;

    return "$a,$b,$c,$d,$e,$f,$g,$h,$i,$j";
  }

  static String getHeaderTitleAsString() {
    return "RFID Serial Num,First Name,Middle Name,Last Name,Gender,NSTP,Course,Day,Time,Type";
  }

  static List<String> getHeaderTitle() {
    return [
      'RFID Serial Num',
      'First Name',
      'Middle Name',
      'Last Name',
      'Gender',
      'NSTP',
      'Course',
      'Day',
      'Time',
      'Type',
    ];
  }
}
