import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'drawer_firestore.dart';

// ignore: must_be_immutable
class FacilitiesRestaurantData extends StatefulWidget {
  @override
  _FacilitiesRestaurantDataState createState() =>
      _FacilitiesRestaurantDataState();
}

class _FacilitiesRestaurantDataState extends State<FacilitiesRestaurantData> {
  String id = "";
  String restaurant = "";
  bool aC = false;
  bool vegetarian = false;
  bool fastFood = false;
  bool coffee = false;
//  lcg
  bool nonVegetarian = false;
  bool parking = false;

  CollectionReference users =
      FirebaseFirestore.instance.collection("Facilities");

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Facilities Restaurants"),
        ),
        body: Column(
          children: [
            // hotel
            TextField(
                onChanged: (value) {
                  restaurant = value;
                },
                decoration: InputDecoration(hintText: "Restaurant")),
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
// Vegetarian
            Row(children: [
              Checkbox(
                value: this.vegetarian,
                onChanged: (value) {
                  setState(() {
                    this.vegetarian = value!;
                  });
                },
              ),
              Text("Vegetarian")
            ]),
            // Fast Food
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
            // coffee
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
            // nonvegetarian
            Row(children: [
              Checkbox(
                value: this.nonVegetarian,
                onChanged: (value) {
                  setState(() {
                    this.nonVegetarian = value!;
                  });
                },
              ),
              Text("Non Vegetarian")
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
                    'hotel': restaurant,
                    'ID': "",
                    "ac": aC,
                    "vegetarian": vegetarian,
                    "non_vegetarian": nonVegetarian,
                    "fast_food": fastFood,
                    "coffee": coffee,
                    "parking": parking,
                  }).then((value) => print("user added" + value.toString()));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FacilitiesRestaurantData()));
                },
                child: Text("Submit"))
          ],
        ),
        endDrawer: DrawerFirestore(),
      ),
    );
  }
}
