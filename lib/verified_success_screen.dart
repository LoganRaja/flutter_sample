import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sample01/Constant/const.dart';
import 'package:sample01/component/my_title.dart';

class VerifiedSuccessScreen extends StatefulWidget {
  @override
  _VerifiedSuccessScreenState createState() => _VerifiedSuccessScreenState();
}

class _VerifiedSuccessScreenState extends State<VerifiedSuccessScreen> {
  String otp;

  @override
  void initState() {
    // TODO: implement initState
    var duration = new Duration(seconds: 3);
    new Timer(duration, redirectFun);

  }
  redirectFun() {
    //Navigator.pushNamed(context, '/second');
    Navigator.pushReplacementNamed(context, Constant.CREATE_PROFILE_FIRST_SCREEN);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.check_circle_outline,
                size: 70,
                color: Colors.blue,
              ),
              MyTitle(
                title: 'Email Verified',
                align: Alignment.center,
              ),
              Text(
                Constant.VERIFIED_SUCCESS_MSG,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
