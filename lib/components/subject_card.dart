import 'package:MyClass/screens/home/subject_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard({
    this.image,
    this.name,
    this.color,
    Key key,
  }) : super(key: key);

  final String name;
  final String image;
  final List<Color> color;
  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      onTap: (){
        Navigator.pushNamed(context, SubjectDetail.routeName);
      },
      child: Container(
        height: 100,
        width: 155,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: color,
            )
            // color: Colors.greenAccent,
            ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.only(top: 15, left: 8),
                child: Text(
                  name,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image(
                image: AssetImage(image),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
