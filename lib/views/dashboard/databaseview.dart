import 'package:flutter/material.dart';
import 'package:rfid_attendance_system/styles/styles.dart';
import 'package:rfid_attendance_system/controller/student.dart';

class DataBaseView extends StatefulWidget {
  const DataBaseView({super.key});

  @override
  State<DataBaseView> createState() => _DataBaseViewState();
}

class _DataBaseViewState extends State<DataBaseView> {
  Future<Widget> _buildTable() async {
    final jsonData = await StudentCtrl.fetchAll();
    if (jsonData == null) {
      return Container(
        margin: const EdgeInsets.only(top: 10),
        child: const Text('data not available'),
      );
    }

    List<TableRow> tableRows = [];
    tableRows.add(
      TableRow(
        children: [
          Text(
            'RFID',
            textAlign: TextAlign.center,
            style: Styles.p4,
          ),
          Text(
            'First Name',
            textAlign: TextAlign.center,
            style: Styles.p4,
          ),
          Text(
            'Middle Name',
            textAlign: TextAlign.center,
            style: Styles.p4,
          ),
          Text(
            'Last Name',
            textAlign: TextAlign.center,
            style: Styles.p4,
          ),
          Text(
            'Gender',
            textAlign: TextAlign.center,
            style: Styles.p4,
          ),
        ],
      ),
    );

    for (final row in jsonData) {
      tableRows.add(TableRow(children: [
        Text(
          row['rfid'],
          textAlign: TextAlign.center,
          style: Styles.p5.copyWith(fontFamily: 'Calibre'),
        ),
        Text(
          row['fname'],
          textAlign: TextAlign.center,
          style: Styles.p5.copyWith(fontFamily: 'Calibre'),
        ),
        Text(
          row['mname'],
          textAlign: TextAlign.center,
          style: Styles.p5.copyWith(fontFamily: 'Calibre'),
        ),
        Text(
          row['lname'],
          textAlign: TextAlign.center,
          style: Styles.p5.copyWith(fontFamily: 'Calibre'),
        ),
        Text(
          row['gender'].toString() == '1' ? "Male" : "Female",
          textAlign: TextAlign.center,
          style: Styles.p5.copyWith(fontFamily: 'Calibre'),
        ),
      ]));
    }

    return Table(
      columnWidths: const <int, TableColumnWidth>{
        0: FlexColumnWidth(),
        1: FlexColumnWidth(),
        2: FlexColumnWidth(),
        3: FlexColumnWidth(),
        4: FlexColumnWidth(),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      border: TableBorder.all(color: Styles.c4),
      children: tableRows,
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
          flex: 7,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              margin: const EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    flex: 10,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Styles.c2,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                Flexible(
                                  flex: 6,
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 15),
                                    child: Text(
                                      'Enrolees',
                                      style:
                                          Styles.h2.copyWith(color: Styles.c3),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 5,
                                  child: Container(
                                      child: Text(
                                    '765',
                                    style: Styles.h1,
                                  )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(),
                  ),
                  Flexible(
                    flex: 10,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Styles.c2,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                Flexible(
                                  flex: 6,
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      'Gender',
                                      style:
                                          Styles.h2.copyWith(color: Styles.c3),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 6,
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 15),
                                    child: Text(
                                      'Male: 430',
                                      style: Styles.h4,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 6,
                                  child: Container(
                                      child: Text(
                                    'Female: 335',
                                    style: Styles.h4,
                                  )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Flexible(
          flex: 15,
          child: Container(
            margin: const EdgeInsets.all(25),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Styles.c2,
              borderRadius: BorderRadius.circular(3),
            ),
            child: ListView(
              children: [
                FutureBuilder(
                    future: _buildTable(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return snapshot.data!;
                      }
                      return const Center(child: CircularProgressIndicator());
                    })
              ],
            ),
          ),
        ),
      ],
    );
  }
}
