import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourmate1/home.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  // var name;
  CollectionReference users =
      FirebaseFirestore.instance.collection("Contact_us");
  String name = "";
  String message = "";
  String email = "";
  final _formKey = GlobalKey<FormState>();
  Widget _fullName() {
    return TextFormField(
      // maxLines: ,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide()),
          // icon: Icon
          labelText: "Full Name",
          // labelStyle: TextStyle(),
          contentPadding: EdgeInsets.only(left: 30),
          hintText: "Enter Your Full Name"),
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter your Name";
        }
        // name = value;
        return null;
      },
      onChanged: (value) {
        name = value;
      },
    );
  }

  Widget _email() {
    return TextFormField(
      // maxLines: ,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide()),
          // icon: Icon
          labelText: "Email",
          // labelStyle: TextStyle(),
          contentPadding: EdgeInsets.only(left: 30),
          hintText: "Enter Your Email"),
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter your Email";
        }
        // name = value;
        return null;
      },
      onChanged: (value) {
        email = value;
      },
    );
  }

  Widget _message() {
    return TextFormField(
      // textAlignVertical: TextAlignVertical.top,
      maxLines: 6,
      // minLines: 3,
      decoration: InputDecoration(
          alignLabelWithHint: true,
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            // borderSide: BorderSide()
          ),
          // icon: Icon
          labelText: "Message",
          // labelStyle: TextStyle(),
          contentPadding: EdgeInsets.fromLTRB(30, 30, 30, 30),
          hintText: "Message"),
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter Some Message";
        }
        // name = value;
        return null;
      },
      onChanged: (value) {
        message = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Material(
        child: Container(
          // margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Scaffold(
            // endDrawer: MyDrawer(),
            appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                centerTitle: true,
                iconTheme: IconThemeData(color: Colors.black),
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    size: 16,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                title: Text(
                  "Contact Us",
                  style: GoogleFonts.roboto(color: Colors.black, fontSize: 16),
                )),
            body: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.fromLTRB(40, 20, 40, 0),
                child: Form(
                    key: _formKey,
                    child: Column(children: [
                      _fullName(),
                      SizedBox(
                        height: 20,
                      ),
                      _email(),
                      SizedBox(
                        height: 20,
                      ),
                      _message(),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        // ignore: deprecated_member_use
                        child: MaterialButton(
                          minWidth: double.infinity,
                          color: Colors.blue,
                          child: Text(
                            "Submit",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            // _formKey.currentState!.save();
                            if (_formKey.currentState!.validate()) {
                              await users.add({
                                "name": name,
                                "email": email,
                                "message": message,
                              }).then((value) =>
                                  print("user added" + value.toString()));

                              // ignore: deprecated_member_use
                              //   Scaffold.of(context)
                              // .showSnackBar(SnackBar(content: Text('Data is in processing.')));
                              // _formKey.currentState!.reset();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                backgroundColor: Colors.blueAccent,
                                content: Text(
                                  "Thank You for Your Feedback, Have a great time",
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ));
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => home()));
                              print("your Data added Successfuly");
                              // print(name);
                            }
                          },
                        ),
                      )
                    ])),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
