import 'package:flutter/material.dart';
import 'package:skadgate_innovations/screens/dashboard_screen.dart';
import 'package:skadgate_innovations/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}
