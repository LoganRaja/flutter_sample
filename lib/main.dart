import 'package:flutter/material.dart';
import 'package:sample01/Constant/const.dart';
import 'package:sample01/create_profile_1_screen.dart';
import 'package:sample01/create_profile_2_screen.dart';
import 'package:sample01/dashboard_screen.dart';
import 'package:sample01/login_screen.dart';
import 'package:sample01/sign_up_screen.dart';
import 'package:sample01/splash_screen.dart';
import 'package:sample01/verification_screen.dart';
import 'package:sample01/verified_success_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test',
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        Constant.LOGIN_SCREEN: (context) => LoginScreen(),
        Constant.SIGN_UP_SCREEN:(context)=>SignUpScreen(),
        Constant.VERIFICATION_SCREEN:(context)=>VerificationScreen(),
        Constant.VERIFIED_SUCCESS_SCREEN:(context)=>VerifiedSuccessScreen(),
        Constant.CREATE_PROFILE_FIRST_SCREEN:(context)=>CreateProfileFirstScreen(),
        Constant.CREATE_PROFILE_SECOND_SCREEN:(context)=>CreateProfileSecondScreen(),
        Constant.DASHBOARD_SCREEN:(context)=>DashboardScreen(),
      },
    );
  }
}




