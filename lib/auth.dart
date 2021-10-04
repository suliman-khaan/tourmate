import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Customer _userFromFirebaseUser(user) {
  //   return user != null ? Customer(uid: user.uid) : null!;
  // }

  //log in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      // ignore: unused_local_variable
      UserCredential user = result;
      // return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Register with email and Password
  // ignore: non_constant_identifier_names
  Future RegisterWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      //Navigator.pushNamed(context, '/login');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.blueAccent,
        content: Text(
          "Registaration is Successful",
          style: TextStyle(fontSize: 20.0),
        ),
      ));
      return result;
      //UserCredential user = result;
      //return _userFromFirebaseUser(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('Provided Password is too weak');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            "Provided Password is Too Weak",
            style: TextStyle(fontSize: 20.0),
          ),
        ));
      } else if (e.code == 'email-already-in-use') {
        print("Account Already in Use");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            "Acoount Already in use",
            style: TextStyle(fontSize: 20.0),
          ),
        ));
      }
    }
  }
  /*Future<String> createUser(String email, String password) async {
FirebaseUser user = await 
FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email, password: password);
return user.uid;
}*/
}
