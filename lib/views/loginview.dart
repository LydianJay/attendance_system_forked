import 'package:flutter/material.dart';
import 'package:rfid_attendance_system/styles/styles.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _ctrlUsername = TextEditingController();
  final TextEditingController _ctrlPassword = TextEditingController();

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: scrWidth * 0.75,
                height: scrHeight * 0.65,
                decoration: BoxDecoration(
                  color: Styles.c2,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Styles.c4),
                ),
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
                        onPressed: () {},
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
