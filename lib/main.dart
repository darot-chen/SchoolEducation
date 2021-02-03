import 'package:MyClass/screens/home/subject_detail_screen.dart';
import 'package:MyClass/screens/wrapper.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Home(),
      initialRoute: ('/'),
      routes: {
        ('/') : (ctx) => Wrapper(),
        SubjectDetail.routeName: (ctx) => SubjectDetail(),
      },
    );
  }
}



