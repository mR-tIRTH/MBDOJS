import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'dashboardPage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<User> handleSignInEmail(
      String email, String password, BuildContext context) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      final User user = result.user;
      if (user != null) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Dashboardpage(),
            ));
      }
    } catch (e) {
      Toast.show("Invalid Details", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    }
  }
}
