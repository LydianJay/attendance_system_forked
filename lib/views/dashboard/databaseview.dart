import 'package:flutter/material.dart';
import 'package:rfid_attendance_system/styles/styles.dart';

class DataBaseView extends StatefulWidget {
  const DataBaseView({super.key});

  @override
  State<DataBaseView> createState() => _DataBaseViewState();
}

class _DataBaseViewState extends State<DataBaseView> {
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
