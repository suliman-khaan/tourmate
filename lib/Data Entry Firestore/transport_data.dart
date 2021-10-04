import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'drawer_firestore.dart';

// ignore: must_be_immutable
class TrasnportData extends StatefulWidget {
  @override
  _TrasnportDataState createState() => _TrasnportDataState();
}

class _TrasnportDataState extends State<TrasnportData> {
  String id = "";
  String company = "";
  String contactNo = "";
  String description = "";
  String district = "";
  String image = "";
  String location = "";
  bool local = false;
  String name = "";
  String type = "";

  CollectionReference users =
      FirebaseFirestore.instance.collection("Transport");

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Transport Data"),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(50, 20, 50, 0),
          child: Column(
            children: [
              // company name
              TextField(
                  onChanged: (value) {
                    company = value;
                  },
                  decoration: InputDecoration(hintText: "company name")),
              // contact no
              TextField(
                  onChanged: (value) {
                    contactNo = value;
                  },
                  decoration: InputDecoration(hintText: "Contact No")),
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
              // // type
              // TextField(
              //     onChanged: (value) {
              //       type = value;
              //     },
              //     decoration: InputDecoration(hintText: "type")),
              //local
              Row(children: [
                Checkbox(
                  value: this.local,
                  onChanged: (value) {
                    setState(() {
                      this.local = value!;
                    });
                  },
                ),
                Text("Local")
              ]),
              ElevatedButton(
                  onPressed: () async {
                    await users.add({
                      'local': local,
                      'Veh_id': "",
                      'company': company,
                      "contact_no": contactNo,
                      'description': description,
                      "district": district,
                      "image": image,
                      "location": location,
                      "name": name,
                      "type": 'transport',
                    }).then((value) => print("user added"));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TrasnportData()));
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
