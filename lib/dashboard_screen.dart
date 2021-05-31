import 'package:flutter/material.dart';
import 'package:sample01/home_screen.dart';
import 'package:sample01/search_screen.dart';
import 'package:sample01/setting_screen.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen ({Key key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen > {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SearchScreen(),
    SettingScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                title: Text('Home'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search_rounded),
                title: Text('Search'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_rounded),
              title: Text('Setting'),
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          iconSize: 35,
          onTap: _onItemTapped,
          elevation: 5
      ),
    );
  }
}  