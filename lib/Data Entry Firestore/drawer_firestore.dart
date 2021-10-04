import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tourmate1/Data%20Entry%20Firestore/areas_data.dart';

import '../routes.dart';
import 'disrict_data.dart';
import 'entertainmetns_data.dart';
import 'events_data.dart';
import 'facilities.dart';
import 'facilities_hotel.dart';
import 'facilities_park.dart';
import 'facilities_restaurants.dart';
import 'facilities_transport.dart';
import 'gallery_data.dart';
import 'hotels_data.dart';
import 'parks_data.dart';
import 'restaurants_data.dart';
import 'review_data.dart';
import 'transport_data.dart';

class DrawerFirestore extends StatefulWidget {
  const DrawerFirestore({Key? key}) : super(key: key);

  @override
  _DrawerFirestoreState createState() => _DrawerFirestoreState();
}

class _DrawerFirestoreState extends State<DrawerFirestore> {
  Widget _createDrawerItem(
      {required String text, required GestureTapCallback onTap}) {
    return ListTile(
      title: Text(
        text,
        textScaleFactor: 1.2,
      ),
      onTap: onTap,
    );
  }

  createDialogBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Hello Sir Please Logged in"),
            content: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, MyRoute.login);
                },
                child: Text("Sign In")),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            // duration: Duration(milliseconds: 2500),
            padding: EdgeInsets.zero,
            // margin: EdgeInsets.zero,
            child: Stack(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text(
                    "All Collections",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  accountEmail: Text(""),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: CloseButton(
                    color: Colors.white,
                    onPressed: Navigator.of(context).pop,
                  ),
                )
              ],
            ),
          ),
          // CloseButton(),
          _createDrawerItem(
              text: "Areas",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AreasData()));
              }),
          _createDrawerItem(
              text: "District",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DistrictData()));
              }),
          _createDrawerItem(
              text: "Entertainments",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EntertianmentsData()));
              }),
          _createDrawerItem(
              text: "Events",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EventsDAta()));
              }),
          _createDrawerItem(
              text: "Facilities",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FacilitiesData()));
              }),
          _createDrawerItem(
              text: "Gallery Data",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GalleryData()));
              }),
          _createDrawerItem(
              text: "Hotels Data",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HotelsData()));
              }),
          _createDrawerItem(
              text: "Prks Data",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ParksData()));
              }),
          _createDrawerItem(
              text: "Restaurants Data",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RestaurantsData()));
              }),
          _createDrawerItem(
              text: "Review Data",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ReviewData()));
              }),
          _createDrawerItem(
              text: "Transport Data",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TrasnportData()));
              }),
          _createDrawerItem(
              text: "Facilities Hotels",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FacilitiesHotelData()));
              }),
          _createDrawerItem(
              text: "Facilities Restaurants",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FacilitiesRestaurantData()));
              }),
          _createDrawerItem(
              text: "Facilities Transport",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FacilitiesTransportData()));
              }),
          _createDrawerItem(
              text: "Facilities Park",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FacilitiesParkData()));
              }),
        ],
      ),
    );
  }
}
