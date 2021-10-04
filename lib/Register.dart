// ignore: invalid_language_version_override
//@dart=2.9;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'home.dart';
import 'tearm_and_conditions.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore: camel_case_types
class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  _registerState createState() => _registerState();
}

// ignore: camel_case_types
class _registerState extends State<register> {
  bool isChecked = false;
  bool value = false;
  String chkError = "";
  void initState() {
    super.initState();

    ///get current user and assign his id
    // FirebaseAuth.instance.currentUser().then((FirebaseUser user) {
    //   setState(() {
    //     uid = user.uid;
    //     print(uid);
    //   });
    // });
    // _checkCurruntUser();
    FirebaseAuth.instance.signOut();
  }
  // void _checkCurruntUser() { User? user = FirebaseAuth.instance.currentUser;
  //  //_updateUser(user);
  //   }

  //final Customer uid = Customer(uid: '');
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();
  final contactController = TextEditingController();
  final nameController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  String erorr = "";
  String name = "";
  String email = "";
  String password = "";
  String confirmpassword = "";
  String massege = "";
  String contact = "";
  String address = "";
  bool valueFirst = false;
  bool valueSecond = false;
  // String _emailController = "";
  // String _passwordController = "";
  // String _addressController = "";
  // String _contactCOontroller = "";
  // registeration() async {
  //   try {
  //     UserCredential userCredential = await auth.createUserWithEmailAndPassword(
  //         email: email, password: password);
  //     Navigator.pushNamed(context, '/login');
  //     print(userCredential);
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       backgroundColor: Colors.blueAccent,
  //       content: Text(
  //         "Registeration is successful",
  //         style: TextStyle(fontSize: 20.0),
  //       ),
  //     ));
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       print('Provided Password is too weak');
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         backgroundColor: Colors.redAccent,
  //         content: Text(
  //           "Provided Password is Too Weak",
  //           style: TextStyle(fontSize: 20.0),
  //         ),
  //       ));
  //     } else if (e.code == 'email-already-in-use') {
  //       print("Account Already in Use");
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         backgroundColor: Colors.redAccent,
  //         content: Text(
  //           "Account Already in use",
  //           style: TextStyle(fontSize: 20.0),
  //         ),
  //       ));
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[220],
      resizeToAvoidBottomInset: false,
      /*appBar: AppBar(
        title: Center(child: Text("")),
      ),*/
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
              //ignore: deprecated_member_use
              //autovalidate: true,
              key: formkey,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                        //height: 160,
                        ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Sign up",
                          style: TextStyle(
                              color: Colors.blue[800],
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'RobotoMono-VariableFont_wght')),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          setState(() {
                            name = value;
                          });
                        },
                        decoration: InputDecoration(
                            labelText: "Full Name",
                            hintText: "Enter Your Full Name",
                            prefixIcon: Padding(
                                padding: EdgeInsets.all(0),
                                child: Icon(Icons.person))),
                        validator: MultiValidator([
                          RequiredValidator(errorText: "required"),
                        ])),
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
                            labelText: "Email or Phone NO",
                            hintText: "Enter Your Email or Phone NO",
                            prefixIcon: Padding(
                                padding: EdgeInsets.all(0),
                                child: Icon(Icons.email))),
                        validator: MultiValidator([
                          RequiredValidator(errorText: "required"),
                          EmailValidator(errorText: "Input Should be Email")
                        ])),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                          labelText: "Password",
                          hintText: "Enter Your Password",
                          prefixIcon: Icon(Icons.lock)),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Password";
                        }
                        confirmpassword = value;
                        print(value);
                      },
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: confirmpasswordController,
                      decoration: InputDecoration(
                          labelText: "Confirm Password",
                          hintText: "Enter Password Again",
                          prefixIcon: Icon(Icons.lock)),
                      onChanged: (value) {
                        setState(() {
                          confirmpassword = value;
                        });
                      },
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Confirm Password";
                        }
                        if (value != confirmpassword) {
                          return "Confirm Password not Matching";
                        }
                        print(value);
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: addressController,
                      keyboardType: TextInputType.streetAddress,
                      decoration: InputDecoration(
                          labelText: "Address",
                          hintText: "Address",
                          prefixIcon: Icon(Icons.navigation)),
                      onChanged: (value) {
                        setState(() {
                          address = value;
                        });
                      },
                      validator: (val) => val!.length < 10
                          ? " Should be Complet Address"
                          : null,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: contactController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Contact",
                          hintText: "Enter Your Contact NO",
                          prefixIcon: Icon(Icons.phone)),
                      onChanged: (value) {
                        setState(() {
                          contact = value;
                        });
                      },
                      validator: (val) =>
                          val!.length < 11 ? "Enter valid number" : null,
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    // CheckboxListTile(
                    //   value: isChecked,
                    //   onChanged: (bool? value) {
                    //     setState(() {
                    //       isChecked = value!;
                    //     });
                    //     // ignore: unused_label
                    //     validator:
                    //     (value) {
                    //       if (!isChecked != true) {
                    //         return 'You need to accept terms';
                    //       } else {
                    //         return null;
                    //       }
                    //     };
                    //   },
                    //   title: Text("Terms and Conditions"),
                    //   controlAffinity: ListTileControlAffinity.leading,
                    // ),
                    Row(
                      children: [
                        Checkbox(
                            value: this.value,
                            onChanged: (value) {
                              setState(() {
                                this.value = value!;
                              });
                            }),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          TermsAndConditions()));
                            },
                            child: Text("Terms and condition"))
                      ],
                    ),
                    value
                        ? Container()
                        : Text(
                            chkError,
                            style: TextStyle(color: Colors.red),
                          ),

                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        onPressed: () async {
                          if (value == false) {
                            setState(() {
                              chkError =
                                  "Please accept our term and conditions";
                            });
                          }
                          if (formkey.currentState!.validate() &&
                              value == true) {
                            //registeration();
                          }
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => home()));
                        },
                        child: Text("Go Back to home"),
                        color: Colors.redAccent,
                        splashColor: Colors.white,
                        textColor: Colors.white,
                      ),
                    ),

                    // Text(
                    //   erorr,
                    //   style: TextStyle(color: Colors.redAccent),
                    // ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
