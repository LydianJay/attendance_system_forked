import 'package:flutter/material.dart';
import 'package:rfid_attendance_system/styles/styles.dart';

class AddUserView extends StatefulWidget {
  const AddUserView({super.key});

  @override
  State<AddUserView> createState() => _AddUserViewState();
}

class _AddUserViewState extends State<AddUserView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Styles.c2,
                borderRadius: BorderRadius.circular(8),
              ),
            )),
        Flexible(
          flex: 20,
          child: Container(
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
