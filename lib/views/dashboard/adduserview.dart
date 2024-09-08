import 'dart:ffi';

import 'package:drop_down_list/drop_down_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rfid_attendance_system/controller/student.dart';
import 'package:rfid_attendance_system/fonts/custom_icons.dart';
import 'package:rfid_attendance_system/model/studentmodel.dart';
import 'package:rfid_attendance_system/styles/styles.dart';
import 'package:rfid_attendance_system/fonts/icon_set_icons.dart';
import 'package:rfid_attendance_system/formatters/hexinputformatter.dart';

class AddUserView extends StatefulWidget {
  const AddUserView({super.key});

  @override
  State<AddUserView> createState() => _AddUserViewState();
}

class _AddUserViewState extends State<AddUserView> {
  final TextEditingController _ctrlfname = TextEditingController(text: 'Juan');
  final TextEditingController _ctrllname =
      TextEditingController(text: 'Dela Cruz');
  final TextEditingController _ctrlmname =
      TextEditingController(text: 'Monexus');
  final TextEditingController _ctrlbdate =
      TextEditingController(text: '1/1/1969');
  final TextEditingController _ctrlrfid =
      TextEditingController(text: '000000FF');

  List<DropdownMenuItem<String>> items = [
    DropdownMenuItem(
      value: 'Male',
      child: Text(
        'Male',
        style: Styles.tfts,
      ),
    ),
    DropdownMenuItem(
      value: 'Female',
      child: Text(
        'Female',
        style: Styles.tfts,
      ),
    ),
  ];
  String selected = "Male";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 4,
          child: Container(
            decoration: BoxDecoration(
              color: Styles.c1,
              // border: Border(
              //   bottom: BorderSide(
              //     color: Styles.c4.withAlpha(80),
              //     width: 1,
              //   ),
              // ),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 15, left: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Student Registration',
                    style: Styles.h3,
                  ),
                ],
              ),
            ),
          ),
        ),
        Flexible(
          flex: 20,
          child: Container(
            margin: const EdgeInsets.only(left: 25, right: 25),
            child: Column(
              children: [
                Flexible(
                  flex: 25,
                  child: Row(
                    children: [
                      Flexible(
                        child: Column(
                          children: [
                            Flexible(
                              child: Container(
                                margin:
                                    const EdgeInsets.only(bottom: 20, top: 20),
                                child: TextField(
                                  controller: _ctrlfname,
                                  decoration: Styles.id.copyWith(
                                    label: const Text('First Name'),
                                  ),
                                  style: Styles.tfts,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 20),
                                child: TextField(
                                  controller: _ctrlmname,
                                  decoration: Styles.id.copyWith(
                                    label: const Text('Middle Name'),
                                  ),
                                  style: Styles.tfts,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 20),
                                child: TextField(
                                  controller: _ctrllname,
                                  decoration: Styles.id.copyWith(
                                    label: const Text('Last Name'),
                                  ),
                                  style: Styles.tfts,
                                ),
                              ),
                            ),
                            Flexible(
                              child: Row(
                                children: [
                                  Flexible(
                                    child: Container(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: TextField(
                                        controller: _ctrlbdate,
                                        decoration: Styles.id.copyWith(
                                          label: const Text('Date Time'),
                                        ),
                                        style: Styles.tfts,
                                        readOnly: true,
                                        onTap: () async {
                                          final res = await showDatePicker(
                                            context: context,
                                            firstDate: DateTime(
                                                DateTime.now().year - 120),
                                            lastDate: DateTime.now(),
                                          );
                                          if (res != null) {
                                            _ctrlbdate.text =
                                                "${res.month}/${res.day}/${res.year}";
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Container(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: DropdownButton(
                                          value: selected,
                                          isDense: true,
                                          isExpanded: true,
                                          padding:
                                              const EdgeInsets.only(top: 20),
                                          focusColor: Styles.c3,
                                          dropdownColor: Styles.c3,
                                          items: items,
                                          underline: Container(
                                            decoration: BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  color:
                                                      Styles.c4.withAlpha(120),
                                                ),
                                              ),
                                            ),
                                          ),
                                          onChanged: (data) {
                                            setState(() {
                                              selected = data.toString();
                                            });
                                          }),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: Container(
                                margin: const EdgeInsets.only(top: 20),
                                child: TextField(
                                  controller: _ctrlrfid,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                    signed: false,
                                    decimal: true,
                                  ),
                                  inputFormatters: [
                                    HexInputFormatter(),
                                  ],
                                  maxLength: 8,
                                  decoration: Styles.id.copyWith(
                                    label: const Text('RFID Serial Number'),
                                  ),
                                  style: Styles.tfts,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Column(
                          children: [
                            Expanded(
                              child: Center(
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 110),
                                  child: Icon(
                                    IconSet.id_card,
                                    size: 250,
                                    color: Styles.c3.withAlpha(125),
                                  ),
                                ),
                              ),
                            ),
                          ],
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
          flex: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  final date = _ctrlbdate.text.split("/");

                  final model = StudentModel(
                    rfid: int.parse(
                      _ctrlrfid.text,
                      radix: 16,
                    ),
                    fname: _ctrlfname.text,
                    mname: _ctrlmname.text,
                    lname: _ctrllname.text,
                    bday: int.parse(date[1]),
                    bmonth: int.parse(date.first),
                    byear: int.parse(date.last),
                    gender: selected == "Male" ? 1 : 0,
                    courseid: 1,
                  );
                  StudentCtrl.insertUser(model);
                },
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStatePropertyAll(Styles.c3.withAlpha(125)),
                  iconColor: WidgetStatePropertyAll(Styles.c4.withAlpha(125)),
                  foregroundColor:
                      WidgetStatePropertyAll(Styles.c4.withAlpha(125)),
                ),
                label: const Text('Register'),
                icon: const Icon(CustomIcons.user_plus),
              )
            ],
          ),
        ),
      ],
    );
  }
}
