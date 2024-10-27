import 'package:flutter/material.dart';
import 'package:rfid_attendance_system/views/dashboardview.dart';
import 'package:rfid_attendance_system/views/loginview.dart';
import 'package:rfid_attendance_system/views/settings.dart';

/*
  Routing Class for the app
*/

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RFIDAS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade50),
        useMaterial3: true,
      ),
      home: const DashBoardView(),
      routes: {
        '/login': (context) => const LoginView(), // login page
        '/dashboard': (context) => const DashBoardView(), // dashboard
        '/settings': (context) => const SettingsView(), // settings page
      },
      initialRoute: '/login', // set the initial route to login
    );
  }
}
