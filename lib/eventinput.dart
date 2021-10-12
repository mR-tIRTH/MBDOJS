import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:toast/toast.dart';
import 'package:intl/intl.dart';

class EventIn extends StatefulWidget {
  @override
  _EventInState createState() => _EventInState();
}

class _EventInState extends State<EventIn> {
  TextEditingController controller = new TextEditingController();
  TextEditingController controller2 = new TextEditingController();

  File imagefile;
  bool _upload;
  var url;
  StorageReference reference;
  String _download;
  int count = 1;

  String validatepass(value) {
    if (value.isEmpty) {
      return 'Required*';
    } else {
      return null;
    }
  }

  Future getImage(bool isCamera) async {
    File image;
    if (isCamera) {
      image = await ImagePicker.pickImage(source: ImageSource.camera);
    } else {
      image = await ImagePicker.pickImage(source: ImageSource.gallery);
    }
    setState(() {
      imagefile = image;
    });
  }

  Future uploadimage() async {
    StorageReference reference = FirebaseStorage.instance
        .ref()
        .child("Events/" + controller.text + count.toString() + '.png');
    count += 1;
    StorageUploadTask uploadTask = reference.putFile(imagefile);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    var downurl = await (await uploadTask.onComplete).ref.getDownloadURL();
    url = downurl.toString();
    Firestore.instance.collection('Events').document().setData({
      'url': url,
      'description': controller2.text,
      'dateinserted': controller.text,
    });
    setState(() {
      _upload = true;
      SystemNavigator.pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                "Events",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100, right: 100),
                child: TextFormField(
                  controller: controller,
                  autovalidate: true,
                  validator: validatepass,
                  onTap: () async {
                    DateTime pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(
                            2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        controller.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Date of event',
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100, right: 100),
                child: TextFormField(
                  controller: controller2,
                  autovalidate: true,
                  validator: validatepass,
                  decoration: InputDecoration(
                    labelText: 'description',
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                  child: Text("camera"),
                  onPressed: () {
                    getImage(true);
                  }),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                  child: Text("gallery"),
                  onPressed: () {
                    getImage(false);
                  }),
              SizedBox(
                height: 20,
              ),
              imagefile == null
                  ? Container()
                  : Image.file(
                      imagefile,
                      height: 300,
                      width: 300,
                    ),
              SizedBox(
                height: 20,
              ),
              imagefile == null
                  ? Container()
                  : RaisedButton(
                      child: Text("Upload"),
                      onPressed: () {
                        uploadimage();

                        Toast.show("Image Uploaded", context,
                            duration: Toast.LENGTH_SHORT, gravity: Toast.TOP);
                      }),
            ],
          ),
        ),
      ),
    );
  }
}
