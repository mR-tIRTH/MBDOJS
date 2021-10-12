import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';

class Dataval extends StatefulWidget {
  var value;
  Dataval({Key key, @required this.value}) : super(key: key);

  @override
  _DatavalState createState() => _DatavalState(value);
}

class _DatavalState extends State<Dataval> {
  var value;

  _DatavalState(this.value);
  TextEditingController controller = new TextEditingController();
  TextEditingController controller1 = new TextEditingController();
  TextEditingController controller2 = new TextEditingController();
  TextEditingController controller3 = new TextEditingController();
  TextEditingController controller4 = new TextEditingController();
  TextEditingController controller6 = new TextEditingController();
  TextEditingController controller7 = new TextEditingController();
  TextEditingController sons = new TextEditingController();
  TextEditingController daughter = new TextEditingController();
  TextEditingController wife = new TextEditingController();
  TextEditingController grandson = new TextEditingController();
  TextEditingController granddaughter = new TextEditingController();
  TextEditingController daughter_in_law = new TextEditingController();
  TextEditingController brother = new TextEditingController();
  TextEditingController brotherwife = new TextEditingController();
  TextEditingController mother = new TextEditingController();
  TextEditingController father = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Text(
              "Personal Details",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100),
              child: TextFormField(
                controller: controller6,
                decoration: InputDecoration(
                  labelText: "Short Name",
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 100, right: 100),
            //   child: TextFormField(
            //     controller: controller,
            //     decoration: InputDecoration(
            //       labelText: 'Full Head name',
            //       hintStyle: TextStyle(
            //         color: Colors.black,
            //         fontStyle: FontStyle.italic,
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 100, right: 100),
            //   child: TextFormField(
            //     controller: controller1,
            //     decoration: InputDecoration(
            //       labelText: 'Permanent Address',
            //       hintStyle: TextStyle(
            //         color: Colors.black,
            //         fontStyle: FontStyle.italic,
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 100, right: 100),
            //   child: TextFormField(
            //     controller: controller2,
            //     decoration: InputDecoration(
            //       labelText: 'Vaas',
            //       hintStyle: TextStyle(
            //         color: Colors.black,
            //         fontStyle: FontStyle.italic,
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100),
              child: TextFormField(
                controller: controller3,
                decoration: InputDecoration(
                  labelText: 'Mobile Number',
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 100, right: 100),
            //   child: TextFormField(
            //     controller: controller4,
            //     decoration: InputDecoration(
            //       labelText: 'Office Address',
            //       hintStyle: TextStyle(
            //         color: Colors.black,
            //         fontStyle: FontStyle.italic,
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100),
              child: TextFormField(
                controller: controller7,
                decoration: InputDecoration(
                  labelText: 'olli no',
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            // Text(
            //   "Family details",
            //   style: TextStyle(fontSize: 20),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 100, right: 100),
            //   child: TextFormField(
            //     controller: father,
            //     decoration: InputDecoration(
            //       labelText: 'father',
            //       hintStyle: TextStyle(
            //         color: Colors.black,
            //         fontStyle: FontStyle.italic,
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 100, right: 100),
            //   child: TextFormField(
            //     controller: mother,
            //     decoration: InputDecoration(
            //       labelText: 'Mother',
            //       hintStyle: TextStyle(
            //         color: Colors.black,
            //         fontStyle: FontStyle.italic,
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 100, right: 100),
            //   child: TextFormField(
            //     controller: sons,
            //     decoration: InputDecoration(
            //       labelText: 'Sons',
            //       hintStyle: TextStyle(
            //         color: Colors.black,
            //         fontStyle: FontStyle.italic,
            //       ),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 100, right: 100),
            //   child: TextFormField(
            //     controller: daughter,
            //     decoration: InputDecoration(
            //       labelText: 'Daughter',
            //       hintStyle: TextStyle(
            //         color: Colors.black,
            //         fontStyle: FontStyle.italic,
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 100, right: 100),
            //   child: TextFormField(
            //     controller: wife,
            //     decoration: InputDecoration(
            //       labelText: 'wife',
            //       hintStyle: TextStyle(
            //         color: Colors.black,
            //         fontStyle: FontStyle.italic,
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 100, right: 100),
            //   child: TextFormField(
            //     controller: grandson,
            //     decoration: InputDecoration(
            //       labelText: 'grandson',
            //       hintStyle: TextStyle(
            //         color: Colors.black,
            //         fontStyle: FontStyle.italic,
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 100, right: 100),
            //   child: TextFormField(
            //     controller: granddaughter,
            //     decoration: InputDecoration(
            //       labelText: 'granddaughter',
            //       hintStyle: TextStyle(
            //         color: Colors.black,
            //         fontStyle: FontStyle.italic,
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 100, right: 100),
            //   child: TextFormField(
            //     controller: daughter_in_law,
            //     decoration: InputDecoration(
            //       labelText: 'Daughter in law',
            //       hintStyle: TextStyle(
            //         color: Colors.black,
            //         fontStyle: FontStyle.italic,
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 100, right: 100),
            //   child: TextFormField(
            //     controller: brother,
            //     decoration: InputDecoration(
            //       labelText: 'Brother',
            //       hintStyle: TextStyle(
            //         color: Colors.black,
            //         fontStyle: FontStyle.italic,
            //       ),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 100, right: 100),
            //   child: TextFormField(
            //     controller: brotherwife,
            //     decoration: InputDecoration(
            //       labelText: 'Sister in Law',
            //       hintStyle: TextStyle(
            //         color: Colors.black,
            //         fontStyle: FontStyle.italic,
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    child: Text("Submit"),
                    onPressed: () {
                      Toast.show("Data Submitted", context,
                          duration: Toast.LENGTH_LONG, gravity: Toast.TOP);
                      FirebaseFirestore.instance
                          .collection('Commitee')
                          .doc(controller6.text)
                          .set({
                        'name': controller6.text,
                        'Full_name': controller.text,
                        'address': controller1.text,
                        'vaas': controller2.text,
                        'number': controller3.text,
                        'officeaddress': controller4.text,
                        'Sr_no': controller7.text,
                        'son': sons.text,
                        'daughter': daughter.text,
                        'grandson': grandson.text,
                        'granddaughter': granddaughter.text,
                        'wife': wife.text,
                        'daughter_in_law': daughter_in_law.text,
                        'mother': mother.text,
                        'father': father.text,
                        'brother': brother.text,
                        'sister_in_law': brotherwife.text,
                        'url': value,
                      });
                    }),
                ElevatedButton(
                    child: Text("Exit"),
                    onPressed: () {
                      SystemNavigator.pop();
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
