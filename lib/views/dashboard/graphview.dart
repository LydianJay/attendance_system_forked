import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rfid_attendance_system/controller/attendance.dart';
import 'package:rfid_attendance_system/controller/course.dart';
import 'package:rfid_attendance_system/formatters/dayinputformatter.dart';
import 'package:rfid_attendance_system/model/attendancemodel.dart';
import 'package:rfid_attendance_system/model/coursemodel.dart';
import 'package:rfid_attendance_system/model/csvmodel.dart';
import 'package:rfid_attendance_system/model/nstpcoursemodel.dart';
import 'package:rfid_attendance_system/styles/styles.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:file_picker/file_picker.dart';

class GraphView extends StatefulWidget {
  const GraphView({super.key});

  @override
  State<GraphView> createState() => _GraphViewState();
}

class _GraphViewState extends State<GraphView> {
  List<DropdownMenuItem<String>> items = [];
  List<DropdownMenuItem<String>> yearItems = [];
  final TextEditingController _ctrlMin = TextEditingController(text: '1');
  final TextEditingController _ctrlMax = TextEditingController(text: '31');
  String currentMonthValue = "January";
  int currentYear = DateTime.now().year;
  List<AttendanceModel> attendance = [];
  List<NTSPCourseModel> nstpCourseList = [];
  List<DropdownMenuItem<String>> nstpCourseName = [];
  String selectedNSTPCourse = '';
  int selectedNSTPid = 1;
  final months = [
    'January',
    'February',
    'March',
    'Arpil',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  void _generateDropDownItems() {
    for (final m in months) {
      items.add(
        DropdownMenuItem(
          value: m,
          child: Text(
            m,
            style: Styles.tfts,
          ),
        ),
      );
    }

    for (int i = currentYear - 10; i <= currentYear + 10; i++) {
      yearItems.add(
        DropdownMenuItem(
          value: i.toString(),
          child: Text(
            i.toString(),
            style: Styles.tfts,
          ),
        ),
      );
    }
  }

  void _toCSV() async {
    String data = "${CSVModel.getHeaderTitleAsString()}\n";
    final min = int.parse(_ctrlMin.text);
    final max = int.parse(_ctrlMax.text);
    final csvData = await AttendanceCtrl.fetchAssocAttendance(
      months.indexOf(currentMonthValue) + 1,
      min,
      max,
      currentYear,
      selectedNSTPid,
    );
    debugPrint("Data Recv: ${csvData.toString()}");
    for (final v in csvData) {
      data += "${v.toStringCSV()}\n";
    }
    data = data.replaceRange(data.length - 1, null, "");
    String? path = await FilePicker.platform.saveFile(
      allowedExtensions: ['csv', 'txt'],
      fileName:
          "[$currentYear] [$currentMonthValue $min - $max]_Attendance.csv",
    );
    if (path != null) {
      final file = File(path);
      await file.writeAsString(data);
    }
  }

  void getNTSPCourse() async {
    nstpCourseList = await CourseCtrl.getNSTPCourse();

    for (final i in nstpCourseList) {
      nstpCourseName.add(
        DropdownMenuItem(
          value: i.abbr,
          child: Text(
            i.abbr,
            style: Styles.tfts,
          ),
        ),
      );
    }
  }

  Future<Widget> _buildChart() async {
    int month = months.indexOf(currentMonthValue);
    attendance = await AttendanceCtrl.fetchAttendance(
      month + 1,
      int.parse(_ctrlMin.text),
      int.parse(_ctrlMax.text),
      currentYear,
    );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SfCartesianChart(
        title: ChartTitle(text: 'Attendance Plot Chart', textStyle: Styles.h5),
        primaryXAxis: NumericAxis(
          title: AxisTitle(
            text: "Day",
            textStyle: Styles.tfts.copyWith(
              fontFamily: "Calibre",
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          labelStyle: Styles.tfts.copyWith(
            fontFamily: "Arial",
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          minimum: 1,
          maximum: 30,
          interval: 1,
        ),
        annotations: [
          CartesianChartAnnotation(
            widget: Text(
              'Time Out',
              style: Styles.p3.copyWith(color: Colors.red),
            ),
            x: 350,
            y: 50,
          ),
          CartesianChartAnnotation(
            widget: Text(
              'Time In',
              style: Styles.p3.copyWith(color: Colors.green),
            ),
            x: 350,
            y: 220,
          ),
        ],
        primaryYAxis: NumericAxis(
          title: AxisTitle(
            text: "Hour",
            textStyle: Styles.tfts.copyWith(
              fontFamily: "Calibre",
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          labelStyle: Styles.tfts.copyWith(
            fontFamily: "Arial",
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          minimum: 0,
          maximum: 24,
          interval: 2,
        ),
        series: [
          ScatterSeries<AttendanceModel, int>(
            dataSource: attendance,
            xValueMapper: (entry, time) {
              return entry.day;
            },
            yValueMapper: (entry, time) {
              return entry.hour + (entry.min / 60);
            },
            pointColorMapper: (datum, index) {
              return datum.type == 1 ? Colors.green : Colors.red;
            },
            dataLabelMapper: (datum, index) {
              return datum.type == 1 ? 'Time In' : 'Time Out';
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _generateDropDownItems();

    getNTSPCourse();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 4,
          child: Container(
            decoration: BoxDecoration(
              color: Styles.c1,
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 15, left: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Statistic Analysis',
                    style: Styles.h3,
                  ),
                ],
              ),
            ),
          ),
        ),
        Flexible(
          flex: 30,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              color: Styles.c2,
              borderRadius: BorderRadius.circular(3),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 0.4,
                  blurStyle: BlurStyle.outer,
                ),
              ],
            ),
            child: Column(
              children: [
                Flexible(
                  flex: 5,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10),
                    padding: const EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: Styles.c1.withAlpha(200),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          flex: 5,
                          child: Container(
                            child: DropdownButton(
                              value: currentMonthValue,
                              isDense: true,
                              isExpanded: true,
                              padding: const EdgeInsets.only(top: 20),
                              focusColor: Styles.c3,
                              dropdownColor: Styles.c3,
                              items: items,
                              underline: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Styles.c4.withAlpha(120),
                                    ),
                                  ),
                                ),
                              ),
                              onChanged: (data) {
                                setState(() {
                                  currentMonthValue = data.toString();
                                });
                              },
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 5,
                          child: Container(
                            child: DropdownButton(
                              value: currentYear.toString(),
                              isDense: true,
                              isExpanded: true,
                              padding: const EdgeInsets.only(top: 20),
                              focusColor: Styles.c3,
                              dropdownColor: Styles.c3,
                              items: yearItems,
                              underline: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Styles.c4.withAlpha(120),
                                    ),
                                  ),
                                ),
                              ),
                              onChanged: (data) {
                                setState(() {
                                  currentYear = int.parse(data.toString());
                                });
                              },
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 5,
                          child: Container(
                            child: DropdownButton(
                              value: selectedNSTPCourse,
                              isDense: true,
                              isExpanded: true,
                              padding: const EdgeInsets.only(top: 20),
                              focusColor: Styles.c3,
                              dropdownColor: Styles.c3,
                              items: nstpCourseName,
                              underline: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Styles.c4.withAlpha(120),
                                    ),
                                  ),
                                ),
                              ),
                              onChanged: (data) {
                                setState(() {
                                  selectedNSTPCourse = data.toString();
                                  // selectedNSTPid = int.parse(data.toString());
                                });
                              },
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 4,
                          child: Container(
                            child: TextField(
                              controller: _ctrlMin,
                              decoration: Styles.id.copyWith(
                                label: const Text('Start Day'),
                              ),
                              style: Styles.tfts,
                              inputFormatters: [DayInputFormatter()],
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          child: Container(
                            child: TextField(
                              controller: _ctrlMax,
                              decoration: Styles.id.copyWith(
                                label: const Text('End Day'),
                              ),
                              style: Styles.tfts,
                              inputFormatters: [DayInputFormatter()],
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 10,
                          child: Container(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                final min = int.parse(_ctrlMin.text);
                                final max = int.parse(_ctrlMax.text);
                                final isValid = min <= max;

                                if (isValid) {
                                  setState(() {});
                                  return;
                                }

                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return SimpleDialog(
                                      backgroundColor: Styles.c1,
                                      title: Text(
                                        'Invalid date',
                                        style: TextStyle(color: Styles.c4),
                                      ),
                                      children: [
                                        Center(
                                            child: Text(
                                          'Start day is greater than End Day!',
                                          style: Styles.p5,
                                        )),
                                      ],
                                    );
                                  },
                                );
                              },
                              label: const Text('Set'),
                              style: Styles.bstyle1,
                              icon: const Icon(Icons.settings),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 10,
                          child: Container(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                final min = int.parse(_ctrlMin.text);
                                final max = int.parse(_ctrlMax.text);
                                final isValid = min <= max;

                                if (isValid) {
                                  _toCSV();
                                  return;
                                }
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return SimpleDialog(
                                      backgroundColor: Styles.c1,
                                      title: Text(
                                        'Invalid date',
                                        style: TextStyle(color: Styles.c4),
                                      ),
                                      children: [
                                        Center(
                                            child: Text(
                                          'Start day is greater than End Day!',
                                          style: Styles.p5,
                                        )),
                                      ],
                                    );
                                  },
                                );
                              },
                              label: const Text('CSV'),
                              style: Styles.bstyle1,
                              icon: const Icon(Icons.download),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 30,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: FutureBuilder(
                      future: _buildChart(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return snapshot.requireData;
                        }
                        return Container();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
