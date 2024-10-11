import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rfid_attendance_system/config/dbconfig.dart';
import 'package:rfid_attendance_system/controller/auth.dart';
import 'package:rfid_attendance_system/controller/system.dart';
import 'package:rfid_attendance_system/styles/styles.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _ctrlUsername = TextEditingController();
  final TextEditingController _ctrlPassword = TextEditingController();
  bool updateAvailable = false;
  Map<String, dynamic> status = {};
  void loadSettings() async {
    File file = File('config.cfg');
    if (await file.exists()) {
      DbConfig.ip = await file.readAsString();
    } else {}
  }

  void checkForUpdates() async {
    updateAvailable = await SystemCtrl.checkUpdates();
    if (updateAvailable) {
      showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            backgroundColor: Styles.c1,
            title: Text(
              'Update Available v${DbConfig.newVersion}',
              style: TextStyle(color: Styles.c4),
            ),
            children: [
              Center(
                  child: Text(
                maxLines: 2,
                textAlign: TextAlign.center,
                'Download at \nhttps://github.com/LydianJay/flutter-rfid-attendance-system/releases',
                style: Styles.p5,
              )),
            ],
          );
        },
      );
    }
  }

  void awaitStatus() async {
    status = await SystemCtrl.checkLock();
  }

  @override
  void initState() {
    super.initState();
    loadSettings();
    checkForUpdates();
    awaitStatus();
  }

  @override
  Widget build(BuildContext context) {
    double scrWidth = MediaQuery.of(context).size.width;
    double scrHeight = MediaQuery.of(context).size.height;
    return Material(
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Styles.c1,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/settings');
                      },
                      label: const Text('Settings'),
                      style: Styles.bstyle1,
                      icon: const Icon(Icons.settings),
                    ),
                  ],
                ),
              ),
              Container(
                width: scrWidth * 0.75,
                height: scrHeight * 0.65,
                decoration: BoxDecoration(
                  color: Styles.c2,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Styles.c4),
                ),
                margin: const EdgeInsets.only(bottom: 80),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Styles.c4),
                        borderRadius: BorderRadiusDirectional.circular(8),
                      ),
                      margin: const EdgeInsets.only(top: 10, bottom: 2),
                      child: Icon(
                        Icons.person,
                        size: 64,
                        color: Styles.c4,
                      ),
                    ),
                    Text(
                      'Administrator',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Calibre',
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                        color: Styles.c4,
                      ),
                    ),
                    Container(
                      width: scrWidth * 0.55,
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Styles.c4),
                        borderRadius: BorderRadiusDirectional.circular(5),
                      ),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 2,
                            child: Text(
                              'Username: ',
                              style: TextStyle(
                                fontFamily: 'Calibre',
                                fontWeight: FontWeight.bold,
                                color: Styles.c4,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 10,
                            child: Container(
                              margin: const EdgeInsets.only(left: 5),
                              child: TextField(
                                controller: _ctrlUsername,
                                keyboardType: TextInputType.name,
                                style: TextStyle(color: Styles.c4),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                                cursorColor: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: scrWidth * 0.55,
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Styles.c4),
                        borderRadius: BorderRadiusDirectional.circular(5),
                      ),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 2,
                            child: Text(
                              'Password: ',
                              style: TextStyle(
                                fontFamily: 'Calibre',
                                fontWeight: FontWeight.bold,
                                color: Styles.c4,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 10,
                            child: Container(
                              margin: const EdgeInsets.only(left: 5),
                              child: TextField(
                                controller: _ctrlPassword,
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                style: TextStyle(color: Styles.c4),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                                cursorColor: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: TextButton.icon(
                        onPressed: () async {
                          bool alreadyPop = false;
                          bool connectionError = false;
                          bool canPop = false;
                          showDialog(
                            context: context,
                            builder: (context) {
                              return PopScope(
                                onPopInvokedWithResult: (didPop, result) {
                                  if (alreadyPop) return;

                                  if (canPop) {
                                    debugPrint("Popping...");
                                    alreadyPop = true;
                                  }
                                },
                                canPop: false,
                                child: AlertDialog(
                                  backgroundColor: Styles.c1,
                                  title: Text(
                                    'Establishing Connection',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Styles.c4),
                                  ),
                                  actions: [
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      child: Center(
                                          child: Text(
                                        'Connecting to ${DbConfig.ip}...',
                                        style: Styles.p5,
                                      )),
                                    ),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: CircularProgressIndicator
                                              .adaptive(),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          );

                          bool isLogin = await Authenticator.authenticateAdmin(
                                  _ctrlUsername.text, _ctrlPassword.text)
                              .onError((E, stacktrace) {
                            debugPrint(stacktrace.toString());
                            connectionError = true;
                            canPop = true;
                            Navigator.of(context).pop();
                            showDialog(
                              context: context,
                              builder: (context) {
                                return SimpleDialog(
                                  backgroundColor: Styles.c1,
                                  title: Text(
                                    'Connection Timeout',
                                    style: TextStyle(color: Styles.c4),
                                  ),
                                  children: [
                                    Center(
                                        child: Text(
                                      'Could not connect to server',
                                      style: Styles.p5,
                                    )),
                                  ],
                                );
                              },
                            );
                            return false;
                          });
                          canPop = true;

                          if (isLogin) {
                            Navigator.of(context).pop();
                            if (status['locked'] != true) {
                              Navigator.pushNamed(context, '/dashboard');
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return SimpleDialog(
                                    backgroundColor: Styles.c1,
                                    title: Text(
                                      'Login Not Permitted',
                                      style: TextStyle(color: Styles.c4),
                                    ),
                                    children: [
                                      Center(
                                          child: Text(
                                        status['message'].toString(),
                                        style: Styles.p5,
                                      )),
                                    ],
                                  );
                                },
                              );
                            }
                          } else {
                            _ctrlPassword.clear();

                            if (!connectionError) {
                              Navigator.of(context).pop();
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return SimpleDialog(
                                    backgroundColor: Styles.c1,
                                    title: Text(
                                      'Login Failed',
                                      style: TextStyle(color: Styles.c4),
                                    ),
                                    children: [
                                      Center(
                                          child: Text(
                                        'Password or Username Incorrect!',
                                        style: Styles.p5,
                                      )),
                                    ],
                                  );
                                },
                              );
                            }
                          }
                        },
                        icon: const Icon(Icons.login_sharp),
                        label: const Text('Login'),
                        style: ButtonStyle(
                          iconColor: WidgetStatePropertyAll(Styles.c4),
                          foregroundColor: WidgetStatePropertyAll(Styles.c4),
                          backgroundColor: WidgetStatePropertyAll(Styles.c3),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadiusDirectional.circular(8),
                            ),
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
      ),
    );
  }
}
