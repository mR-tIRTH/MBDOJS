import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:toast/toast.dart';

import 'dataval.dart';

class DataIn extends StatefulWidget {
  @override
  _DataInState createState() => _DataInState();
}

class _DataInState extends State<DataIn> {
  TextEditingController controller = new TextEditingController();
  File imagefile;
  bool _upload;
  var url;
  StorageReference reference;
  String _download;

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
        .child("Commitee/" + controller.text + '.png');
    StorageUploadTask uploadTask = reference.putFile(imagefile);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    var downurl = await (await uploadTask.onComplete).ref.getDownloadURL();
    url = downurl.toString();
    setState(() {
      _upload = true;
      Toast.show("Image Uploaded", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                "Mira-Bhayandar Desuri Oswal Jain Sang",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Commitee",
                style: TextStyle(color: Colors.black, fontSize: 50),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100, right: 100),
                child: TextFormField(
                  autovalidate: true,
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: "Commitee Member Name",
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      child: Text("camera"),
                      onPressed: () {
                        getImage(true);
                      }),
                  ElevatedButton(
                      child: Text("gallery"),
                      onPressed: () {
                        getImage(false);
                      }),
                ],
              ),
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
                  : ElevatedButton(
                      child: Text("Upload"),
                      onPressed: () {
                        uploadimage();
                      }),
              SizedBox(
                height: 20,
              ),
              _upload != true
                  ? Container()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(onPressed: null, child: Text("Press")),
                        ElevatedButton(
                            child: Icon(Icons.arrow_forward),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Dataval(value: url),
                                  ));
                            }),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
