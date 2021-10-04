import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'drawer_firestore.dart';

// ignore: must_be_immutable
class AreasData extends StatefulWidget {
  @override
  _AreasDataState createState() => _AreasDataState();
}

class _AreasDataState extends State<AreasData> {
  String id = "";
  bool bestDistination = false;
  String description = "";
  String district = "";
  // ignore: non_constant_identifier_names
  String best_destination = "";
  String image = "";
  String location = "";
  String name = "";
  String type = "";

  CollectionReference users = FirebaseFirestore.instance.collection("Areas");

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Areas Data"),
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
              Row(children: [
                Checkbox(
                  value: this.bestDistination,
                  onChanged: (value) {
                    setState(() {
                      this.bestDistination = value!;
                    });
                  },
                ),
                Text("Best Distination")
              ]),
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
              if (bestDistination == false)
                TextField(
                    onChanged: (value) {
                      best_destination = value;
                    },
                    decoration: InputDecoration(hintText: "best_destination")),
              SizedBox(
                height: 10,
              ),
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
                      if (bestDistination == false)
                        "best_destination": best_destination,
                    }).then((value) => print("user added" + value.toString()));
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AreasData()));
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
