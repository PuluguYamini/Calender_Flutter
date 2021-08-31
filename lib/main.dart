// @dart=2.9
import 'package:flutter/material.dart';
import './methods/imgcalender.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(title: const Text('Image Picker with Calender')),
        resizeToAvoidBottomInset: false,
        body: MyHomePage(),
      ),
    );
  }
}
