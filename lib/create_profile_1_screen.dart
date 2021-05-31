import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sample01/Constant/const.dart';
import 'package:sample01/component/my_title.dart';
import 'package:sample01/model/profile_model.dart';

import 'component/my_button.dart';
import 'component/my_text_form_field.dart';

class CreateProfileFirstScreen extends StatefulWidget {
  CreateProfileFirstScreen() : super();

  final String title = "Stepper Demo";

  @override
  CreateProfileFirstScreenState createState() =>
      CreateProfileFirstScreenState();
}

class CreateProfileFirstScreenState extends State<CreateProfileFirstScreen> {
  final _formKey = GlobalKey<FormState>();
  ProfileModel profileModel = new ProfileModel();
  int current_step = 0;
  List<Step> steps = [
    Step(
      title: Text(''),
      content: Text(''),
      subtitle: Text('Personal Details'),
      state: StepState.editing,
      isActive: true,
    ),
    Step(
      title: Text(''),
      content: Text(''),
      isActive: true,
    ),
    Step(
      title: Text(''),
      subtitle: Text(''),
      content: Text(''),
      isActive: true,
    ),
  ];

  var _gender = [
    'Please select Gender',
    'Male',
    'Female',
    'Transgender',
  ];

  String _currentSelectedValue = 'Please select Gender';
  DateTime selectedDate = DateTime(new DateTime.now().year - 6);
  TextEditingController _dateController = TextEditingController();
  File imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            MyTitle(
              title: 'Create Profile',
            ),
            Image.asset(
              'assets/stage_1.png',
              height: 60,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
            // Expanded(
            //   child: Stepper(
            //     currentStep: this.current_step,
            //     steps: steps,
            //     type: StepperType.horizontal,
            //     controlsBuilder: (BuildContext context,
            //         {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
            //       return Row(
            //         children: <Widget>[
            //           Container(
            //             child: null,
            //           ),
            //           Container(
            //             child: null,
            //           ),
            //         ],
            //       );
            //     },
            //   ),
            // ),
            Form(
              key: _formKey,
              child: Column(children: <Widget>[
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
                    profileModel.name = value;
                  },
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
                  child: Text('Gender'),
                ),
                FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 16.0),
                        hintText: 'Please select Gender',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                        ),
                        fillColor: Colors.lightBlue.withOpacity(0.2),
                        filled: true,
                        isDense: true,
                      ),
                      isEmpty: _currentSelectedValue == 'Please select Gender',
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _currentSelectedValue,
                          isDense: true,
                          onChanged: (String newValue) {
                            setState(() {
                              _currentSelectedValue = newValue;
                              state.didChange(newValue);
                            });
                          },
                          items: _gender.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                ),
                MyTextFormField(
                  label: 'D.O.B',
                  controller: _dateController,
                  onTap: () => _selectDate(context),
                  readOnly: true,
                ),
                MyTextFormField(
                  label: 'Country',
                ),
                MyTextFormField(
                  label: 'State',
                ),
                MyTextFormField(
                  label: 'City',
                ),
                MyTextFormField(
                  label: 'Address/ Pinode',
                ),
                MyTextFormField(
                  label: 'Profession',
                ),
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 160,
                    margin: EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(8)),
                    child: imageFile != null
                        ? Image.file(
                            imageFile,
                            fit: BoxFit.cover,
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.cloud_upload,
                                size: 70,
                                color: Colors.blue,
                              ),
                              Text('Upload Your Image'),
                            ],
                          ),
                  ),
                  onTap: () {
                    _imagePickerSelection();
                  },
                ),
                MyButton(
                  title: "Next",
                  onPress: () => {
                    Navigator.pushNamed(
                        context, Constant.CREATE_PROFILE_SECOND_SCREEN)
                  },
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }

  _imagePickerSelection() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(20),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  _getImage(ImageSource.gallery);
                },
                icon: Icon(Icons.folder_rounded),
                label: Text('Gallery'),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  _getImage(ImageSource.camera);
                },
                icon: Icon(Icons.camera_alt_rounded),
                label: Text('Camera'),
              )
            ],
          ),
        );
      },
    );
  }

  _getImage(ImageSource type) async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: type,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  _selectDate(BuildContext context) async {
    int lastYear = new DateTime.now().year - 5;
    int firstYear = new DateTime.now().year - 80;
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(firstYear),
        lastDate: DateTime(lastYear));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        var date =
            "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";
        _dateController.text = date;
      });
  }
}
