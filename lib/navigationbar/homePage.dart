import 'package:flutter/material.dart';
import 'package:mbtl/tabsview/commitee.dart';
import 'package:mbtl/tabsview/member.dart';
import 'package:mbtl/tabsview/sponsorer.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    var _height = isPortrait == true
        ? MediaQuery.of(context).size.height / 1.3
        : MediaQuery.of(context).size.height / 1.7;
    var _width = isPortrait == true
        ? MediaQuery.of(context).size.width / 1.1
        : MediaQuery.of(context).size.width / 1.2;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.only(left: 15, top: 10),
          child: Container(
            height: 120.0,
            width: 130.0,
            child: Image.asset("assets/2.png"),
          ),
        ),
        title: Text(
          "MBDOJS",
          style: TextStyle(
            color: Colors.green[900],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(
            //   height: 25,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Text(
            //       "MBDOJS",
            //       style: TextStyle(
            //           color: Colors.green[900],
            //           fontFamily: 'Monteserrat',
            //           fontSize: 20,
            //           fontWeight: FontWeight.bold),
            //     ),
            //     Container(
            //       height: 75,
            //       child: Image.asset('assets/2.png'),
            //     ),
            //   ],
            // ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Container(
                    height: _height / 9,
                    width: _width / 1,
                    margin: EdgeInsets.only(left: 30, top: 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: TabBar(
                        indicatorColor: Colors.green[900],
                        unselectedLabelColor: Colors.black,
                        labelColor: Colors.green[900],
                        indicatorSize: TabBarIndicatorSize.label,
                        controller: tabController,
                        physics: BouncingScrollPhysics(),
                        tabs: <Widget>[
                          Tab(
                            child: Text(
                              "Sponsors",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Committee",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Members",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: _height,
              width: _width,
              child: TabBarView(controller: tabController, children: [
                new Sponsorer(),
                new Commitee(),
                new Members(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
