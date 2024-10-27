import 'package:flutter/material.dart';
import 'package:rfid_attendance_system/styles/styles.dart';
import 'package:rfid_attendance_system/fonts/custom_icons.dart';
import 'package:rfid_attendance_system/views/dashboard/adduserview.dart';
import 'package:rfid_attendance_system/views/dashboard/databaseview.dart';
import 'package:rfid_attendance_system/views/dashboard/graphview.dart';
import 'package:rfid_attendance_system/views/dashboard/modifyadmin.dart';
import 'package:rfid_attendance_system/views/dashboard/modifyuserview.dart';

class DashBoardView extends StatefulWidget {
  const DashBoardView({super.key});

  @override
  State<DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {
  int _currentPanel = 0;

  Widget _buildRigthWidget() {
    switch (_currentPanel) {
      case 0:
        return const DataBaseView();
      case 1:
        return const GraphView();
      case 3:
        return const AddUserView();
      case 4:
        return const ModifyUserView();
      case 5:
        return const ModifyAdminView();
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(color: Styles.c1),
        child: SafeArea(
          child: Row(
            children: [
              Flexible(
                  flex: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Styles.c2,
                      border: Border(
                          right: BorderSide(
                        color: Styles.c4.withAlpha(125),
                      )),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(6),
                        bottomRight: Radius.circular(6),
                      ),
                    ),
                    child: ListView(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 25),
                          child: Icon(
                            Icons.person,
                            size: 75,
                            color: Styles.c4,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          padding: const EdgeInsets.only(bottom: 15),
                          decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1.25,
                                    color: Styles.c4.withAlpha(125))),
                          ),
                          child: Text(
                            'Administrator',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'helvetica',
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                              color: Styles.c4,
                            ),
                          ),
                        ),
                        Text(
                          'Data',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Calibre',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Styles.c4,
                          ),
                        ),
                        ListTile(
                          title: const Text('Database'),
                          leading: const Icon(CustomIcons.database),
                          selected: _currentPanel == 0,
                          selectedColor: Styles.c4,
                          iconColor: Styles.c3,
                          textColor: Styles.c3,
                          onTap: () {
                            setState(() {
                              _currentPanel = 0;
                            });
                          },
                        ),
                        ListTile(
                          title: const Text('Graph'),
                          leading: const Icon(CustomIcons.graph),
                          selected: _currentPanel == 1,
                          selectedColor: Styles.c4,
                          iconColor: Styles.c3,
                          textColor: Styles.c3,
                          onTap: () {
                            setState(() {
                              _currentPanel = 1;
                            });
                          },
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 25),
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(color: Styles.c4.withAlpha(125)),
                            ),
                          ),
                          child: Text(
                            'Students',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Calibre',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Styles.c4,
                            ),
                          ),
                        ),
                        ListTile(
                          title: const Text('Add User'),
                          leading: const Icon(CustomIcons.user_plus),
                          selected: _currentPanel == 3,
                          selectedColor: Styles.c4,
                          iconColor: Styles.c3,
                          textColor: Styles.c3,
                          onTap: () {
                            setState(() {
                              _currentPanel = 3;
                            });
                          },
                        ),
                        ListTile(
                          title: const Text('Modify User'),
                          leading: const Icon(CustomIcons.user_edit),
                          selected: _currentPanel == 4,
                          selectedColor: Styles.c4,
                          iconColor: Styles.c3,
                          textColor: Styles.c3,
                          onTap: () {
                            setState(() {
                              _currentPanel = 4;
                            });
                          },
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 25),
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(color: Styles.c4.withAlpha(125)),
                            ),
                          ),
                          child: Text(
                            'Admin',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Calibre',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Styles.c4,
                            ),
                          ),
                        ),
                        ListTile(
                          title: const Text('Modify'),
                          leading: const Icon(CustomIcons.user_edit),
                          selected: _currentPanel == 5,
                          selectedColor: Styles.c4,
                          iconColor: Styles.c3,
                          textColor: Styles.c3,
                          onTap: () {
                            setState(() {
                              _currentPanel = 5;
                            });
                          },
                        ),
                      ],
                    ),
                  )),
              Flexible(
                flex: 15,
                child: Container(
                  decoration: BoxDecoration(color: Styles.c1),
                  child: _buildRigthWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
