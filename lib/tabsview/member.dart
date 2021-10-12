import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mbtl/Details/member_details.dart';
import 'package:url_launcher/url_launcher.dart' as urlLauncher;

final Callservice _service = locator<Callservice>();

class Callservice {
  void call(var number) => urlLauncher.launch("tel:$number");
}

GetIt locator = GetIt();
void set() {
  locator.registerSingleton(Callservice());
}

class Members extends StatefulWidget {
  @override
  _MembersState createState() => _MembersState();
}

class _MembersState extends State<Members> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('members')
          .orderBy('name')
          .snapshots(),
      builder: (context, snapshot) {
        return !snapshot.hasData
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                padding: const EdgeInsets.only(bottom: 20),
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot data = snapshot.data.docs[index];
                  index += 1;
                  String url = data.data()['url'];
                  return _buildlayout(
                    data.data()['name'],
                    data.data()['url'],
                    data.data()['number'],
                    context,
                    data.data()['Full_name'],
                    data.data()['Sr_no'],
                    data.data()['address'],
                    data.data()['vaas'],
                    data.data()['wife'],
                    data.data()['son'],
                    data.data()['daughter'],
                    data.data()['grandson'],
                    data.data()['granddaughter'],
                    data.data()['daughter_in_law'],
                    data.data()['officeaddress'],
                    data.data()['mother'],
                    data.data()['father'],
                    data.data()['brother'],
                    data.data()['sister_in_law'],
                  );
                },
              );
      },
    );
  }
}

_buildlayout(
    String name,
    String image,
    var number,
    BuildContext context,
    String fullname,
    String srno,
    String address,
    String vaas,
    String wife,
    String son,
    String daughter,
    String grandson,
    String granddaughter,
    String daughter_in_law,
    String officeaddress,
    String mother,
    String father,
    String brother,
    String brotherwife) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MembersDetails(
                    name: name,
                    image: image,
                    fullname: fullname,
                    address: address,
                    vaas: vaas,
                    wife: wife,
                    son: son,
                    daughter: daughter,
                    grandson: grandson,
                    granddaughter: granddaughter,
                    daughter_in_law: daughter_in_law,
                    officeaddress: officeaddress,
                    mother: mother,
                    father: father,
                    brother: brother,
                    brotherwife: brotherwife,
                  )));
    },
    child: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        height: 150,
        width: 200,
        margin: EdgeInsets.only(left: 1, right: 1, top: 20),
        decoration: BoxDecoration(
            color: Color(0xFFACF8D8), borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Container(
              height: 150,
              width: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: NetworkImage(image))),
            ),
            Container(
                margin: EdgeInsets.only(top: 25, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.green[900]),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      number,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.green[900]),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: Container(
                        height: 40,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green[300],
                        ),
                        child: IconButton(
                            icon: Icon(Icons.call),
                            onPressed: () {
                              _service.call(number);
                            }),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    ),
  );
}
