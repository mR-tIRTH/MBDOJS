import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Sponsorer extends StatefulWidget {
  @override
  _SponsorerState createState() => _SponsorerState();
}

@override
class _SponsorerState extends State<Sponsorer> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('spons').snapshots(),
      builder: (context, snapshot) {
        return !snapshot.hasData
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot data = snapshot.data.docs[index];
                  String url = data.data()['img'];
                  String year = data.data()['year'];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          height: 250,
                          margin: EdgeInsets.only(
                              left: 5, top: 20, bottom: 60, right: 5),
                          width: 380,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border:
                                Border.all(width: 8, color: Colors.green[900]),
                          ),
                          child: url == ""
                              ? Container(
                                  child: Text(
                                    "Sponsors image",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.green[900],
                                        fontWeight: FontWeight.bold),
                                  ),
                                  alignment: Alignment.center,
                                )
                              : Image.network(
                                  url,
                                  fit: BoxFit.contain,
                                )),
                      Container(
                          child: Center(
                        child: Text("App's Sponsors",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                decoration: TextDecoration.underline,
                                wordSpacing: 5,
                                fontStyle: FontStyle.italic,
                                color: Colors.black)),
                      )),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          child: Center(
                        child: data.data()['name'] == ""
                            ? Text("Sponsors Name",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    wordSpacing: 5,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.black))
                            : Text(data.data()['name'],
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18,
                                    wordSpacing: 3,
                                    color: Colors.black)),
                      )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          child: Center(
                        child: Text(year,
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 20,
                                wordSpacing: 5,
                                color: Colors.black)),
                      )),
                    ],
                  );
                },
              );
      },
    );
  }
}
