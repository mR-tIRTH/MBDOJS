import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mbtl/navigationBar/homePage.dart';
import 'package:mbtl/navigationBar/advertise.dart';

import 'navigationBar/events.dart';

class Dashboardpage extends StatefulWidget {
  @override
  _DashboardpageState createState() => _DashboardpageState();
}

class _DashboardpageState extends State<Dashboardpage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Homepage(),
    Events(),
    Advertise(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Firebase.initializeApp();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<bool> _backpress() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Do You Want To Exit"),
              actions: <Widget>[
                ElevatedButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Dashboardpage(),
                        )),
                    style: ElevatedButton.styleFrom(primary: Colors.green[300]),
                    child: Text("no")),
                ElevatedButton(
                    onPressed: () => SystemNavigator.pop(),
                    style: ElevatedButton.styleFrom(primary: Colors.green[300]),
                    child: Text("Yes"))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _backpress,
      child: Scaffold(
        backgroundColor: Color(0xffffffff),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 20,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(" "),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.camera_enhance), title: Text(" ")),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_tree,
              ),
              title: Text(("")),
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.green,
        ),
      ),
    );
  }
}
