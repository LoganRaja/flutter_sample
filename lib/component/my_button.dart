 import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final  Function onPress;

  const MyButton({Key key, this.title, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: EdgeInsets.only(top: 30),
      child: ElevatedButton(
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        style: ButtonStyle(
            backgroundColor:
            MaterialStateProperty.all<Color>(Colors.blue)),
        onPressed: onPress,
      ),
    );
  }
}
