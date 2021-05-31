import 'package:flutter/material.dart';
import 'package:sample01/Constant/const.dart';
import 'package:sample01/component/my_button.dart';
import 'package:sample01/component/my_title.dart';

class VerificationScreen extends StatefulWidget {
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  String otp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(30, 60, 30, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              MyTitle(
                title: 'Verify Account',
              ),
              Text(
                Constant.VERIFY_CON1,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Form(
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.12,
                        child: TextFormField(
                          autofocus: true,
                          decoration:  InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(color: Colors.transparent)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(color: Colors.transparent)),
                              fillColor: Colors.lightBlue.withOpacity(0.2),
                              filled: true,
                              contentPadding:
                              EdgeInsets.symmetric(vertical: 15, horizontal: 10)),
                          onChanged: (text) {
                            text.length==1?FocusScope.of(context).nextFocus():null;
                            text.length==0?FocusScope.of(context).previousFocus():null;
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.12,
                        child: TextFormField(
                          autofocus: true,
                          decoration:  InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(color: Colors.transparent)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(color: Colors.transparent)),
                          fillColor: Colors.lightBlue.withOpacity(0.2),
                          filled: true,
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10)),
                          onChanged: (text) {
                            text.length==1?FocusScope.of(context).nextFocus():null;
                            text.length==0?FocusScope.of(context).previousFocus():null;
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.12,
                        child: TextFormField(
                          autofocus: true,
                          decoration:  InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(color: Colors.transparent)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(color: Colors.transparent)),
                              fillColor: Colors.lightBlue.withOpacity(0.2),
                              filled: true,
                              contentPadding:
                              EdgeInsets.symmetric(vertical: 15, horizontal: 10)),
                          onChanged: (text) {
                            text.length==1?FocusScope.of(context).nextFocus():null;
                            text.length==0?FocusScope.of(context).previousFocus():null;
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.12,
                        child: TextFormField(
                          autofocus: true,
                          decoration:  InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(color: Colors.transparent)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(color: Colors.transparent)),
                              fillColor: Colors.lightBlue.withOpacity(0.2),
                              filled: true,
                              contentPadding:
                              EdgeInsets.symmetric(vertical: 15, horizontal: 10)),
                          onChanged: (text) {
                            text.length==1?FocusScope.of(context).nextFocus():null;
                            text.length==0?FocusScope.of(context).previousFocus():null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              MyButton(
                title: 'Verify Now',
                onPress: ()=>Navigator.pushNamed(context, Constant.VERIFIED_SUCCESS_SCREEN),
              )
            ],
          ),
        ),

      ),
    );
  }
}
