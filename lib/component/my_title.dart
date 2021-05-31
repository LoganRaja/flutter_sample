import 'package:flutter/material.dart';

class MyTitle extends StatelessWidget {
  final String title;
  final AlignmentGeometry align;

  const MyTitle({Key key, this.title, this.align=Alignment.topLeft}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: align,
      padding: EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: Colors.blue,
        ),
      ),
    );
  }
}
