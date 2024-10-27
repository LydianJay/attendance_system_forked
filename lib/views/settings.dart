import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rfid_attendance_system/config/dbconfig.dart';
import 'package:rfid_attendance_system/styles/styles.dart';

/*
  This is the settings class witch builds the settings menu
  the settings menu contains configuration for the server IP
*/

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final _ctrlIP = TextEditingController(text: '192.168.1.1');

  void getConfig() async {
    File file = File('config.cfg');
    if (!await file.exists()) {
      file.writeAsString(_ctrlIP.text);
    } else {
      _ctrlIP.text = await file.readAsString();
    }
  }

  @override
  void initState() {
    super.initState();
    getConfig();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Styles.c1,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(flex: 15, child: Container()),
                    Flexible(
                      flex: 10,
                      child: TextField(
                        controller: _ctrlIP,
                        keyboardType: const TextInputType.numberWithOptions(
                          signed: false,
                          decimal: true,
                        ),
                        // inputFormatters: [
                        //   FilteringTextInputFormatter.deny(RegExp(r'[]'))
                        // ],
                        maxLength: 64,
                        decoration: Styles.id.copyWith(
                          label: const Text('Server IP:'),
                        ),
                        style: Styles.tfts,
                      ),
                    ),
                    Flexible(flex: 15, child: Container()),
                  ],
                ),
              ),
              Flexible(
                child: ElevatedButton.icon(
                  onPressed: () {
                    DbConfig.ip = _ctrlIP.text;
                    File file = File('config.cfg');
                    file.writeAsString(DbConfig.ip);
                    Navigator.pop(context);
                  },
                  label: const Text('Set Server IP'),
                  style: Styles.bstyle1,
                  icon: const Icon(Icons.check),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
