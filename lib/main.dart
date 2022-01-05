import 'package:flutter/material.dart';
//import 'package:nava/ui/cls_colores.dart';
//import 'package:intl/intl.dart';
import 'ui/ejemplo_DatePicker.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: darkBlue,
        ),
        debugShowCheckedModeBanner: false,
        home: FlutterDatePickerExample());
  }
}
