import 'package:flutter/material.dart';
import 'package:rfid_attendance_system/controller/course.dart';
import 'package:rfid_attendance_system/controller/student.dart';
import 'package:rfid_attendance_system/fonts/custom_icons.dart';
import 'package:rfid_attendance_system/model/coursemodel.dart';
import 'package:rfid_attendance_system/model/nstpcoursemodel.dart';
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
  final TextEditingController _ctrlcourse = TextEditingController(text: 'BSIT');
  final TextEditingController _ctrlnstp = TextEditingController(text: 'ROTC');
  final TextEditingController _ctrlSearch = TextEditingController(text: '');

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
  int courseIDselected = 0;
  int nstpID = 0;

  @override
  void dispose() {
    super.dispose();
    // _ctrlfname.dispose();
    // _ctrlSearch.dispose();
    // _ctrlcourse.dispose();
    // _ctrlbdate.dispose();
    // _ctrlrfid.dispose();
    // _ctrlfname.dispose();
    // _ctrllname.dispose();
    // _ctrlmname.dispose();
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
                    'Student Registration',
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
            margin: const EdgeInsets.only(left: 25, right: 25),
            child: Column(
              children: [
                Flexible(
                  flex: 25,
                  child: Row(
                    children: [
                      Flexible(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible(
                                child: TextField(
                                  controller: _ctrlfname,
                                  decoration: Styles.id.copyWith(
                                    label: const Text('First Name'),
                                  ),
                                  style: Styles.tfts,
                                ),
                              ),
                              Flexible(
                                child: TextField(
                                  controller: _ctrlmname,
                                  decoration: Styles.id.copyWith(
                                    label: const Text('Middle Name'),
                                  ),
                                  style: Styles.tfts,
                                ),
                              ),
                              Flexible(
                                child: TextField(
                                  controller: _ctrllname,
                                  decoration: Styles.id.copyWith(
                                    label: const Text('Last Name'),
                                  ),
                                  style: Styles.tfts,
                                ),
                              ),
                              Flexible(
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: Container(
                                        padding:
                                            const EdgeInsets.only(right: 10),
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
                                        padding:
                                            const EdgeInsets.only(left: 10),
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
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Container(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: TextField(
                                          controller: _ctrlcourse,
                                          decoration: Styles.id.copyWith(
                                            label: const Text('Course'),
                                          ),
                                          style: Styles.tfts,
                                          readOnly: true,
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              useSafeArea: true,
                                              builder: (context) {
                                                List<CourseModel> courseList =
                                                    [];
                                                List<Widget> widgetList = [];
                                                return StatefulBuilder(
                                                  builder: (context, setState) {
                                                    return SimpleDialog(
                                                      backgroundColor:
                                                          Styles.c1,
                                                      title: TextField(
                                                        controller: _ctrlSearch,
                                                        decoration:
                                                            Styles.id.copyWith(
                                                          label: const Text(
                                                              'Search Course'),
                                                        ),
                                                        style: Styles.tfts,
                                                        onChanged:
                                                            (value) async {
                                                          if (value.isEmpty) {
                                                            return;
                                                          }

                                                          courseList =
                                                              await CourseCtrl
                                                                  .getCourseListByName(
                                                                      value);
                                                          debugPrint('Changed');
                                                          widgetList = [];
                                                          setState(() {
                                                            debugPrint(
                                                                'Refreshed: ${widgetList.length}');
                                                            for (final course
                                                                in courseList) {
                                                              widgetList.add(
                                                                ListTile(
                                                                  leading: Text(
                                                                    course.abbr,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: Styles
                                                                        .p5
                                                                        .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      color: Styles
                                                                          .c4
                                                                          .withAlpha(
                                                                              165),
                                                                    ),
                                                                  ),
                                                                  onTap: () {
                                                                    setState(
                                                                      () {
                                                                        _ctrlcourse.text =
                                                                            course.abbr;
                                                                        courseIDselected =
                                                                            course.id;
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                    );
                                                                  },
                                                                ),
                                                              );
                                                            }
                                                          });
                                                        },
                                                      ),
                                                      children: widgetList,
                                                    );
                                                  },
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Container(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: TextField(
                                          controller: _ctrlnstp,
                                          decoration: Styles.id.copyWith(
                                            label: const Text('NSTP'),
                                          ),
                                          style: Styles.tfts,
                                          readOnly: true,
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              useSafeArea: true,
                                              builder: (context) {
                                                List<NTSPCourseModel>
                                                    courseList = [];
                                                List<Widget> widgetList = [];
                                                return StatefulBuilder(
                                                  builder: (context, setState) {
                                                    return SimpleDialog(
                                                      backgroundColor:
                                                          Styles.c1,
                                                      title: TextField(
                                                        controller: _ctrlSearch,
                                                        decoration:
                                                            Styles.id.copyWith(
                                                          label: const Text(
                                                              'Search NSTP'),
                                                        ),
                                                        style: Styles.tfts,
                                                        onChanged:
                                                            (value) async {
                                                          if (value.isEmpty) {
                                                            return;
                                                          }

                                                          courseList =
                                                              await CourseCtrl
                                                                  .getNSTPListByName(
                                                                      value);
                                                          debugPrint('Changed');
                                                          widgetList = [];
                                                          setState(() {
                                                            debugPrint(
                                                                'Refreshed: ${widgetList.length}');
                                                            for (final course
                                                                in courseList) {
                                                              widgetList.add(
                                                                ListTile(
                                                                  leading: Text(
                                                                    course.abbr,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: Styles
                                                                        .p5
                                                                        .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      color: Styles
                                                                          .c4
                                                                          .withAlpha(
                                                                              165),
                                                                    ),
                                                                  ),
                                                                  onTap: () {
                                                                    setState(
                                                                      () {
                                                                        _ctrlnstp.text =
                                                                            course.abbr;
                                                                        nstpID =
                                                                            course.id;
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                    );
                                                                  },
                                                                ),
                                                              );
                                                            }
                                                          });
                                                        },
                                                      ),
                                                      children: widgetList,
                                                    );
                                                  },
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
                              Flexible(
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
                            ],
                          ),
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
          flex: 5,
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
                    courseid: courseIDselected,
                    nstpid: nstpID,
                  );
                  StudentCtrl.insertUser(model);
                  showDialog(
                    context: context,
                    builder: (context) {
                      return SimpleDialog(
                        backgroundColor: Styles.c1,
                        title: Text(
                          'Registration Status',
                          style: TextStyle(color: Styles.c4),
                        ),
                        children: [
                          Center(
                              child: Text(
                            'Student added to database!',
                            style: Styles.p5,
                          )),
                        ],
                      );
                    },
                  );
                  setState(() {
                    _ctrlbdate.text = "1/1/1969";
                    _ctrlmname.text = "Monexus";
                    _ctrlfname.text = "Juan";
                    _ctrllname.text = "Dela Cruz";
                    _ctrlrfid.text = "000000FF";
                    date.clear();
                    selected = "Male";
                  });
                },
                style: Styles.bstyle1,
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
