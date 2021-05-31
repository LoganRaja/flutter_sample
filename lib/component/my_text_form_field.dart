import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String label;
  final TextInputType keyboardType;
  final TextCapitalization textCap;
  final bool isObscure;
  final Function onSuffixPress;
  final TextInputAction textInputAction;
  final Function validator;
  final Function onSaved;
  final Function onTap;
  final TextEditingController controller;
  final bool readOnly;

  const MyTextFormField({
    Key key,
    this.label = '',
    this.keyboardType = TextInputType.text,
    this.textCap = TextCapitalization.none,
    this.isObscure = false,
    this.onSuffixPress,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.onSaved,
    this.controller,
    this.onTap,
    this.readOnly=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
            child: Text(label),
          ),
          TextFormField(
            textInputAction: textInputAction,
            decoration: InputDecoration(
                suffixIcon: onSuffixPress != null
                    ? IconButton(
                        onPressed: onSuffixPress,
                        splashRadius: 1,
                        icon: Icon(isObscure
                            ? Icons.visibility_off
                            : Icons.visibility),
                        iconSize: 17,
                        color: Colors.black,
                      )
                    : null,
                isDense: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                fillColor: Colors.lightBlue.withOpacity(0.2),
                filled: true,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 10)),
            cursorColor: Colors.black,
            style: TextStyle(color: Colors.black, fontSize: 15),
            keyboardType: keyboardType,
            textCapitalization: textCap,
            obscureText: isObscure,
            validator: validator,
            onSaved: onSaved,
            controller: controller,
            onTap: onTap,
            readOnly: readOnly,
          ),
        ],
      ),
    );
  }
}
