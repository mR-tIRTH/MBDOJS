import 'package:flutter/material.dart';
import 'package:mbtl/authentication_service.dart';
import 'authentication_service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controller = new TextEditingController();
  TextEditingController controller2 = new TextEditingController();

  final formkey = GlobalKey<FormState>();
  var authHandler = new Auth();

  // void validate() {
  //   if (formkey.currentState.validate()) {
  //   } else {
  //     print("not validated");
  //   }
  // }

  String validatepass(value) {
    if (value.isEmpty) {
      return 'Required*';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    var _height = isPortrait == true
        ? MediaQuery.of(context).size.height / 1.9
        : MediaQuery.of(context).size.height / 1.2;
    var _width = isPortrait == true
        ? MediaQuery.of(context).size.width / 1.1
        : MediaQuery.of(context).size.width / 0.5;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 55.0, right: 35.0),
            child: Image.asset('assets/2.png'),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Center(
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 50, left: 60, right: 60),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.always,
                        controller: controller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'User',
                        ),
                        validator: validatepass,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 60, right: 60),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.always,
                        controller: controller2,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password'),
                        validator: validatepass,
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 250),
                      child: FloatingActionButton(
                          onPressed: () async {
                            // FirebaseUser user = (await FirebaseAuth.instance
                            //         .signInWithEmailAndPassword(
                            //   email: controller.text,
                            //   password: controller2.text,
                            // ))
                            //     .user;
                            // if (user != null) {
                            //   Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //         builder: (context) => Dashboardpage(),
                            //       ));
                            // } else {
                            //   Toast.show("Invalid Details", context,
                            //       duration: Toast.LENGTH_SHORT,
                            //       gravity: Toast.BOTTOM);
                            // }
                            authHandler.handleSignInEmail(
                                controller.text + "@gmail.com",
                                controller2.text,
                                context);
                          },
                          backgroundColor: Colors.green[900],
                          child: Icon(Icons.arrow_forward_ios)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: _height / 9,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    height: 75,
                    width: 75,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/Tirth.jpeg"))),
                  ),
                ],
              ),
              SizedBox(
                width: _width / 5,
              ),
              Column(
                children: [
                  Text(
                    "Created By",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Tirthesh Dilipji Nahar",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "7021383586",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 35,
          ),
        ],
      ),
    );
  }
}
