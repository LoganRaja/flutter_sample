import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sample01/Constant/const.dart';
import 'package:sample01/component/my_button.dart';
import 'package:sample01/component/my_title.dart';
import 'component/my_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Login page'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: LoginFields(),
      ),
    );
  }
}

class LoginFields extends StatefulWidget {
  @override
  _LoginFieldsState createState() => _LoginFieldsState();
}

class _LoginFieldsState extends State<LoginFields> {
  bool _isHidden = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        MyTitle(
          title: "Login",
        ),
        MyTextFormField(
          label: "Email Address",
          keyboardType: TextInputType.emailAddress,
          controller: emailController,
        ),
        MyTextFormField(
          label: "Password",
          isObscure: _isHidden,
          onSuffixPress: () => _togglePasswordView(),
          controller: passwordController,
        ),
        Container(
          child: Text('Forgot Password?'),
          alignment: AlignmentDirectional.centerEnd,
          padding: EdgeInsets.only(top: 20),
        ),
        MyButton(
          title: 'Sign In',
          onPress: () { _onSignIn();},
        ),
        Container(
            height: MediaQuery.of(context).size.height * 0.28,
            alignment: Alignment.bottomCenter,
            child: RichText(
              text: TextSpan(
                text: 'Not registered yet? ',
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: 'Sign Up',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, Constant.SIGN_UP_SCREEN);
                      },
                  ),
                ],
              ),
            ))
      ],
    );
  }

  void _onSignIn() {
    // final snackBar = SnackBar(
    //   content: Text(emailController.text + ' ' + passwordController.text),
    // );
    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
    Navigator.pushNamed(context, Constant.VERIFICATION_SCREEN);
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
