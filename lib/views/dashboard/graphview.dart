import 'package:flutter/material.dart';
import 'package:rfid_attendance_system/controller/attendance.dart';
import 'package:rfid_attendance_system/model/attendancemodel.dart';
import 'package:rfid_attendance_system/styles/styles.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphView extends StatefulWidget {
  const GraphView({super.key});

  @override
  State<GraphView> createState() => _GraphViewState();
}

class _GraphViewState extends State<GraphView> {
  Future<Widget> _buildChart() async {
    final attendance = await AttendanceCtrl.fetchAll();

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
            margin: const EdgeInsets.symmetric(horizontal: 15),
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
        Flexible(flex: 5, child: Container())
      ],
    );
  }
}
