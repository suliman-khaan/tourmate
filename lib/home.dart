import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tourmate1/Register.dart';
import 'package:tourmate1/allResturent.dart';
import 'package:tourmate1/allTransport.dart';
import 'package:tourmate1/all_distination.dart';
import 'package:tourmate1/login.dart';
import 'package:tourmate1/routes.dart';
import 'package:tourmate1/search_page.dart';
import 'allHotel.dart';
import 'hotel_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'drawer.dart';
import 'footer.dart';
import 'singleDistrict.dart';
import 'view_best_distination.dart';

// ignore: camel_case_types
class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

// ignore: camel_case_types
class _homeState extends State<home> {
  // final FirebaseAuth auth = FirebaseAuth.instance;
  String userId = "hello";

  var user;
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        userId = "";
      } else {
        final User? user = FirebaseAuth.instance.currentUser;
        final uid = user!.uid;
        userId = uid;
      }
    });
  }

  final Stream<QuerySnapshot> districtStream =
      FirebaseFirestore.instance.collection("District").snapshots();
  final Stream<QuerySnapshot> hotelStream =
      FirebaseFirestore.instance.collection("hotel").snapshots();
  final Stream<QuerySnapshot> attractiveStream = FirebaseFirestore.instance
      .collection("Areas")
      .where("best_destination", isEqualTo: true)
      .snapshots();
  final Stream<QuerySnapshot> resturantStream =
      FirebaseFirestore.instance.collection("Resturents").snapshots();
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
            // backgroundColor: Colors.white,
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white.withAlpha(200),
              title: Text("Tour Mate", style: TextStyle(color: Colors.black)),
              actions: [
                if(FirebaseAuth.instance.currentUser == null)...[
                  Container(
                        child: Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => login()));
                              },
                              child: Text(
                                "Login",
                              )),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => register()));
                              },
                              child: Text(
                                "Sign Up",
                              )),
                        ],
                      ))
                ]else...[
                   TextButton(
                        onPressed: () {
                          print("Log Out");
                          FirebaseAuth.instance.signOut();
                          Navigator.pushNamed(context, MyRoute.home);
                        },
                        child: Text(
                          "LogOut",
                        )),
                ],
                         
                Builder(
                    builder: (context) => IconButton(
                        onPressed: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        icon: Icon(Icons.menu, color: Colors.black)))
              ],
            ),
            endDrawer: MyDrawer(),
            body: SingleChildScrollView(
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                },
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/background.jpg"),
                              fit: BoxFit.cover)),
                      child: StickyHeader(
                          header: Container(
                            margin: EdgeInsets.only(left: 10.0, top: 100.0),
                            height: 40.0,
                            width: double.infinity,
                            //top navbar button
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              children: [
                                /*Hotel Button*/
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: StadiumBorder(),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 10.0)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Hotel()));
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.hotel,
                                        color: Colors.white,
                                        size: 14.0,
                                      ),
                                      SizedBox(width: 5.0),
                                      Text("Hotel",
                                          style: TextStyle(color: Colors.white))
                                    ],
                                  ),
                                ),
                                SizedBox(width: 5.0),
                                /*Transport Button*/
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: StadiumBorder(),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 10.0)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => transport()));
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.taxi,
                                        color: Colors.white,
                                        size: 14.0,
                                      ),
                                      SizedBox(width: 5.0),
                                      Text("Transportation",
                                          style: TextStyle(color: Colors.white))
                                    ],
                                  ),
                                ),
                                SizedBox(width: 5.0),
                                /*Resturent Button*/
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: StadiumBorder(),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 10.0)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => resturent()));
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.utensils,
                                        color: Colors.white,
                                        size: 14.0,
                                      ),
                                      SizedBox(width: 5.0),
                                      Text("Resturant",
                                          style: TextStyle(color: Colors.white))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          content: Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.67,
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(height: 120),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: InkWell(
                                        child: IgnorePointer(
                                          child: TextField(
                                            style:
                                                TextStyle(color: Colors.black),
                                            decoration: InputDecoration(
                                                hintText:
                                                    "Search your destination",
                                                hintStyle: TextStyle(
                                                    color: Colors.black45),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    borderSide:
                                                        BorderSide.none),
                                                suffixIcon: Container(
                                                  child: Icon(Icons.search,
                                                      color: Colors.white),
                                                ),
                                                filled: true,
                                                fillColor: Colors.white54),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SearchPage()));
                                        },
                                      ),
                                    ),
                                    Expanded(child: Center())
                                  ]))),
                    ),
                    SizedBox(height: 10),
                    /*Explore More about District*/
                    StreamBuilder(
                        stream: districtStream,
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            print("Erroooooooooooooooor");
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          final List district = [];
                          snapshot.data!.docs.map((DocumentSnapshot e) {
                            Map dataList = e.data() as Map<String, dynamic>;
                            district.add(dataList);
                          }).toList();
                          return Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              children: List.generate(
                                  district.length,
                                  (index) => Container(
                                        margin: const EdgeInsets.only(
                                            left: 10.0, right: 10.0),
                                        width: 250,
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        singleDistrict(
                                                            // tabIndex: 0,
                                                            district:
                                                                district[index]
                                                                    ['ID'])));
                                          },
                                          child: Card(
                                            margin: EdgeInsets.only(bottom: 10),
                                            elevation: 4,
                                            clipBehavior: Clip.antiAlias,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0)),
                                            child: Stack(
                                              alignment: Alignment.bottomCenter,
                                              children: [
                                                Ink.image(
                                                    image: NetworkImage(
                                                        district[index]
                                                            ['image']),
                                                    // height: 180,
                                                    fit: BoxFit.cover),
                                                Center(
                                                    child: DecoratedBox(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white
                                                          .withAlpha(900)),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 8.0,
                                                        horizontal: 10.0),
                                                    child: RichText(
                                                      text: TextSpan(
                                                          text:
                                                              "Explore More In\n",
                                                          style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w500),
                                                          children: [
                                                            TextSpan(
                                                                text: district[
                                                                        index]
                                                                    ['name']),
                                                            TextSpan(
                                                                text:
                                                                    " Vallery")
                                                          ]),
                                                    ),
                                                  ),
                                                ))
                                              ],
                                            ),
                                          ),
                                        ),
                                      )).toList(),
                            ),
                          );
                        }),
                    /*Hotel*/
                    StreamBuilder(
                        stream: hotelStream,
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            print("Erroooooooooooooooor");
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          final List hotel = [];
                          snapshot.data!.docs.map((DocumentSnapshot e) {
                            Map hotelData = e.data() as Map<String, dynamic>;
                            hotel.add(hotelData);
                          }).toList();
                          return Column(
                            children: [
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  SizedBox(width: 10),
                                  Text("Hotels",
                                      style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      )),
                                  Expanded(child: Center()),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Hotel()));
                                      },
                                      child: Text(
                                        "View All",
                                      )),
                                  SizedBox(width: 10)
                                ],
                              ),
                              Container(
                                height: 230,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                          top: 10,
                                          child: Container(
                                            height: 200,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: ListView(
                                              scrollDirection: Axis.horizontal,
                                              physics: BouncingScrollPhysics(),
                                              children: List.generate(
                                                  hotel.length,
                                                  (index) => Container(
                                                        margin: const EdgeInsets
                                                            .only(right: 10.0),
                                                        width: 250,
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder: (context) => HotelView(
                                                                        index:
                                                                            1,
                                                                        id: hotel[index]
                                                                            [
                                                                            'ID'])));
                                                          },
                                                          child: Card(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 10.0,
                                                                    bottom: 10),
                                                            elevation: 4,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0)),
                                                            child: Stack(
                                                              alignment: Alignment
                                                                  .bottomLeft,
                                                              children: [
                                                                Ink.image(
                                                                    image: NetworkImage(
                                                                        hotel[index]
                                                                            [
                                                                            'image']),
                                                                    // height: 180,
                                                                    fit: BoxFit
                                                                        .cover),
                                                                Positioned(
                                                                  bottom: 10,
                                                                  left: 10,
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            4.8),
                                                                    child:
                                                                        BackdropFilter(
                                                                      filter: ImageFilter.blur(
                                                                          sigmaY:
                                                                              19.2,
                                                                          sigmaX:
                                                                              19.2),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(8.0),
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Icon(Icons.place_outlined,
                                                                                color: Colors.white),
                                                                            Text(hotel[index]['name'],
                                                                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      )).toList(),
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              )
                            ],
                          );
                        }),
                    /*Attractive Places*/
                    StreamBuilder(
                        stream: attractiveStream,
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            print("Erroooooooooooooooor");
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          final List destination = [];
                          snapshot.data!.docs.map((DocumentSnapshot e) {
                            Map hotelData = e.data() as Map<String, dynamic>;
                            destination.add(hotelData);
                          }).toList();
                          return Column(
                            children: [
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  SizedBox(width: 10),
                                  Text("Attractive Places",
                                      style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      )),
                                  Expanded(child: Center()),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AllDistinations()));
                                      },
                                      child: Text(
                                        "View All",
                                      )),
                                  SizedBox(width: 10)
                                ],
                              ),
                              Container(
                                height: 230,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                          top: 10,
                                          child: Container(
                                            height: 200,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: ListView(
                                              scrollDirection: Axis.horizontal,
                                              physics: BouncingScrollPhysics(),
                                              children: List.generate(
                                                  destination.length,
                                                  (index) => Container(
                                                        margin: const EdgeInsets
                                                            .only(right: 10.0),
                                                        width: 250,
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder: (context) =>
                                                                        ViewDistination(
                                                                            areaID:
                                                                                destination[index]['ID'])));
                                                          },
                                                          child: Card(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 10.0,
                                                                    bottom: 10),
                                                            elevation: 4,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0)),
                                                            child: Stack(
                                                              alignment: Alignment
                                                                  .bottomLeft,
                                                              children: [
                                                                Ink.image(
                                                                    image: NetworkImage(
                                                                        destination[index]
                                                                            [
                                                                            'image']),
                                                                    // height: 180,
                                                                    fit: BoxFit
                                                                        .cover),
                                                                Positioned(
                                                                  bottom: 10,
                                                                  left: 10,
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            4.8),
                                                                    child:
                                                                        BackdropFilter(
                                                                      filter: ImageFilter.blur(
                                                                          sigmaY:
                                                                              19.2,
                                                                          sigmaX:
                                                                              19.2),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(8.0),
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Icon(Icons.place_outlined,
                                                                                color: Colors.white),
                                                                            Text(destination[index]['name'],
                                                                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      )).toList(),
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              )
                            ],
                          );
                        }),
                    /*Resturent*/
                    StreamBuilder(
                        stream: resturantStream,
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            print("Erroooooooooooooooor");
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          final List resturant = [];
                          snapshot.data!.docs.map((DocumentSnapshot e) {
                            Map hotelData = e.data() as Map<String, dynamic>;
                            resturant.add(hotelData);
                          }).toList();
                          return Column(
                            children: [
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  SizedBox(width: 10),
                                  Text("Resturants",
                                      style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      )),
                                  Expanded(child: Center()),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    resturent()));
                                      },
                                      child: Text(
                                        "View All",
                                      )),
                                  SizedBox(width: 10)
                                ],
                              ),
                              Container(
                                height: 230,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                          top: 10,
                                          child: Container(
                                            height: 200,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: ListView(
                                              scrollDirection: Axis.horizontal,
                                              physics: BouncingScrollPhysics(),
                                              children: List.generate(
                                                  resturant.length,
                                                  (index) => Container(
                                                        margin: const EdgeInsets
                                                            .only(right: 10.0),
                                                        width: 250,
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder: (context) => HotelView(
                                                                        index:
                                                                            2,
                                                                        id: resturant[index]
                                                                            [
                                                                            'ID'])));
                                                          },
                                                          child: Card(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 10.0,
                                                                    bottom: 10),
                                                            elevation: 4,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0)),
                                                            child: Stack(
                                                              alignment: Alignment
                                                                  .bottomLeft,
                                                              children: [
                                                                Ink.image(
                                                                    image: NetworkImage(
                                                                        resturant[index]
                                                                            [
                                                                            'image']),
                                                                    // height: 180,
                                                                    fit: BoxFit
                                                                        .cover),
                                                                Positioned(
                                                                  bottom: 10,
                                                                  left: 10,
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            4.8),
                                                                    child:
                                                                        BackdropFilter(
                                                                      filter: ImageFilter.blur(
                                                                          sigmaY:
                                                                              19.2,
                                                                          sigmaX:
                                                                              19.2),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(8.0),
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Icon(Icons.place_outlined,
                                                                                color: Colors.white),
                                                                            Text(resturant[index]['name'],
                                                                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      )).toList(),
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              )
                            ],
                          );
                        }),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: footer(tabIndex: 0)));
  }
}

class test extends StatelessWidget {
  const test({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
         child: Row(
         children: [
           TextButton(
               onPressed: () {
                 Navigator.push(
                     context,
                     MaterialPageRoute(
                         builder: (context) => login()));
               },
               child: Text(
                 "Login",
               )),
           TextButton(
               onPressed: () {
                 Navigator.push(
                     context,
                     MaterialPageRoute(
                         builder: (context) => register()));
               },
               child: Text(
                 "Sign Up",
               )),
         ],
       ));
  }
}
