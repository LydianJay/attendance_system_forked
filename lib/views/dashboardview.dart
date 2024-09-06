import 'package:flutter/material.dart';
import 'package:rfid_attendance_system/styles/styles.dart';
import 'package:rfid_attendance_system/fonts/custom_icons.dart';
import 'package:rfid_attendance_system/views/dashboard/adduserview.dart';
import 'package:rfid_attendance_system/views/dashboard/databaseview.dart';

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
      case 3:
        return const AddUserView();
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    double scrWidth = MediaQuery.of(context).size.width;
    double scrHeight = MediaQuery.of(context).size.height;
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
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomRight: Radius.circular(12),
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
                            'NEMSU',
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
                          selected: true,
                          selectedColor: Styles.c4,
                          onTap: () {
                            setState(() {
                              _currentPanel = 0;
                            });
                          },
                        ),
                        ListTile(
                          title: const Text('Graph'),
                          leading: const Icon(CustomIcons.graph),
                          selectedColor: Styles.c4,
                          iconColor: Styles.c3,
                          textColor: Styles.c3,
                          onTap: () {
                            setState(() {
                              _currentPanel = 1;
                            });
                          },
                        ),
                        ListTile(
                          title: const Text('Search'),
                          leading: const Icon(CustomIcons.search),
                          selectedColor: Styles.c4,
                          iconColor: Styles.c3,
                          textColor: Styles.c3,
                          onTap: () {
                            setState(() {
                              _currentPanel = 2;
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
                          title: const Text('Remove User'),
                          leading: const Icon(CustomIcons.user_minus),
                          selectedColor: Styles.c4,
                          iconColor: Styles.c3,
                          textColor: Styles.c3,
                          onTap: () {
                            setState(() {
                              _currentPanel = 4;
                            });
                          },
                        ),
                        ListTile(
                          title: const Text('Edit User'),
                          leading: const Icon(CustomIcons.user_edit),
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
