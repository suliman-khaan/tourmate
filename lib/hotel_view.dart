// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tourmate1/Register.dart';
import 'package:tourmate1/login.dart';
import 'package:url_launcher/url_launcher.dart';
import 'drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'socialLuncher.dart';

// ignore: must_be_immutable
class HotelView extends StatefulWidget {
  const HotelView({Key? key, required this.id, required this.index})
      : super(key: key);
  final String id;
  final int index;
  // ignore: avoid_init_to_null
  @override
  _HotelViewState createState() => _HotelViewState();
}

class _HotelViewState extends State<HotelView> {
  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Builder(builder: (context) {
              return Container(
                height: 145,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "To make a Call or WhatsApp, you need to be Logged In",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => register()));
                      },
                      child: const Text('Sign Up'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("or", style: TextStyle(color: Colors.grey)),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => login()));
                            },
                            child: Text("Login",
                                style: TextStyle(color: Colors.blue))),
                      ],
                    ),
                  ],
                ),
              );
            }),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _stream;
    // var index = widget.index;
    final Stream<QuerySnapshot> contact =
        FirebaseFirestore.instance.collection("about-us").snapshots();
    switch (widget.index) {
      case 1:
        _stream = FirebaseFirestore.instance
            .collection("hotel")
            .where("ID", isEqualTo: widget.id)
            .snapshots();
        break;
      case 2:
        _stream = FirebaseFirestore.instance
            .collection("Resturents")
            .where("ID", isEqualTo: widget.id)
            .snapshots();
        break;
      case 3:
        _stream = FirebaseFirestore.instance
            .collection("Parks")
            .where("ID", isEqualTo: widget.id)
            .snapshots();
        break;
      default:
        _stream = FirebaseFirestore.instance
            .collection("hotel")
            .where("ID", isEqualTo: widget.id)
            .snapshots();
    }
    return StreamBuilder<QuerySnapshot>(
        stream: _stream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print("Something went wrong ");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }
          final List storeHotel = [];
          snapshot.data!.docs.map((DocumentSnapshot e) {
            Map dis = e.data() as Map<String, dynamic>;
            storeHotel.add(dis);
          }).toList();
          return SafeArea(
            child: Scaffold(
              endDrawer: MyDrawer(),
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
                  storeHotel[0]['name'],
                  style: GoogleFonts.roboto(color: Colors.black),
                ),
                centerTitle: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
                actions: [],
              ),
              body: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child:
                                  // Image(image: NetworkImage(
                                  //     storeHotel[0]['image'],
                                  //   ))
                                  CachedNetworkImage(
                                imageUrl: storeHotel[0]['image'],
                                height: 200,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                placeholder: (context, url) =>
                                    Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    Center(child: Icon(Icons.error)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Title(
                                      color: Colors.black,
                                      child: Text(storeHotel[0]['name'],
                                          style: GoogleFonts.roboto(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold))),
                                ),
                                Text(
                                  storeHotel[0]['description'],
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: RaisedButton.icon(
                                        color: Colors.blue,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                        padding:
                                            EdgeInsets.fromLTRB(10, 5, 10, 5),
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.place_outlined,
                                          color: Colors.white,
                                        ),
                                        label: Text(
                                          "Get Direction",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ),
                                ),

                                // Facilities Container

                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Facilities",
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      // New
                                      widget.index == 1
                                          ? HotelFacilites(
                                              id: storeHotel[0]['ID'])
                                          : widget.index == 2
                                              ? ResturentFacilites(
                                                  id: storeHotel[0]['ID'])
                                              : ParkFacilites(
                                                  id: storeHotel[0]['ID']),
                                    ]),
                                  ),
                                ),
                                //Contact Button
                                StreamBuilder<Object>(
                                    stream: contact,
                                    builder: (context, AsyncSnapshot snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.black,
                                          ),
                                        );
                                      }
                                      final List contact = [];
                                      snapshot.data!.docs
                                          .map((DocumentSnapshot e) {
                                        Map dis =
                                            e.data() as Map<String, dynamic>;
                                        contact.add(dis);
                                      }).toList();
                                      return Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          margin: EdgeInsets.fromLTRB(
                                              10, 20, 10, 20),
                                          // decoration: BoxDecoration(
                                          //   border: Border.all(color: Colors.orange),
                                          // ),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    "Contact Us",
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.blue),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                // ignore: duplicate_ignore
                                                children: [
                                                  // Icon(Icons.call),
                                                  Text(
                                                    //if login is true then show number
                                                    FirebaseAuth.instance
                                                                .currentUser !=
                                                            null
                                                        ? contact[0]['phone']
                                                        : ("Phone number"),
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Expanded(child: Center()),
                                                  Wrap(children: [
                                                    ButtonTheme(
                                                      minWidth: 40,
                                                      child: SizedBox(
                                                        width: 40,
                                                        child: ElevatedButton(
                                                          onPressed: () async {
                                                            FirebaseAuth.instance
                                                                        .currentUser !=
                                                                    null
                                                                ? FlutterPhoneDirectCaller
                                                                    .callNumber(contact[0]
                                                                            [
                                                                            'phone']
                                                                        .toString())
                                                                : createAlertDialog(
                                                                    context);
                                                          },
                                                          style: ElevatedButton.styleFrom(
                                                              shape:
                                                                  RoundedRectangleBorder(),
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          5),
                                                              primary:
                                                                  Colors.blue),
                                                          child: FaIcon(
                                                            FontAwesomeIcons
                                                                .phone,
                                                            size: 18,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 5),
                                                    ButtonTheme(
                                                      minWidth: 40,
                                                      child: SizedBox(
                                                        width: 40,
                                                        child: ElevatedButton(
                                                            onPressed: () {
                                                              FirebaseAuth.instance
                                                                          .currentUser !=
                                                                      null
                                                                  ? whatsAppLaunch(
                                                                      phone: contact[
                                                                              0]
                                                                          [
                                                                          'phone'])
                                                                  : createAlertDialog(
                                                                      context);
                                                            },
                                                            style: ElevatedButton.styleFrom(
                                                                shape:
                                                                    RoundedRectangleBorder(),
                                                                primary: Colors
                                                                    .green,
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            5)),
                                                            child: FaIcon(
                                                              FontAwesomeIcons
                                                                  .whatsapp,
                                                              color:
                                                                  Colors.white,
                                                              // size: 18,
                                                            )),
                                                      ),
                                                    ),
                                                    SizedBox(width: 5),
                                                    ButtonTheme(
                                                      minWidth: 40,
                                                      child: SizedBox(
                                                        width: 40,
                                                        child: ElevatedButton(
                                                            onPressed: () =>
                                                                emailLaunch(
                                                                    toEmail: contact[
                                                                            0][
                                                                        'email']),
                                                            style: ElevatedButton.styleFrom(
                                                                shape:
                                                                    RoundedRectangleBorder(),
                                                                primary: Color(
                                                                    0xFFEA4335),
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            5)),
                                                            child: FaIcon(
                                                              FontAwesomeIcons
                                                                  .envelope,
                                                              color:
                                                                  Colors.white,
                                                              size: 20,
                                                            )),
                                                      ),
                                                    )
                                                  ])
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    })
                              ]),
                            ),

                            //
                          ],
                        ),

                        // old
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class HotelFacilites extends StatelessWidget {
  const HotelFacilites({Key? key, required this.id}) : super(key: key);
  final String id;
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> fStream = FirebaseFirestore.instance
        .collection("Facilities")
        .where("hotel", isEqualTo: id)
        .snapshots();
    return StreamBuilder(
        stream: fStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final List facilities = [];
          snapshot.data!.docs.map((DocumentSnapshot e) {
            Map list = e.data() as Map<String, dynamic>;
            facilities.add(list);
          }).toList();
          if (facilities.isNotEmpty) {
            return Container(
              padding: EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width,
              color: Colors.grey[50],
              child: Wrap(
                children: [
                  Wrap(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        width: MediaQuery.of(context).size.width / 2 - 16,
                        child: RichText(
                          text: TextSpan(
                              style: Theme.of(context).textTheme.bodyText2,
                              children: [
                                WidgetSpan(
                                    child: Icon(
                                  Icons.local_dining_outlined,
                                  size: 16,
                                  color: facilities[0]['breakfast'] == true
                                      ? Colors.black
                                      : Colors.grey,
                                )),
                                TextSpan(
                                    text: "  Break Fast",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: facilities[0]['breakfast'] == true
                                          ? Colors.black
                                          : Colors.grey,
                                    )),
                                // TextSpan(text:" "),
                              ]),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        width: MediaQuery.of(context).size.width / 2 - 16,
                        child: RichText(
                          text: TextSpan(
                              style: Theme.of(context).textTheme.bodyText2,
                              children: [
                                WidgetSpan(
                                    child: Icon(
                                  Icons.restaurant,
                                  size: 16,
                                  color: facilities[0]['resturent'] == true
                                      ? Colors.black
                                      : Colors.grey,
                                )),
                                TextSpan(
                                    text: "  Resturant",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: facilities[0]['resturent'] == true
                                          ? Colors.black
                                          : Colors.grey,
                                    )),
                              ]),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        width: MediaQuery.of(context).size.width / 2 - 16,
                        child: RichText(
                          text: TextSpan(
                              style: Theme.of(context).textTheme.bodyText2,
                              children: [
                                WidgetSpan(
                                    child: Icon(
                                  Icons.local_parking_sharp,
                                  size: 16,
                                  color: facilities[0]['parking'] == true
                                      ? Colors.black
                                      : Colors.grey,
                                )),
                                TextSpan(
                                    text: "  Parking",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: facilities[0]['parking'] == true
                                          ? Colors.black
                                          : Colors.grey,
                                    )),
                                // TextSpan(text:" "),
                              ]),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        width: MediaQuery.of(context).size.width / 2 - 16,
                        child: RichText(
                          text: TextSpan(
                              style: Theme.of(context).textTheme.bodyText2,
                              children: [
                                WidgetSpan(
                                    child: Icon(
                                  Icons.ac_unit_outlined,
                                  size: 16,
                                  color: facilities[0]['ac'] == true
                                      ? Colors.black
                                      : Colors.grey,
                                )),
                                TextSpan(
                                    text: "  Air Condition",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: facilities[0]['ac'] == true
                                          ? Colors.black
                                          : Colors.grey,
                                    )),
                                // TextSpan(text:" "),
                              ]),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        width: MediaQuery.of(context).size.width / 2 - 16,
                        child: RichText(
                          text: TextSpan(
                              style: Theme.of(context).textTheme.bodyText2,
                              children: [
                                WidgetSpan(
                                    child: Icon(
                                  Icons.dining,
                                  size: 16,
                                  color: facilities[0]['indoor_dining'] == true
                                      ? Colors.black
                                      : Colors.grey,
                                )),
                                TextSpan(
                                    text: "  Indoor Dining",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color:
                                          facilities[0]['indoor_dining'] == true
                                              ? Colors.black
                                              : Colors.grey,
                                    )),
                                // TextSpan(text:" "),
                              ]),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        width: MediaQuery.of(context).size.width / 2 - 16,
                        child: RichText(
                          text: TextSpan(
                              style: Theme.of(context).textTheme.bodyText2,
                              children: [
                                WidgetSpan(
                                    child: Icon(
                                  Icons.shower,
                                  size: 16,
                                  color: facilities[0]['hot_shower'] == true
                                      ? Colors.black
                                      : Colors.grey,
                                )),
                                TextSpan(
                                    text: "  Hot Shower",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: facilities[0]['hot_shower'] == true
                                          ? Colors.black
                                          : Colors.grey,
                                    )),
                                // TextSpan(text:" "),
                              ]),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        width: MediaQuery.of(context).size.width / 2 - 16,
                        child: RichText(
                          text: TextSpan(
                              style: Theme.of(context).textTheme.bodyText2,
                              children: [
                                WidgetSpan(
                                    child: Icon(
                                  Icons.microwave_outlined,
                                  size: 16,
                                  color: facilities[0]['heater'] == true
                                      ? Colors.black
                                      : Colors.grey,
                                )),
                                TextSpan(
                                    text: "  Hreter",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: facilities[0]['heater'] == true
                                          ? Colors.black
                                          : Colors.grey,
                                    )),
                                // TextSpan(text:" "),
                              ]),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        width: MediaQuery.of(context).size.width / 2 - 16,
                        child: RichText(
                          text: TextSpan(
                              style: Theme.of(context).textTheme.bodyText2,
                              children: [
                                WidgetSpan(
                                    child: Icon(
                                  Icons.tv_outlined,
                                  size: 16,
                                  color: facilities[0]['lcd'] == true
                                      ? Colors.black
                                      : Colors.grey,
                                )),
                                TextSpan(
                                    text: "  LCD",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: facilities[0]['lcd'] == true
                                          ? Colors.black
                                          : Colors.grey,
                                    )),
                                // TextSpan(text:" "),
                              ]),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          } else {
            return Container(child: Text("Facilities Database is empty"));
          }
        });
  }
}

class ResturentFacilites extends StatelessWidget {
  const ResturentFacilites({Key? key, required this.id}) : super(key: key);
  final String id;
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> fStream = FirebaseFirestore.instance
        .collection("Facilities")
        .where("resturent", isEqualTo: id)
        .snapshots();
    return StreamBuilder(
        stream: fStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          final List facilities = [];
          snapshot.data!.docs.map((DocumentSnapshot e) {
            Map list = e.data() as Map<String, dynamic>;
            facilities.add(list);
          }).toList();
          return Container(
            padding: EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width,
            color: Colors.grey[200],
            child: Wrap(
              children: [
                Wrap(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: MediaQuery.of(context).size.width / 2 - 16,
                      child: RichText(
                        text: TextSpan(
                            style: Theme.of(context).textTheme.bodyText2,
                            children: [
                              WidgetSpan(
                                  child: Icon(
                                FontAwesomeIcons.hamburger,
                                size: 16,
                                color: facilities[0]['fastfood'] == true
                                    ? Colors.black
                                    : Colors.grey,
                              )),
                              TextSpan(
                                  text: "  Fast Food",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: facilities[0]['fastfood'] == true
                                        ? Colors.black
                                        : Colors.grey,
                                  )),
                              // TextSpan(text:" "),
                            ]),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: MediaQuery.of(context).size.width / 2 - 16,
                      child: RichText(
                        text: TextSpan(
                            style: Theme.of(context).textTheme.bodyText2,
                            children: [
                              WidgetSpan(
                                  child: Icon(
                                Icons.restaurant,
                                size: 16,
                                color: facilities[0]['vegetarian'] == true
                                    ? Colors.black
                                    : Colors.grey,
                              )),
                              TextSpan(
                                  text: "  Vegetarian",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: facilities[0]['vegetarian'] == true
                                        ? Colors.black
                                        : Colors.grey,
                                  )),
                            ]),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: MediaQuery.of(context).size.width / 2 - 16,
                      child: RichText(
                        text: TextSpan(
                            style: Theme.of(context).textTheme.bodyText2,
                            children: [
                              WidgetSpan(
                                  child: Icon(
                                Icons.local_parking_sharp,
                                size: 16,
                                color: facilities[0]['parking'] == true
                                    ? Colors.black
                                    : Colors.grey,
                              )),
                              TextSpan(
                                  text: "  Parking",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: facilities[0]['parking'] == true
                                        ? Colors.black
                                        : Colors.grey,
                                  )),
                              // TextSpan(text:" "),
                            ]),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: MediaQuery.of(context).size.width / 2 - 16,
                      child: RichText(
                        text: TextSpan(
                            style: Theme.of(context).textTheme.bodyText2,
                            children: [
                              WidgetSpan(
                                  child: Icon(
                                Icons.ac_unit_outlined,
                                size: 16,
                                color: facilities[0]['ac'] == true
                                    ? Colors.black
                                    : Colors.grey,
                              )),
                              TextSpan(
                                  text: "  Air Condition",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: facilities[0]['ac'] == true
                                        ? Colors.black
                                        : Colors.grey,
                                  )),
                              // TextSpan(text:" "),
                            ]),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: MediaQuery.of(context).size.width / 2 - 16,
                      child: RichText(
                        text: TextSpan(
                            style: Theme.of(context).textTheme.bodyText2,
                            children: [
                              WidgetSpan(
                                  child: Icon(
                                Icons.coffee,
                                size: 16,
                                color: facilities[0]['coffee'] == true
                                    ? Colors.black
                                    : Colors.grey,
                              )),
                              TextSpan(
                                  text: "  Coffee",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: facilities[0]['coffee'] == true
                                        ? Colors.black
                                        : Colors.grey,
                                  )),
                              // TextSpan(text:" "),
                            ]),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: MediaQuery.of(context).size.width / 2 - 16,
                      child: RichText(
                        text: TextSpan(
                            style: Theme.of(context).textTheme.bodyText2,
                            children: [
                              WidgetSpan(
                                  child: Icon(
                                Icons.restaurant,
                                size: 16,
                                color: facilities[0]['non_vegetarian'] == true
                                    ? Colors.black
                                    : Colors.grey,
                              )),
                              TextSpan(
                                  text: "  Non-Vegetarian",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color:
                                        facilities[0]['non_vegetarian'] == true
                                            ? Colors.black
                                            : Colors.grey,
                                  )),
                              // TextSpan(text:" "),
                            ]),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}

class ParkFacilites extends StatelessWidget {
  const ParkFacilites({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> fStream = FirebaseFirestore.instance
        .collection("Facilities")
        .where("park", isEqualTo: id)
        .snapshots();
    return StreamBuilder(
        stream: fStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          final List facilities = [];
          snapshot.data!.docs.map((DocumentSnapshot e) {
            Map list = e.data() as Map<String, dynamic>;
            facilities.add(list);
          }).toList();
          return Container(
            padding: EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width,
            color: Colors.grey[400],
            child: Wrap(
              children: [
                Wrap(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: MediaQuery.of(context).size.width / 2 - 16,
                      child: RichText(
                        text: TextSpan(
                            style: Theme.of(context).textTheme.bodyText2,
                            children: [
                              WidgetSpan(
                                  child: Icon(
                                FontAwesomeIcons.hamburger,
                                size: 16,
                                color: facilities[0]['fastfood'] == true
                                    ? Colors.black
                                    : Colors.grey,
                              )),
                              TextSpan(
                                  text: "  Fast Food",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: facilities[0]['fastfood'] == true
                                        ? Colors.black
                                        : Colors.grey,
                                  )),
                              // TextSpan(text:" "),
                            ]),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: MediaQuery.of(context).size.width / 2 - 16,
                      child: RichText(
                        text: TextSpan(
                            style: Theme.of(context).textTheme.bodyText2,
                            children: [
                              WidgetSpan(
                                  child: Icon(
                                Icons.park,
                                size: 16,
                                color: facilities[0]['ship'] == true
                                    ? Colors.black
                                    : Colors.grey,
                              )),
                              TextSpan(
                                  text: "  Ship",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: facilities[0]['ship'] == true
                                        ? Colors.black
                                        : Colors.grey,
                                  )),
                            ]),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: MediaQuery.of(context).size.width / 2 - 16,
                      child: RichText(
                        text: TextSpan(
                            style: Theme.of(context).textTheme.bodyText2,
                            children: [
                              WidgetSpan(
                                  child: Icon(
                                Icons.local_parking_sharp,
                                size: 16,
                                color: facilities[0]['parking'] == true
                                    ? Colors.black
                                    : Colors.grey,
                              )),
                              TextSpan(
                                  text: "  Parking",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: facilities[0]['parking'] == true
                                        ? Colors.black
                                        : Colors.grey,
                                  )),
                              // TextSpan(text:" "),
                            ]),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: MediaQuery.of(context).size.width / 2 - 16,
                      child: RichText(
                        text: TextSpan(
                            style: Theme.of(context).textTheme.bodyText2,
                            children: [
                              WidgetSpan(
                                  child: Icon(
                                Icons.car_rental,
                                size: 16,
                                color: facilities[0]['motion_ride'] == true
                                    ? Colors.black
                                    : Colors.grey,
                              )),
                              TextSpan(
                                  text: "  Motion Ride",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: facilities[0]['motion_ride'] == true
                                        ? Colors.black
                                        : Colors.grey,
                                  )),
                              // TextSpan(text:" "),
                            ]),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: MediaQuery.of(context).size.width / 2 - 16,
                      child: RichText(
                        text: TextSpan(
                            style: Theme.of(context).textTheme.bodyText2,
                            children: [
                              WidgetSpan(
                                  child: Icon(
                                Icons.local_pizza_outlined,
                                size: 16,
                                color: facilities[0]['food'] == true
                                    ? Colors.black
                                    : Colors.grey,
                              )),
                              TextSpan(
                                  text: "  Food",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: facilities[0]['food'] == true
                                        ? Colors.black
                                        : Colors.grey,
                                  )),
                              // TextSpan(text:" "),
                            ]),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: MediaQuery.of(context).size.width / 2 - 16,
                      child: RichText(
                        text: TextSpan(
                            style: Theme.of(context).textTheme.bodyText2,
                            children: [
                              WidgetSpan(
                                  child: Icon(
                                Icons.home,
                                size: 16,
                                color:
                                    facilities[0]['kids_playing_area'] == true
                                        ? Colors.black
                                        : Colors.grey,
                              )),
                              TextSpan(
                                  text: "  Kids Playing Area",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: facilities[0]['kids_playing_area'] ==
                                            true
                                        ? Colors.black
                                        : Colors.grey,
                                  )),
                              // TextSpan(text:" "),
                            ]),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: MediaQuery.of(context).size.width / 2 - 16,
                      child: RichText(
                        text: TextSpan(
                            style: Theme.of(context).textTheme.bodyText2,
                            children: [
                              WidgetSpan(
                                  child: Icon(
                                Icons.train,
                                size: 16,
                                color: facilities[0]['dragon_train'] == true
                                    ? Colors.black
                                    : Colors.grey,
                              )),
                              TextSpan(
                                  text: "  Dragon Train",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: facilities[0]['dragon_train'] == true
                                        ? Colors.black
                                        : Colors.grey,
                                  )),
                              // TextSpan(text:" "),
                            ]),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: MediaQuery.of(context).size.width / 2 - 16,
                      child: RichText(
                        text: TextSpan(
                            style: Theme.of(context).textTheme.bodyText2,
                            children: [
                              WidgetSpan(
                                  child: Icon(
                                Icons.car_rental,
                                size: 16,
                                color: facilities[0]['electric_car'] == true
                                    ? Colors.black
                                    : Colors.grey,
                              )),
                              TextSpan(
                                  text: "  Electric Cars",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: facilities[0]['electric_car'] == true
                                        ? Colors.black
                                        : Colors.grey,
                                  )),
                              // TextSpan(text:" "),
                            ]),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}
