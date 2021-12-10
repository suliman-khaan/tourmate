import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:tourmate1/login.dart';
import 'package:tourmate1/updation/allAreasCustomization.dart';
import 'package:tourmate1/updation/entertainmentDataCustomization.dart';
import 'package:tourmate1/updation/eventDataCustomization.dart';
import 'package:tourmate1/updation/hotelsData_customization.dart';
import 'package:tourmate1/updation/parkDataCustomization.dart';
import 'package:tourmate1/updation/restaurantDataCustomization.dart';
import 'package:tourmate1/updation/transportDataCustomization.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({Key? key}) : super(key: key);

  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 16,
            )),
        title: Text(
          "Admin Panel",
          style: GoogleFonts.roboto(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          // ignore: deprecated_member_use
          OutlineButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => login()));
            },
            child: Text("Logout"),
            splashColor: Colors.white,
            //color: Colors.transparent,
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ignore: deprecated_member_use
                SizedBox(
                  height: 50,
                  width: 100,
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HotelDataCustomization()));
                    },
                    child: Text(
                      "Hotel",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    color: Colors.blueAccent,
                    splashColor: Colors.white,
                    textColor: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  height: 50,
                  width: 100,
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TransportDataCustomization()));
                    },
                    child: Text(
                      "Transport",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    color: Colors.blueAccent,
                    splashColor: Colors.white,
                    textColor: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  height: 50,
                  width: 100,
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AllAreasData()));
                    },
                    child: Text(
                      "Areas",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    color: Colors.blueAccent,
                    splashColor: Colors.white,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ignore: deprecated_member_use
                SizedBox(
                  height: 50,
                  width: 100,
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RestaurantDataCustomization()));
                    },
                    child: Text(
                      "Resturants",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    color: Colors.blueAccent,
                    splashColor: Colors.white,
                    textColor: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  height: 50,
                  width: 100,
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ParkDataCustomization()));
                    },
                    child: Text(
                      "Parks",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    color: Colors.blueAccent,
                    splashColor: Colors.white,
                    textColor: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  height: 50,
                  width: 100,
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EventDataCustomization()));
                    },
                    child: Text(
                      "Event",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    color: Colors.blueAccent,
                    splashColor: Colors.white,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ignore: deprecated_member_use
                SizedBox(
                  height: 50,
                  width: 100,
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              EntertainmentDataCustomization()));
                    },
                    child: Text(
                      "Entertainment",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    color: Colors.blueAccent,
                    splashColor: Colors.white,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
