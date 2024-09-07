import 'package:flutter/material.dart';
import 'package:rfid_attendance_system/styles/styles.dart';

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
  final TextEditingController _ctrlgender = TextEditingController(text: 'Male');
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 3,
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
              margin: const EdgeInsets.only(top: 20, left: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Student Registration',
                    style: Styles.h4,
                  ),
                ],
              ),
            ),
          ),
        ),
        Flexible(
          flex: 25,
          child: Container(
            margin: const EdgeInsets.all(25),

            // decoration: BoxDecoration(
            //   color: Styles.c2,
            // ),
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
                                margin: const EdgeInsets.only(bottom: 20),
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
                                      child: TextField(
                                        controller: _ctrlgender,
                                        decoration: Styles.id.copyWith(
                                          label: const Text('Gender'),
                                        ),
                                        style: Styles.tfts,
                                        readOnly: true,
                                        onTap: () {
                                          List<DropdownMenuItem<String>> items =
                                              const [
                                            DropdownMenuItem(
                                              child: Text('Male'),
                                              value: 'Male',
                                            ),
                                            DropdownMenuItem(
                                              child: Text('Female'),
                                              value: 'Female',
                                            ),
                                          ];
                                          String cvalue = 'Male';
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return SimpleDialog(
                                                title: Text(
                                                  'Gender',
                                                  style: Styles.h3,
                                                ),
                                                children: [
                                                  DropdownButton(
                                                    items: items,
                                                    value: cvalue,
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        cvalue = value!;
                                                        _ctrlgender.text =
                                                            cvalue;
                                                      });
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(child: Container()),
                    ],
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: Container(
                    margin: const EdgeInsets.only(right: 25),
                    decoration: BoxDecoration(border: Border.all()),
                  ),
                ),
                // Flexible(
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     children: [
                //       Flexible(
                //         child: Padding(
                //           padding: const EdgeInsets.only(right: 10),
                //           child: TextField(
                //             controller: _ctrlfname,
                //             decoration: Styles.id.copyWith(
                //               label: const Text('First Name'),
                //             ),
                //             style: Styles.tfts,
                //           ),
                //         ),
                //       ),
                //       Flexible(
                //         child: Padding(
                //           padding: const EdgeInsets.symmetric(horizontal: 10),
                //           child: TextField(
                //             controller: _ctrlmname,
                //             decoration: Styles.id.copyWith(
                //               label: const Text('Middle Name'),
                //             ),
                //             style: Styles.tfts,
                //           ),
                //         ),
                //       ),
                //       Flexible(
                //         child: Padding(
                //           padding: const EdgeInsets.symmetric(horizontal: 10),
                //           child: TextField(
                //             controller: _ctrllname,
                //             decoration: Styles.id.copyWith(
                //               label: const Text('Last Name'),
                //             ),
                //             style: Styles.tfts,
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
