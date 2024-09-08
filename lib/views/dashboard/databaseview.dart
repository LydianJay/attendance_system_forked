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
    final headerStyle = Styles.p3.copyWith(color: Styles.c4.withAlpha(190));
    final tStyle = Styles.p4.copyWith(fontFamily: 'Calibre');

    List<Widget> tableRows = [];
    bool darken = false;
    for (final row in jsonData) {
      tableRows.add(
        Container(
          decoration: BoxDecoration(
            color: darken ? Styles.c4.withAlpha(15) : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                flex: 5,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Styles.c4.withAlpha(100),
                              width: 1.2,
                            ),
                            bottom: BorderSide(
                              color: Styles.c4.withAlpha(100),
                              width: 1.2,
                            ),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Styles.c3,
                              blurRadius: 0.4,
                              blurStyle: BlurStyle.outer,
                            ),
                          ],
                        ),
                        child: Text(
                          int.parse(row['rfid'].toString())
                              .toRadixString(16)
                              .toUpperCase(),
                          textAlign: TextAlign.center,
                          style: tStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 5,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Styles.c4.withAlpha(100),
                              width: 1.2,
                            ),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Styles.c3,
                              blurRadius: 0.4,
                              blurStyle: BlurStyle.outer,
                            ),
                          ],
                        ),
                        child: Text(
                          row['fname'],
                          textAlign: TextAlign.center,
                          style: tStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 5,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Styles.c4.withAlpha(100),
                              width: 1.2,
                            ),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Styles.c3,
                              blurRadius: 0.4,
                              blurStyle: BlurStyle.outer,
                            ),
                          ],
                        ),
                        child: Text(
                          row['mname'],
                          textAlign: TextAlign.center,
                          style: tStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 5,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Styles.c4.withAlpha(100),
                              width: 1.2,
                            ),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Styles.c3,
                              blurRadius: 0.4,
                              blurStyle: BlurStyle.outer,
                            ),
                          ],
                        ),
                        child: Text(
                          row['lname'],
                          textAlign: TextAlign.center,
                          style: tStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 5,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: Styles.c4.withAlpha(100),
                              width: 1.2,
                            ),
                            bottom: BorderSide(
                              color: Styles.c4.withAlpha(100),
                              width: 1.2,
                            ),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Styles.c3,
                              blurRadius: 0.4,
                              blurStyle: BlurStyle.outer,
                            ),
                          ],
                        ),
                        child: Text(
                          row['gender'].toString() == '1' ? "Male" : "Female",
                          textAlign: TextAlign.center,
                          style: tStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
      darken = !darken;
    }
    return Column(
      children: [
        Flexible(
          flex: 5,
          child: Container(
            margin: const EdgeInsets.only(top: 3),
            decoration: BoxDecoration(
              color: Styles.c4.withAlpha(50),
              border: Border.all(
                color: Styles.c4.withAlpha(100),
                width: 0.4,
              ),
              boxShadow: [
                BoxShadow(
                  color: Styles.c3,
                  blurRadius: 1,
                  blurStyle: BlurStyle.outer,
                ),
              ],
              // borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  flex: 5,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'RFID',
                          textAlign: TextAlign.center,
                          style: headerStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Last Name',
                          textAlign: TextAlign.center,
                          style: headerStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'First Name',
                          textAlign: TextAlign.center,
                          style: headerStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Midle Name',
                          textAlign: TextAlign.center,
                          style: headerStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Gender',
                          textAlign: TextAlign.center,
                          style: headerStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          flex: 40,
          child: ListView(
            children: [
              Column(
                children: tableRows,
              ),
            ],
          ),
        ),
      ],
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
            child: FutureBuilder(
              future: _buildTable(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return snapshot.data!;
                }
                return Container(
                  margin: const EdgeInsets.only(top: 100),
                  child: Text(
                    'Data not available',
                    textAlign: TextAlign.center,
                    style: Styles.h4,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
