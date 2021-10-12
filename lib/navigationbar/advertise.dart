import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:toast/toast.dart';
import 'package:zoom_widget/zoom_widget.dart';

class Advertise extends StatefulWidget {
  @override
  _AdvertiseState createState() => _AdvertiseState();
}

class _AdvertiseState extends State<Advertise> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text(
          "Advertise",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 30,
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
                  .collection('advertise')
                  .orderBy('order')
                  .snapshots(),
              builder: (context, snapshot) {
                return !snapshot.hasData
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot data = snapshot.data.docs[index];
                          index += 1;
                          String url = data.data()['url'];
                          return _buildlayout(
                            index.toString(),
                            data.data()['url'],
                            data.data()['dateinserted'],
                            data.data()['desc'],
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

  _buildlayout(var count, String image, String date, String desc) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    var _height = isPortrait == true
        ? MediaQuery.of(context).size.height / 1.3
        : MediaQuery.of(context).size.height / 0.35;
    var _width = isPortrait == true
        ? MediaQuery.of(context).size.width / 1.1
        : MediaQuery.of(context).size.width / 0.5;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      child: Container(
        height: _height / 2.2,
        width: _width,
        margin: EdgeInsets.only(top: 160, left: 30, right: 30),
        decoration: BoxDecoration(
            color: Color(0xFFACF8D8), borderRadius: BorderRadius.circular(25)

            // image:
            //     DecorationImage(image: NetworkImage(image), fit: BoxFit.contain),
            ),
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(right: 300, bottom: 40, top: 10),
                child: Text(
                  count,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    decorationStyle: TextDecorationStyle.wavy,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                  ),
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
                    fit: BoxFit.contain,
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
                margin: EdgeInsets.only(bottom: 40, top: 30),
                child: Text(
                  desc,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    decorationStyle: TextDecorationStyle.wavy,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                  ),
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
