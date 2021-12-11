import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:tourmate1/auth.dart';
import 'package:tourmate1/home.dart';
import 'package:tourmate1/loading.dart';
import 'package:tourmate1/login.dart';
import 'package:tourmate1/updation/admine_panel.dart';

class LoginAdmin extends StatefulWidget {
  const LoginAdmin({Key? key}) : super(key: key);

  @override
  _LoginAdminState createState() => _LoginAdminState();
}

dialogBox(BuildContext context, status, text) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(status,
              style: TextStyle(
                  color: status == "Error" ? Colors.redAccent : Colors.green)),
          content: Text(text),
        );
      });
}

class _LoginAdminState extends State<LoginAdmin> {
  void initState() {
    super.initState();
    FirebaseAuth.instance.signOut();
  }

  // ignore: unused_field
  final AuthService _auth = AuthService();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String error = "";
  String email = "";
  String password = "";
  String massege = "";
  bool isHiddenPassword = true;
  bool loading = false;

  String uid = "";
  final auth = FirebaseAuth.instance;
  login_admin() async {
    try {
      final Stream<QuerySnapshot> _alldistinationStream = FirebaseFirestore
          .instance
          .collection('Areas')
          .where("explored_area", isEqualTo: true)
          .snapshots();

      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = FirebaseAuth.instance.currentUser;

      FirebaseFirestore.instance
          .collection("customer")
          .where('uid', isEqualTo: user!.uid)
          .get()
          .then((QuerySnapshot value) {
        value.docs.forEach((element) {
          if (element['role'] == 'Admin' || element['role'] == 'admin') {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AdminPanel()));
            print(userCredential);
            dialogBox(context, "Success", "Login Successful!");
          } else {}
        });
      });

      // .then((value) {
      //   if (value.docs[0].exists) {
      //     if (value.docs[0].data()) {}
      //   }
      // });

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setState(() => loading = false);
        print('No user found for Given Email');
        dialogBox(context, "Error", "Emial Is InValid!");
      } else if (e.code == 'wrong-password') {
        setState(() => loading = false);
        print('Wrong Password');
        dialogBox(context, "Error", "Wrong Password");
      }
    }
  }

  void validate() {
    if (formkey.currentState!.validate()) {
      print("ok");
    } else
      print("Error");
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.grey[220],
            resizeToAvoidBottomInset: false,
            /*appBar: AppBar(
        title: Center(child: Text("")),
      ),*/
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: MaterialButton(
                        child: const Icon(Icons.arrow_back),
                        color: Colors.blue,
                        textColor: Colors.white,
                        padding: EdgeInsets.all(10),
                        shape: CircleBorder(),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Form(
                            key: formkey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                    //height: 160,
                                    ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Admin Login",
                                      style: TextStyle(
                                          color: Colors.blue[800],
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          fontFamily:
                                              'RobotoMono-VariableFont_wght')),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    onChanged: (value) {
                                      setState(() {
                                        email = value;
                                      });
                                    },
                                    decoration: InputDecoration(
                                        labelText: "Email",
                                        hintText: "Email",
                                        prefixIcon: Padding(
                                            padding: EdgeInsets.all(0),
                                            child: Icon(Icons.email))),
                                    validator: MultiValidator([
                                      RequiredValidator(
                                          errorText: "Please enter your Email"),
                                      EmailValidator(
                                          errorText: "Input Should be Email")
                                    ])),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                    controller: passwordController,
                                    decoration: InputDecoration(
                                        labelText: "Password",
                                        hintText: "Enter Your Password",
                                        prefixIcon: Icon(Icons.lock),
                                        suffixIcon: InkWell(
                                            onTap: _togglePasswordView,
                                            child: Icon(Icons.visibility))),
                                    onChanged: (value) {
                                      setState(() {
                                        password = value;
                                      });
                                    },
                                    obscureText: isHiddenPassword,
                                    validator: RequiredValidator(
                                        errorText:
                                            "Please Enter your Password!")),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      child: Text("Forget Your Password?"),
                                      onTap: () {},
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      child: Text("User Login",
                                          style: TextStyle(
                                              color: Colors.redAccent)),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => login()));
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: double.infinity,
                                  // ignore: deprecated_member_use
                                  child: RaisedButton(
                                    onPressed: () async {
                                      if (formkey.currentState!.validate()) {
                                        setState(() => loading = true);
                                        login_admin();
                                      }
                                    },
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    color: Colors.blueAccent,
                                    splashColor: Colors.white,
                                    textColor: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: double.infinity,
                                  // ignore: deprecated_member_use
                                  child: RaisedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => home()));
                                    },
                                    child: Text("Go Back to home"),
                                    color: Colors.redAccent,
                                    splashColor: Colors.white,
                                    textColor: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                Text(
                                  error,
                                  style: TextStyle(color: Colors.green),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  void _togglePasswordView() {
    // if (isHiddenPassword == true) {
    //   isHiddenPassword = false;
    // } else {
    //   isHiddenPassword = true;
    // }

    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}
