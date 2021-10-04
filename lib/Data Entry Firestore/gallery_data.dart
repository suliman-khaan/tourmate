import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'drawer_firestore.dart';

// ignore: must_be_immutable
class GalleryData extends StatefulWidget {
  @override
  _GalleryDataState createState() => _GalleryDataState();
}

class _GalleryDataState extends State<GalleryData> {
  String id = "";
  String district = "";
  String image = "";
  // String area = "";
  String name = "";

  CollectionReference users = FirebaseFirestore.instance.collection("Gallery");

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Gallery data"),
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

              //  district
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
              // area
              // TextField(
              //     onChanged: (value) {
              //       area = value;
              //     },
              //     decoration: InputDecoration(hintText: "area")),
              // name
              TextField(
                  onChanged: (value) {
                    name = value;
                  },
                  decoration: InputDecoration(hintText: "name")),
              ElevatedButton(
                  onPressed: () async {
                    await users.add({
                      'ID': "",
                      "district": district,
                      "image": image,
                      // "area": area,
                      "name": name,
                    }).then((value) => print("user added" + value.toString()));
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => GalleryData()));
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
