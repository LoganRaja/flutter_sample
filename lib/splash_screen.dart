import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sample01/Constant/const.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {



  @override
  void initState() {
    // TODO: implement initState
      var duration = new Duration(seconds: 3);
      new Timer(duration, redirectFun);

  }
  redirectFun() {
    //Navigator.pushNamed(context, '/second');
    Navigator.pushReplacementNamed(context, Constant.LOGIN_SCREEN);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              'assets/logo.png',
              height: 100,
              width: 100,
              //colorBlendMode: BlendMode.softLight,
              //color: Colors.yellow,
              fit: BoxFit.contain,
            ),
            TextButton(
              child: Text('company slogan'),
              onPressed: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}