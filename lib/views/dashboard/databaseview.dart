import 'package:flutter/material.dart';
import 'package:rfid_attendance_system/styles/styles.dart';
import 'package:mysql_client/mysql_client.dart';

class DataBaseView extends StatefulWidget {
  const DataBaseView({super.key});

  @override
  State<DataBaseView> createState() => _DataBaseViewState();
}

class _DataBaseViewState extends State<DataBaseView> {
  MySQLConnection? _mySQL;

  void initSQL() async {
    _mySQL = await MySQLConnection.createConnection(
      host: "192.168.135.161", // local
      port: 3306,
      userName: "root",
      password: "",
      databaseName: "rfid_attendance_system", // optional
    );
    await _mySQL!.connect();
  }

  void fetchData() async {
    if (_mySQL == null) {
      debugPrint("Not connected!");
    } else {
      final res = await _mySQL!.execute("SELECT * FROM students");
      debugPrint("length: ${res.rows.length}");
      for (final row in res.rows) {
        debugPrint(row.typedColByName('rfid').toString());
      }
    }
  }

  Widget _buildTable() {
    List<TableRow> tableRows = [];

    return Container();
  }

  @override
  void initState() {
    super.initState();
    initSQL();
    fetchData();
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
            decoration: BoxDecoration(
              color: Styles.c2,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
