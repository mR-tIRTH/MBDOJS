import 'dart:io';

import 'package:flutter/material.dart';

class MembersDetails extends StatefulWidget {
  var name,
      image,
      fullname,
      address,
      vaas,
      wife,
      son,
      daughter,
      grandson,
      granddaughter,
      daughter_in_law,
      officeaddress,
      mother,
      father,
      brother,
      brotherwife;
  MembersDetails(
      {Key key,
      @required this.name,
      this.image,
      this.fullname,
      this.address,
      this.vaas,
      this.wife,
      this.son,
      this.daughter,
      this.grandson,
      this.granddaughter,
      this.daughter_in_law,
      this.officeaddress,
      this.mother,
      this.father,
      this.brother,
      this.brotherwife})
      : super(key: key);
  @override
  _MembersDetailsState createState() => _MembersDetailsState(
      name,
      image,
      fullname,
      address,
      vaas,
      wife,
      son,
      daughter,
      grandson,
      granddaughter,
      daughter_in_law,
      officeaddress,
      mother,
      father,
      brother,
      brotherwife);
}

class _MembersDetailsState extends State<MembersDetails>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 2, vsync: this);
  }

  var name,
      image,
      fullname,
      address,
      vaas,
      wife,
      son,
      daughter,
      grandson,
      granddaughter,
      daughter_in_law,
      officeaddress,
      mother,
      father,
      brother,
      brotherwife;

  _MembersDetailsState(
      this.name,
      this.image,
      this.fullname,
      this.address,
      this.vaas,
      this.wife,
      this.son,
      this.daughter,
      this.grandson,
      this.granddaughter,
      this.daughter_in_law,
      this.officeaddress,
      this.mother,
      this.father,
      this.brother,
      this.brotherwife);

  Widget _buildList(var lname) {
    return Container(
      height: 60,
      width: 350,
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: Color((0xFFD6F7FA)), borderRadius: BorderRadius.circular(50)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text("   Name: " + lname,
                  overflow: TextOverflow.visible,
                  style: TextStyle(fontSize: 20, wordSpacing: 2)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          leading: Container(
            child: IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.black,
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
          centerTitle: true,
          title: Text(
            "Member Details",
            style: TextStyle(color: Colors.black),
          ),
          bottom: TabBar(
              indicatorColor: Colors.green[500],
              unselectedLabelColor: Colors.black,
              labelColor: Colors.green[900],
              controller: tabController,
              tabs: [
                Tab(
                  child: Text("Personal"),
                ),
                Tab(
                  child: Text("Family"),
                ),
              ]),
        ),
        body: TabBarView(controller: tabController, children: [
          Container(
            child: ListView(
              children: [
                Container(
                  height: 400,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFACF8D8),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 350,
                        height: 400,
                        margin: EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(image), fit: BoxFit.cover)),
                      ),
                    ],
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text("Name",
                        style: TextStyle(fontSize: 20, color: Colors.black))),
                Container(
                  height: 50,
                  margin:
                      EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFACF8D8),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Text(fullname,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )),
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text("Address",
                        style: TextStyle(fontSize: 20, color: Colors.black))),
                Container(
                  height: 100,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFACF8D8),
                  ),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Text(address,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )),
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text("Office Address",
                        style: TextStyle(fontSize: 20, color: Colors.black))),
                Container(
                  height: 100,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFACF8D8),
                  ),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Text(officeaddress,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )),
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text("Vaas",
                        style: TextStyle(fontSize: 20, color: Colors.black))),
                Container(
                  height: 40,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFACF8D8),
                  ),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Text(vaas,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    dataRowHeight: MediaQuery.of(context).size.height / 9,
                    columnSpacing: MediaQuery.of(context).size.width / 5,
                    columns: [
                      DataColumn(
                          label: Text('Relation',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold))),
                      DataColumn(
                          label: Text('Name',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold))),
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(Text("Father")),
                        DataCell(Text(father, style: TextStyle(fontSize: 20))),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("Mother")),
                        DataCell(Text(mother, style: TextStyle(fontSize: 20))),
                      ]),
                      DataRow(cells: [
                        DataCell(Text("Wife")),
                        DataCell(Text(wife, style: TextStyle(fontSize: 20))),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Son')),
                        DataCell(Text(son, style: TextStyle(fontSize: 20))),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Daughter')),
                        DataCell(
                            Text(daughter, style: TextStyle(fontSize: 20))),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Daughter in law')),
                        DataCell(Text(
                          daughter_in_law,
                          style: TextStyle(fontSize: 20),
                        )),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('GrandSon')),
                        DataCell(
                            Text(grandson, style: TextStyle(fontSize: 20))),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Granddaughter')),
                        DataCell(Text(granddaughter,
                            style: TextStyle(fontSize: 20))),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Brother')),
                        DataCell(Text(brother, style: TextStyle(fontSize: 20))),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Sister in law')),
                        DataCell(
                            Text(brotherwife, style: TextStyle(fontSize: 20))),
                      ]),
                    ],
                  )),
            ),
          )
        ]));
  }
}
