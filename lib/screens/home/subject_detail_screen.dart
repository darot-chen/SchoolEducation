import 'package:flutter/material.dart';

class SubjectDetail extends StatelessWidget {
  static const routeName = '/subject-detail';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Subject Detail'),),
      body: Center(child: Text("Body"),),
    );
  }
}