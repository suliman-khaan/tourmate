import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'drawer_firestore.dart';

// ignore: must_be_immutable
class FacilitiesData extends StatefulWidget {
  @override
  _FacilitiesDataState createState() => _FacilitiesDataState();
}

class _FacilitiesDataState extends State<FacilitiesData> {
  String id = "";
  String hotel = "";
 bool breakFast = false;
 bool aC = false;
 bool coffee = false;
 bool firstaid = false;
 bool guaidance = false;
 bool heater = false;
 bool indoorDining = false;
 bool lcd = false;
  bool parking = false;
  bool securiy = false;

  CollectionReference users =
      FirebaseFirestore.instance.collection("Facilities");

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Facilities"),
        ),
        body: Column(
          children: [
            // hotel
            TextField(
                onChanged: (value) {
                  hotel = value;
                },
                decoration: InputDecoration(hintText: "Hotel")),
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
            // breakfast
            Row(children: [
              Checkbox(
                value: this.breakFast,
                onChanged: (value) {
                  setState(() {
                    this.breakFast = value!;
                  });
                },
              ),
              Text("Break Fast")
            ]),
// Coffee
            Row(children: [
              Checkbox(
                value: this.coffee,
                onChanged: (value) {
                  setState(() {
                    this.coffee = value!;
                  });
                },
              ),
              Text("Coffee")
            ]),
            // laundary
            Row(children: [
              Checkbox(
                value: this.firstaid,
                onChanged: (value) {
                  setState(() {
                    this.firstaid = value!;
                  });
                },
              ),
              Text("FirstAid")
            ]),
            // guaidance
            Row(children: [
              Checkbox(
                value: this.guaidance,
                onChanged: (value) {
                  setState(() {
                    this.guaidance = value!;
                  });
                },
              ),
              Text("guaidance")
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
            // Indoor Dining
            Row(children: [
              Checkbox(
                value: this.indoorDining,
                onChanged: (value) {
                  setState(() {
                    this.indoorDining = value!;
                  });
                },
              ),
              Text("Indoor Dining")
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
            // parking
            Row(children: [
              Checkbox(
                value: this.parking,
                onChanged: (value) {
                  setState(() {
                    this.parking = value!;
                  });
                },
              ),
              Text("parking")
            ]),
            // security
            Row(children: [
              Checkbox(
                value: this.securiy,
                onChanged: (value) {
                  setState(() {
                    this.securiy = value!;
                  });
                },
              ),
              Text("Security")
            ]),
            ElevatedButton(
                onPressed: () async {
                  await users.add({
                    'hotel': hotel,
                    'ID': "",
                    'breakfast':breakFast,
                    "ac": aC,
                    "coffee": coffee,
                    "firstaid": firstaid,
                    "guaidance": guaidance,
                    "heater": heater,
                    "indoor_dining": indoorDining,
                    "lcd": lcd,
                    "parking": parking,
                    "security": securiy
                  }).then((value) => print("user added" + value.toString()));
                },
                child: Text("Submit"))
          ],
        ),
        endDrawer: DrawerFirestore(),
      ),
    );
  }
}
