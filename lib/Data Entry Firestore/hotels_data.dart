import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'drawer_firestore.dart';

// ignore: must_be_immutable
class HotelsData extends StatefulWidget {
  @override
  _HotelsDataState createState() => _HotelsDataState();
}

class _HotelsDataState extends State<HotelsData> {
  String id = "";
  String bestDistination = "";
  String description = "";
  String contact = "";
  String district = "";
  String image = "";
  String location = "";
  String name = "";
  String type = "";
  bool topHotel = false;

  CollectionReference users = FirebaseFirestore.instance.collection("hotel");

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hotels Data"),
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
              //  contact_no
              TextField(
                  onChanged: (value) {
                    contact = value;
                  },
                  decoration: InputDecoration(hintText: "contact_no")),
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
              //local
              Row(children: [
                Checkbox(
                  value: this.topHotel,
                  onChanged: (value) {
                    setState(() {
                      this.topHotel = value!;
                    });
                  },
                ),
                Text("Local")
              ]),
              ElevatedButton(
                  onPressed: () async {
                    await users.add({
                      'best_destination': bestDistination,
                      'ID': "",
                      'contact_no': contact,
                      "description": description,
                      "district": district,
                      "image": image,
                      "location": location,
                      "name": name,
                      "top_hotel": topHotel,
                      "type": type,
                    }).then((value) => print("user added" + value.toString()));
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HotelsData()));
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
