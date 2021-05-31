import 'package:flutter/material.dart';

import 'Constant/const.dart';
import 'component/my_button.dart';
import 'component/my_title.dart';

class CreateProfileSecondScreen extends StatefulWidget {
  @override
  _CreateProfileSecondScreenState createState() =>
      _CreateProfileSecondScreenState();
}

class Category {
  String name;
  bool isChecked;

  Category({@required this.name, @required this.isChecked});
}

class _CreateProfileSecondScreenState extends State<CreateProfileSecondScreen> {
  List<Category> items = [
    Category(name: 'Fashion', isChecked: false),
    Category(name: 'Design', isChecked: false),
    Category(name: 'Sport', isChecked: false),
    Category(name: 'Food', isChecked: false),
    Category(name: 'Fashion1', isChecked: false),
    Category(name: 'Design1', isChecked: false),
    Category(name: 'Sport1', isChecked: false),
    Category(name: 'Food1', isChecked: false),
    Category(name: 'Fashion2', isChecked: false),
    Category(name: 'Design2', isChecked: false),
    Category(name: 'Sport2', isChecked: false),
    Category(name: 'Food2', isChecked: false),
    Category(name: 'Sport1', isChecked: false),
    Category(name: 'Food1', isChecked: false),
    Category(name: 'Fashion2', isChecked: false),
    Category(name: 'Design2', isChecked: false),
    Category(name: 'Sport2', isChecked: false),
    Category(name: 'Food2', isChecked: false),
    Category(name: 'Sport1', isChecked: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              MyTitle(
                title: 'Create Profile',
              ),
              Image.asset(
                'assets/stage_2.png',
                height: 60,
                fit: BoxFit.contain,
                width: MediaQuery.of(context).size.width,
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.builder(
                    // Create a grid with 2 columns. If you change the scrollDirection to
                    // horizontal, this produces 2 rows.
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).orientation ==
                              Orientation.landscape
                          ? 6
                          : 4,
                    ),
                    itemCount: items.length,
                    itemBuilder: (
                      context,
                      index,
                    ) {
                      return GestureDetector(
                          onTap: () {
                            List itemNew;
                            items[index].isChecked = !items[index].isChecked;
                            itemNew = items;
                            setState(() {
                              items:
                              itemNew;
                            });
                            //Navigator.of(context).pushNamed(RouteName.GridViewBuilder);
                          },
                          child: Container(
                            height: 140,
                            child: Column(
                              children: [
                                //Icon(,size:25,color:Colors.black,),
                                CircleAvatar(
                                  radius: 25,
                                  child: items[index].isChecked
                                      ? CircleAvatar(
                                          radius: 25,
                                          child: Icon(Icons.check),
                                          backgroundColor:
                                              Colors.black.withOpacity(0.7),
                                        )
                                      : null,
                                  backgroundImage:
                                      AssetImage('assets/logo.png'),
                                ),
                                Text(
                                  items[index].name,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ));
                    }),
              ),
              MyButton(
                title: "Next",
                onPress: () => {
                   Navigator.pushNamed(context, Constant.DASHBOARD_SCREEN)
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
