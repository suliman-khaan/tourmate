import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'drawer_firestore.dart';

// ignore: must_be_immutable
class FacilitiesTransportData extends StatefulWidget {
  @override
  _FacilitiesTransportDataState createState() =>
      _FacilitiesTransportDataState();
}

class _FacilitiesTransportDataState extends State<FacilitiesTransportData> {
  String id = "";
  String transport = "";
  bool food = false;
  bool aC = false;
  bool drinks = false;
  bool firstaid = false;
  bool heater = false;
  bool lcd = false;
  bool wifi = false;

  CollectionReference users =
      FirebaseFirestore.instance.collection("Facilities");

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Facilities Transport"),
        ),
        body: Column(
          children: [
            // hotel
            TextField(
                onChanged: (value) {
                  transport = value;
                },
                decoration: InputDecoration(hintText: "Transport")),
            // ac
            Row(children: [
              Checkbox(
                value: this.aC,
                onChanged: (value) {
                  setState(() {
                    this.aC = value!;
                  });
                },
              ),
              Text("Ac")
            ]),
            // food
            Row(children: [
              Checkbox(
                value: this.food,
                onChanged: (value) {
                  setState(() {
                    this.food = value!;
                  });
                },
              ),
              Text("Food")
            ]),
// Drinks
            Row(children: [
              Checkbox(
                value: this.drinks,
                onChanged: (value) {
                  setState(() {
                    this.drinks = value!;
                  });
                },
              ),
              Text("Drinks")
            ]),
            // First Aid
            Row(children: [
              Checkbox(
                value: this.firstaid,
                onChanged: (value) {
                  setState(() {
                    this.firstaid = value!;
                  });
                },
              ),
              Text("First Aid")
            ]),
            // Heater
            Row(children: [
              Checkbox(
                value: this.heater,
                onChanged: (value) {
                  setState(() {
                    this.heater = value!;
                  });
                },
              ),
              Text("Heater")
            ]),
            // Lcd
            Row(children: [
              Checkbox(
                value: this.lcd,
                onChanged: (value) {
                  setState(() {
                    this.lcd = value!;
                  });
                },
              ),
              Text("Lcd")
            ]),
            // wifi
            Row(children: [
              Checkbox(
                value: this.wifi,
                onChanged: (value) {
                  setState(() {
                    this.wifi = value!;
                  });
                },
              ),
              Text("wifi")
            ]),
            ElevatedButton(
                onPressed: () async {
                  await users.add({
                    'transport': transport,
                    'ID': "",
                    "ac": aC,
                    "heater": heater,
                    "drinks": drinks,
                    "food": food,
                    "first_aid": firstaid,
                    "lcd": lcd,
                    "wifi": wifi,
                  }).then((value) => print("user added" + value.toString()));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FacilitiesTransportData()));
                },
                child: Text("Submit"))
          ],
        ),
        endDrawer: DrawerFirestore(),
      ),
    );
  }
}
