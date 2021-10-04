import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'drawer_firestore.dart';

// ignore: must_be_immutable
class FacilitiesParkData extends StatefulWidget {
  @override
  _FacilitiesParkDataState createState() => _FacilitiesParkDataState();
}

class _FacilitiesParkDataState extends State<FacilitiesParkData> {
  String id = "";
  String park = "";
  bool fastFood = false;
  bool ship = false;
  bool motionRide = false;
  bool kidsPlayingArea = false;
  bool dragonTrain = false;
  bool electricCars = false;
  bool parking = false;

  CollectionReference users =
      FirebaseFirestore.instance.collection("Facilities");

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Facilities Park"),
        ),
        body: Column(
          children: [
            // hotel
            TextField(
                onChanged: (value) {
                  park = value;
                },
                decoration: InputDecoration(hintText: "Park")),
            // ac
            Row(children: [
              Checkbox(
                value: this.fastFood,
                onChanged: (value) {
                  setState(() {
                    this.fastFood = value!;
                  });
                },
              ),
              Text("Fast Food")
            ]),
            // ship
            Row(children: [
              Checkbox(
                value: this.ship,
                onChanged: (value) {
                  setState(() {
                    this.ship = value!;
                  });
                },
              ),
              Text("ship")
            ]),
// Motion Ride
            Row(children: [
              Checkbox(
                value: this.motionRide,
                onChanged: (value) {
                  setState(() {
                    this.motionRide = value!;
                  });
                },
              ),
              Text("Motion Ride")
            ]),
            // kids playing area
            Row(children: [
              Checkbox(
                value: this.kidsPlayingArea,
                onChanged: (value) {
                  setState(() {
                    this.kidsPlayingArea = value!;
                  });
                },
              ),
              Text("kids playing area")
            ]),
            // Dragon Train
            Row(children: [
              Checkbox(
                value: this.dragonTrain,
                onChanged: (value) {
                  setState(() {
                    this.dragonTrain = value!;
                  });
                },
              ),
              Text("Dragon Train")
            ]),
            // Electric Cars
            Row(children: [
              Checkbox(
                value: this.electricCars,
                onChanged: (value) {
                  setState(() {
                    this.electricCars = value!;
                  });
                },
              ),
              Text("Electric Cars")
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
            ElevatedButton(
                onPressed: () async {
                  await users.add({
                    "ID": "",
                    'park': park,
                    "fash_food": fastFood,
                    "ship": ship,
                    "motion_ride": motionRide,
                    "kids_playing_area": kidsPlayingArea,
                    "dragon_train": dragonTrain,
                    "electric_cars": electricCars,
                    "parking": parking,
                  }).then((value) => print("user added" + value.toString()));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FacilitiesParkData()));
                },
                child: Text("Submit"))
          ],
        ),
        endDrawer: DrawerFirestore(),
      ),
    );
  }
}
