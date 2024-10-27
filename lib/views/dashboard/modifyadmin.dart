import 'package:flutter/material.dart';
import 'package:rfid_attendance_system/controller/admin.dart';
import 'package:rfid_attendance_system/fonts/custom_icons.dart';
import 'package:rfid_attendance_system/styles/styles.dart';


/*
  This is the class builder for the modify admin 
  
*/

class ModifyAdminView extends StatefulWidget {
  const ModifyAdminView({super.key});

  @override
  State<ModifyAdminView> createState() => _ModifyAdminViewState();
}

class _ModifyAdminViewState extends State<ModifyAdminView> {
  final _ctrlOldName = TextEditingController();
  final _ctrlNewName = TextEditingController();
  final _ctrlOldPass = TextEditingController();
  final _ctrlNewPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 5,
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
                    'Modify Admin',
                    style: Styles.h3,
                  ),
                ],
              ),
            ),
          ),
        ),
        Flexible(
          flex: 25,
          child: Container(
            margin: const EdgeInsets.only(top: 25),
            padding: const EdgeInsets.only(right: 350, left: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  child: TextField(
                    controller: _ctrlOldName,
                    decoration: Styles.id.copyWith(
                      label: const Text('Current Username'),
                    ),
                    style: Styles.tfts,
                  ),
                ),
                Flexible(
                  child: TextField(
                    controller: _ctrlOldPass,
                    obscureText: true,
                    decoration: Styles.id.copyWith(
                      label: const Text('Current Password'),
                    ),
                    style: Styles.tfts,
                  ),
                ),
                Flexible(
                  child: TextField(
                    controller: _ctrlNewName,
                    decoration: Styles.id.copyWith(
                      label: const Text('New Username'),
                    ),
                    style: Styles.tfts,
                  ),
                ),
                Flexible(
                  child: TextField(
                    controller: _ctrlNewPass,
                    obscureText: true,
                    decoration: Styles.id.copyWith(
                      label: const Text('New Password'),
                    ),
                    style: Styles.tfts,
                  ),
                ),
                Flexible(
                    child: ElevatedButton.icon(
                  onPressed: () {
                    AdminCtrl.modifyAdmin(
                      _ctrlOldName.text,
                      _ctrlOldPass.text,
                      _ctrlNewName.text,
                      _ctrlNewPass.text,
                    ).then((result) {
                      setState(() {
                        _ctrlNewName.clear();
                        _ctrlNewPass.clear();
                        _ctrlOldName.clear();
                        _ctrlOldPass.clear();
                      });

                      showDialog(
                        context: context,
                        builder: (context) {
                          return SimpleDialog(
                            backgroundColor: Styles.c1,
                            title: Text(
                              'Modify Status',
                              style: TextStyle(color: Styles.c4),
                            ),
                            children: [
                              Center(
                                child: Text(
                                  result
                                      ? 'Modified Admin'
                                      : 'Could not connect to Server',
                                  style: Styles.p5,
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(Styles.c3.withAlpha(125)),
                    iconColor: WidgetStatePropertyAll(Styles.c4.withAlpha(125)),
                    foregroundColor:
                        WidgetStatePropertyAll(Styles.c4.withAlpha(125)),
                  ),
                  label: const Text('Modify'),
                  icon: const Icon(CustomIcons.user_edit),
                )),
              ],
            ),
          ),
        ),
        Flexible(
          flex: 10,
          child: Container(),
        ),
      ],
    );
  }
}
