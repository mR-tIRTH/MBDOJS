import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart' as urlLauncher;

final Callservice _service = locator<Callservice>();

class Callservice {
  void call(var number) => urlLauncher.launch("tel:$number");
}

GetIt locator = GetIt();
void set() {
  locator.registerSingleton(Callservice());
}

class Commitee extends StatefulWidget {
  int sr = 0;
  @override
  _CommiteeState createState() => _CommiteeState();
}

class _CommiteeState extends State<Commitee> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('Commitee').snapshots(),
      builder: (context, snapshot) {
        return !snapshot.hasData
            ? Center(child: CircularProgressIndicator())
            : MediaQuery.removePadding(
                context: context,
                child: ListView.builder(
                  padding: const EdgeInsets.only(bottom: 20),
                  physics: BouncingScrollPhysics(),
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot data = snapshot.data.docs[index];
                    String url = data.data()['url'];
                    return _buildlayout(
                      data.data()['url'],
                      data.data()['name'],
                      data.data()['number'],
                    );
                  },
                ));
      },
    );
  }
}

_buildlayout(String image, String name, var number) {
  return SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    child: Container(
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
              margin: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
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
  );
}
