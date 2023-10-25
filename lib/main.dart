import 'package:flutter/material.dart';
import 'package:projects_flutter/Screens/bmi_screen.dart';
import 'package:projects_flutter/Screens/intro_screen.dart';

void main() {
  runApp(const GloboApp());
}

class GloboApp extends StatelessWidget {
  const GloboApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Globo Fitness',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      routes: {
        '/': (context) => const IntroScreen(),
        '/bmi': (context) => const BmiScreen(),
      },
      initialRoute: '/',
    );
  }
}
