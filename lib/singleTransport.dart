import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourmate1/Register.dart';
import 'package:tourmate1/login.dart';
import 'package:tourmate1/socialLuncher.dart';
import 'drawer.dart';
import 'footer.dart';

// void main() => runApp(singleTransport());

// ignore: camel_case_types
class singleTransport extends StatefulWidget {
  final String id;
  singleTransport({Key? key, required this.id}) : super(key: key);

  @override
  _singleTransportState createState() => _singleTransportState();
}

// ignore: camel_case_types
class _singleTransportState extends State<singleTransport> {
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
                      "You are Not Logged In, you need to be Logged In",
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
    final Stream<QuerySnapshot> transportStream = FirebaseFirestore.instance
        .collection("Transport")
        .where("ID", isEqualTo: widget.id)
        .snapshots();
    final Stream<QuerySnapshot> fStream = FirebaseFirestore.instance
        .collection("Facilities")
        .where("transport", isEqualTo: widget.id)
        .snapshots();
    return StreamBuilder(
        stream: transportStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final List transport = [];
          snapshot.data!.docs.map((DocumentSnapshot e) {
            Map tList = e.data() as Map<String, dynamic>;
            transport.add(tList);
          }).toList();
          return Material(
            child: SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  iconTheme: IconThemeData(color: Colors.black),
                  backgroundColor: Colors.white,
                  elevation: 0,
                  leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        size: 16,
                      )),
                  title: Text(transport[0]['name'],
                      style: GoogleFonts.roboto(
                          fontSize: 18, color: Colors.black)),
                  centerTitle: true,
                ),
                endDrawer: MyDrawer(),
                body: SingleChildScrollView(
                  child: Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 200,
                        child: Hero(
                          tag: transport[0]['image'],
                          child: CachedNetworkImage(
                            imageUrl: transport[0]['image'],
                            imageBuilder: (context, imageProvider) => Container(
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
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(transport[0]['name'],
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, top: 10),
                        child: Text(
                          transport[0]['description'],
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          // decoration: BoxDecoration(
                          // border: Border.all(color: Colors.blue)
                          // ),

                          padding: EdgeInsets.fromLTRB(8, 20, 8, 10),
                          child: Column(children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Facilities",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              ),
                            ),
                            // Facilities

                            StreamBuilder(
                                stream: fStream,
                                builder: (BuildContext context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  }

                                  if (snapshot.hasData) {
                                    final List facilities = [];
                                    snapshot.data!.docs
                                        .map((DocumentSnapshot e) {
                                      Map list =
                                          e.data() as Map<String, dynamic>;
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
                                              //food
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2 -
                                                    16,
                                                child: RichText(
                                                  text: TextSpan(
                                                      // ignore: deprecated_member_use
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2,
                                                      children: [
                                                        WidgetSpan(
                                                            child: Icon(
                                                          Icons.restaurant,
                                                          size: 16,
                                                          color: facilities[0][
                                                                      'food'] ==
                                                                  true
                                                              ? Colors.black
                                                              : Colors.grey,
                                                        )),
                                                        TextSpan(
                                                            text: "  Food",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              color: facilities[
                                                                              0]
                                                                          [
                                                                          'food'] ==
                                                                      true
                                                                  ? Colors.black
                                                                  : Colors.grey,
                                                            )),
                                                        // TextSpan(text:" "),
                                                      ]),
                                                ),
                                              ),
                                              //Drink
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2 -
                                                    16,
                                                child: RichText(
                                                  text: TextSpan(
                                                      // ignore: deprecated_member_use
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2,
                                                      children: [
                                                        WidgetSpan(
                                                            child: Icon(
                                                          Icons
                                                              .local_bar_outlined,
                                                          size: 16,
                                                          color: facilities[0][
                                                                      'drink'] ==
                                                                  true
                                                              ? Colors.black
                                                              : Colors.grey,
                                                        )),
                                                        TextSpan(
                                                            text: "  Drink",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              color: facilities[
                                                                              0]
                                                                          [
                                                                          'drink'] ==
                                                                      true
                                                                  ? Colors.black
                                                                  : Colors.grey,
                                                            )),
                                                      ]),
                                                ),
                                              ),
                                              //LCD
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2 -
                                                    16,
                                                child: RichText(
                                                  text: TextSpan(
                                                      // ignore: deprecated_member_use
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2,
                                                      children: [
                                                        WidgetSpan(
                                                            child: Icon(
                                                          Icons.tv_outlined,
                                                          size: 16,
                                                          color: facilities[0]
                                                                      ['lcd'] ==
                                                                  true
                                                              ? Colors.black
                                                              : Colors.grey,
                                                        )),
                                                        TextSpan(
                                                            text: "  LCD",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              color: facilities[
                                                                              0]
                                                                          [
                                                                          'lcd'] ==
                                                                      true
                                                                  ? Colors.black
                                                                  : Colors.grey,
                                                            )),
                                                        // TextSpan(text:" "),
                                                      ]),
                                                ),
                                              ),
                                              //AC
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2 -
                                                    16,
                                                child: RichText(
                                                  text: TextSpan(
                                                      // ignore: deprecated_member_use
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2,
                                                      children: [
                                                        WidgetSpan(
                                                            child: Icon(
                                                          Icons
                                                              .ac_unit_outlined,
                                                          size: 16,
                                                          color: facilities[0]
                                                                      ['ac'] ==
                                                                  true
                                                              ? Colors.black
                                                              : Colors.grey,
                                                        )),
                                                        TextSpan(
                                                            text:
                                                                "  Air Condition",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              color: facilities[
                                                                              0]
                                                                          [
                                                                          'ac'] ==
                                                                      true
                                                                  ? Colors.black
                                                                  : Colors.grey,
                                                            )),
                                                        // TextSpan(text:" "),
                                                      ]),
                                                ),
                                              ),
                                              //First Aid
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2 -
                                                    16,
                                                child: RichText(
                                                  text: TextSpan(
                                                      // ignore: deprecated_member_use
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2,
                                                      children: [
                                                        WidgetSpan(
                                                            child: Icon(
                                                          Icons
                                                              .health_and_safety_outlined,
                                                          size: 16,
                                                          color: facilities[0][
                                                                      'firstaid'] ==
                                                                  true
                                                              ? Colors.black
                                                              : Colors.grey,
                                                        )),
                                                        TextSpan(
                                                            text: "  First Aid",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              color: facilities[
                                                                              0]
                                                                          [
                                                                          'firstaid'] ==
                                                                      true
                                                                  ? Colors.black
                                                                  : Colors.grey,
                                                            )),
                                                        // TextSpan(text:" "),
                                                      ]),
                                                ),
                                              ),
                                              //Heater
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2 -
                                                    16,
                                                child: RichText(
                                                  text: TextSpan(
                                                      // ignore: deprecated_member_use
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2,
                                                      children: [
                                                        WidgetSpan(
                                                            child: Icon(
                                                          Icons
                                                              .microwave_outlined,
                                                          size: 16,
                                                          color: facilities[0][
                                                                      'heater'] ==
                                                                  true
                                                              ? Colors.black
                                                              : Colors.grey,
                                                        )),
                                                        TextSpan(
                                                            text: "  Heater",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              color: facilities[
                                                                              0]
                                                                          [
                                                                          'heater'] ==
                                                                      true
                                                                  ? Colors.black
                                                                  : Colors.grey,
                                                            )),
                                                        // TextSpan(text:" "),
                                                      ]),
                                                ),
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2 -
                                                    16,
                                                child: RichText(
                                                  text: TextSpan(
                                                      // ignore: deprecated_member_use
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2,
                                                      children: [
                                                        WidgetSpan(
                                                            child: Icon(
                                                          Icons.wifi,
                                                          size: 16,
                                                          color: facilities[0][
                                                                      'wifi'] ==
                                                                  true
                                                              ? Colors.black
                                                              : Colors.grey,
                                                        )),
                                                        TextSpan(
                                                            text: "  Wifi",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              color: facilities[
                                                                              0]
                                                                          [
                                                                          'wifi'] ==
                                                                      true
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
                                    return Center(
                                        child: Text(
                                            "Sorry! No Facilities Availiable."));
                                  }
                                }),
                                StreamBuilder<Object>(
                                    stream: FirebaseFirestore.instance.collection("about-us").snapshots(),
                                    builder: (context, AsyncSnapshot snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.blue,
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
                      ),
                    ],
                  )),
                ),
                bottomNavigationBar: footer(),
              ),
            ),
          );
        });
  }
}
