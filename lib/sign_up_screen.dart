import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sample01/Utils/utils.dart';
import 'package:sample01/component/my_button.dart';
import 'package:sample01/component/my_title.dart';
import './model/signup_model.dart';
import 'component/my_text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SignUpFields(),
      ),
    );
  }
}

class SignUpFields extends StatefulWidget {
  @override
  _SignUpFieldsState createState() => _SignUpFieldsState();
}

class _SignUpFieldsState extends State<SignUpFields> {
  bool _isHidden = true, _isHiddenRePass = true;
  final _formKey = GlobalKey<FormState>();
  SignupModel signupModel = new SignupModel();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      physics: BouncingScrollPhysics(),
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              MyTitle(
                title: 'Register',
              ),
              MyTextFormField(
                label: 'Name',
                keyboardType: TextInputType.name,
                textCap: TextCapitalization.words,
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Enter your name';
                  }
                  return null;
                },
                onSaved: (String value) {
                  signupModel.name = value;
                },
              ),
              MyTextFormField(
                label: 'Mobile Number',
                keyboardType: TextInputType.phone,
                validator: (String value) {
                  if (value.length != 10) {
                    return 'Enter valid mobile number';
                  }
                  return null;
                },
                onSaved: (String value) {
                  signupModel.mobileNumber = value;
                },
              ),
              MyTextFormField(
                label: 'Email Address',
                keyboardType: TextInputType.emailAddress,
                validator: (String value) {
                  if (value.isEmpty || !Utils.isValidEmail(value)) {
                    return 'Enter valid email address';
                  }
                  return null;
                },
                onSaved: (String value) {
                  signupModel.email = value;
                },
              ),
              MyTextFormField(
                label: 'Create Password',
                isObscure: _isHidden,
                onSuffixPress: () => _togglePasswordView('Password'),
                validator: (String value) {
                  if (value.length < 5) {
                    return 'Password should be minimum 5 characters';
                  } else {
                    signupModel.password = value;
                    //_formKey.currentState.save();
                  }

                  return null;
                },
                onSaved: (String value) {
                  signupModel.password = value;
                },
              ),
              MyTextFormField(
                label: 'Re-enter Password',
                isObscure: _isHiddenRePass,
                onSuffixPress: () => _togglePasswordView('rePassword'),
                textInputAction: TextInputAction.done,
                validator: (String value) {
                  if (value.length < 5) {
                    return 'Password should be minimum 5 characters';
                  } else if (signupModel.password != null &&
                      value != signupModel.password) {
                    print(value);
                    print(signupModel.password);
                    return 'Password not matched';
                  }
                  return null;
                },
              ),
              MyButton(
                title: 'Create Account',
                onPress: () => _onSave(),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  alignment: Alignment.bottomCenter,
                  child: RichText(
                    text: TextSpan(
                      text: 'By creating an account, you agree our \n',
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Terms and Conditions',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ],
    );
  }

  _onSave() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      final snackBar = SnackBar(
        content: Text('You created your account successfully!!!!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      //Navigator.pushNamed(context, Constant.VERIFICATION_SCREEN);
    }
  }

  void _togglePasswordView(String type) {
    type == 'Password'
        ? setState(() {
            _isHidden = !_isHidden;
          })
        : setState(() {
            _isHiddenRePass = !_isHiddenRePass;
          });

    // setState(() {
    //   type == 'Password'
    //       ? _isHidden = !_isHidden
    //       : _isHiddenRePass = !_isHiddenRePass;
    // });
  }

}

