import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourmate1/home.dart';
import 'routes.dart';

class UserProfile extends StatefulWidget {
  final String userUid;
  const UserProfile({Key? key, required this.userUid}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//       void inputData(){
//       final User? user =  firebaseAuth.currentUser;
//       final uid = user!.uid;
//       userUid = uid;
// }

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> allUsersData = FirebaseFirestore.instance
        .collection("customer")
        .where("uid", isEqualTo: widget.userUid)
        .snapshots();
    return Container(
      child: Scaffold(
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
            title: Text("Profile",
                style: GoogleFonts.roboto(color: Colors.black, fontSize: 15)),
            // title: Text(
            //   "Historical Areas in Swat",
            //   style: GoogleFonts.roboto(color: Colors.black,fontSize: 15)
            // ),
          ),
          body: StreamBuilder(
            stream: allUsersData,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                print("Something Went Wrong");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              final List allUsersList = [];
              snapshot.data!.docs.map((DocumentSnapshot documet) {
                Map a = documet.data() as Map<String, dynamic>;
                allUsersList.add(a);
              }).toList();

              return Container(
                child: Column(children: [
                  // top pic and user name
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    width: MediaQuery.of(context).size.height,
                    // height: MediaQuery.of(context).size.height/2 - 100,
                    color: Colors.blue,
                    child: Column(
                      children: [
                        Container(
                            height: 200,
                            width: 200,
                            child: allUsersList[0]["image"] != ""
                                ? CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(allUsersList[0]["image"]),
                                  )
                                : CircleAvatar(
                                    child: Text(
                                      "${allUsersList[0]["name"][0]}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 48,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    backgroundColor: Colors.amber,
                                  )),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          allUsersList[0]["name"],
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  //  last row email contact and address
                  Container(
                      padding: EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width,
                      child: Column(children: [
                        Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Column(
                              children: [
                                Row(children: [
                                  Icon(
                                    Icons.mail,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    allUsersList[0]["email"],
                                    style: TextStyle(fontSize: 16),
                                  )
                                ]),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(children: [
                                  Icon(
                                    Icons.phone_android,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    allUsersList[0]["Contact"],
                                    style: TextStyle(fontSize: 16),
                                  )
                                ]),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(children: [
                                  Icon(
                                    Icons.home,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    allUsersList[0]["address"],
                                    style: TextStyle(fontSize: 16),
                                  )
                                ]),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {
                                            firebaseAuth.signOut();
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        home()));
                                          },
                                          child: Row(children: [
                                            Text("Sign Out"),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Icon(
                                              Icons.logout,
                                              color: Colors.white,
                                              size: 16,
                                            )
                                          ]))
                                    ]),
                              ],
                            ))
                      ]))
                ]),
              );
            },
          )),
    );
  }
}
