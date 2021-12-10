import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'drawer_firestore.dart';

// ignore: must_be_immutable
class EntertianmentsData extends StatefulWidget {
  @override
  _EntertianmentsDataState createState() => _EntertianmentsDataState();
}

class _EntertianmentsDataState extends State<EntertianmentsData> {
  String id = "";
  String bestDistination = "";
  String description = "";
  String district = "";
  String image = "";
  String location = "";
  String name = "";
  String type = "";

  CollectionReference users =
      FirebaseFirestore.instance.collection("Entertainment");

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                size: 16,
              )),
          title: Text("Entertainments Data"),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(50, 20, 50, 0),
          child: Column(
            children: [
              // // id
              // TextField(
              //   onChanged: (value){
              //     id = value;
              //   },
              //   decoration:InputDecoration(
              //     hintText: "Id"
              //   )
              // ),
              //best_ destination
              TextField(
                  onChanged: (value) {
                    bestDistination = value;
                  },
                  decoration: InputDecoration(hintText: "Best Distination")),
              //  description
              TextField(
                  onChanged: (value) {
                    description = value;
                  },
                  decoration: InputDecoration(hintText: "description")),
              // district
              TextField(
                  onChanged: (value) {
                    district = value;
                  },
                  decoration: InputDecoration(hintText: "district")),
              // image
              TextField(
                  onChanged: (value) {
                    image = value;
                  },
                  decoration: InputDecoration(hintText: "image")),
              // location
              TextField(
                  onChanged: (value) {
                    location = value;
                  },
                  decoration: InputDecoration(hintText: "location")),
              // name
              TextField(
                  onChanged: (value) {
                    name = value;
                  },
                  decoration: InputDecoration(hintText: "name")),
              // type
              TextField(
                  onChanged: (value) {
                    type = value;
                  },
                  decoration: InputDecoration(hintText: "type")),
              ElevatedButton(
                  onPressed: () async {
                    await users.add({
                      'best_destination': bestDistination,
                      'ID': "",
                      "description": description,
                      "district": district,
                      "image": image,
                      "location": location,
                      "name": name,
                      "type": type,
                    }).then((value) => print("user added"));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EntertianmentsData()));
                  },
                  child: Text("Submit"))
            ],
          ),
        ),
        endDrawer: DrawerFirestore(),
      ),
    );
  }
}
