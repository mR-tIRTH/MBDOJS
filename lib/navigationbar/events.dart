import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:toast/toast.dart';

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text(
          "Events",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 20,
            fontFamily: 'Monteserrat',
          ),
        ),
      ),
      body: PageView(
        physics: BouncingScrollPhysics(),
        pageSnapping: true,
        controller: controller,
        children: [
          Container(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('Events')
                  .orderBy('dateinserted')
                  .snapshots(),
              builder: (context, snapshot) {
                return !snapshot.hasData
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot data = snapshot.data.docs[index];
                          String url = data.data()['url'];
                          return _buildlayout(
                            data.data()['url'],
                            data.data()['description'],
                            data.data()['dateinserted'],
                          );
                        },
                      );
              },
            ),
          ),
        ],
      ),
    );
  }

  _buildlayout(String image, String des, String date) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    var _height = isPortrait == true
        ? MediaQuery.of(context).size.height / 1.3
        : MediaQuery.of(context).size.height / 0.32;
    var _width = isPortrait == true
        ? MediaQuery.of(context).size.width / 1.1
        : MediaQuery.of(context).size.width / 0.5;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        height: _height / 1.5,
        width: _width,
        margin: EdgeInsets.only(top: 20, bottom: 50, left: 30, right: 30),
        padding: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: Color(0xFFACF8D8), borderRadius: BorderRadius.circular(25)

            // image:
            //     DecorationImage(image: NetworkImage(image), fit: BoxFit.contain),
            ),
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(left: 20, bottom: 50, top: 30),
                child: Text(
                  "Date : " + date,
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold),
                )),
            Center(
              child: Container(
                margin: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: GestureDetector(
                  child: Image.network(
                    image,
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return DetailScreen(image: image);
                    }));
                  },
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(
                  left: 20,
                  top: isPortrait == true
                      ? MediaQuery.of(context).size.height / 12
                      : MediaQuery.of(context).size.height / 5,
                ),
                child: Text(
                  "Description : " + des,
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  var image;
  DetailScreen({this.image});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: TextButton(
                    child: Text("SAVE",
                        style: TextStyle(color: Colors.black, fontSize: 15)),
                    onPressed: () async {
                      final status = await Permission.storage.request();
                      if (status.isGranted) {
                        final externaldir = await getExternalStorageDirectory();

                        FlutterDownloader.enqueue(
                          url: image,
                          savedDir: externaldir.path,
                          fileName: 'download',
                          showNotification: true,
                          openFileFromNotification: true,
                        );
                        Toast.show("Downloaded", context,
                            duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
                      } else {
                        print("denied");
                      }
                    }),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: 200, bottom: 50, left: 20, right: 20),
              child: Center(
                child: Image.network(
                  image,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
