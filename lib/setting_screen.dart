import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isPushOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.blue.withOpacity(0.2),
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/logo.png'),
                  radius: 30,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Jhon Doe',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(20),
            color: Colors.blue.withOpacity(0.05),
            child: Text(
              'Personal Details',
              style: TextStyle(fontSize: 17, color: Colors.black),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(40, 20, 20, 20),
            child: Text(
              'Edit Profile',
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 3.0, color: Colors.lightBlue),
              ),
              color: Colors.white,
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(40, 10, 20, 10),
            child: Row(
              children: [
                Text(
                  'Push Notification',
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
                SizedBox(
                  width: 20,
                ),
                Transform.scale(
                  scale: 0.7,
                  child: CupertinoSwitch(
                    value: isPushOn,
                    activeColor: Colors.blue,
                    onChanged: (bool value) {
                      setState(() {
                        isPushOn = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 3.0, color: Colors.lightBlue),
              ),
              color: Colors.white,
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(20),
            color: Colors.blue.withOpacity(0.05),
            child: Text(
              'Support',
              style: TextStyle(fontSize: 17, color: Colors.black),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(40, 20, 20, 20),
            child: Text(
              'Report a problem',
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 3.0, color: Colors.lightBlue),
              ),
              color: Colors.white,
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(40, 20, 20, 20),
            child: Text(
              'Privacy Policy',
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 3.0, color: Colors.lightBlue),
              ),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
