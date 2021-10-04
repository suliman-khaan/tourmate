import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'drawer_firestore.dart';

// ignore: must_be_immutable
class FacilitiesHotelData extends StatefulWidget {
  @override
  _FacilitiesHotelDataState createState() => _FacilitiesHotelDataState();
}

class _FacilitiesHotelDataState extends State<FacilitiesHotelData> {
  String id = "";
  String hotel = "";
  bool breakFast = false;
  bool aC = false;
  bool restaurant = false;
  bool hotShower = false;
  bool heater = false;
  bool indoorDining = false;
  bool lcd = false;
  bool parking = false;
  bool wifi = false;

  CollectionReference users =
      FirebaseFirestore.instance.collection("Facilities");

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Facilities Hotels"),
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
// restaurant
            Row(children: [
              Checkbox(
                value: this.restaurant,
                onChanged: (value) {
                  setState(() {
                    this.restaurant = value!;
                  });
                },
              ),
              Text("restaurant")
            ]),
            // hotShower
            Row(children: [
              Checkbox(
                value: this.hotShower,
                onChanged: (value) {
                  setState(() {
                    this.hotShower = value!;
                  });
                },
              ),
              Text("hotShower")
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
                    'hotel': hotel,
                    'ID': "",
                    'breakfast': breakFast,
                    "ac": aC,
                    "heater": heater,
                    "indoor_dining": indoorDining,
                    "lcd": lcd,
                    "parking": parking,
                    "restaurant": restaurant,
                    "wifi": wifi,
                    "hot_shower": hotShower,
                  }).then((value) => print("user added" + value.toString()));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FacilitiesHotelData()));
                },
                child: Text("Submit"))
          ],
        ),
        endDrawer: DrawerFirestore(),
      ),
    );
  }
}
