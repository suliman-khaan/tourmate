import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'attribute_view.dart';
import 'best_distination_attribute_container.dart';
import 'footer.dart';
import 'hotel_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: unused_import
import 'all_distination.dart';
import 'drawer.dart';

class ViewDistination extends StatefulWidget {
  const ViewDistination({Key? key, required this.areaID}) : super(key: key);
  final String areaID;
  @override
  _ViewDistinationState createState() => _ViewDistinationState();
}

class _ViewDistinationState extends State<ViewDistination> {
  @override
  Widget build(BuildContext context1) {
    var area = widget.areaID.trim();
    // var bestDestination = widget.bdID;
    final Stream<QuerySnapshot> viewDistination = FirebaseFirestore.instance
        .collection('Areas')
        .where("ID", isEqualTo: area)
        .snapshots();
    final Stream<QuerySnapshot> viewHotels = FirebaseFirestore.instance
        .collection("hotel")
        .where("best_destination", isEqualTo: area)
        .snapshots();
    final Stream<QuerySnapshot> viewRestaurants = FirebaseFirestore.instance
        .collection('Resturents')
        .where("best_destination", isEqualTo: area)
        .snapshots();
    final Stream<QuerySnapshot> viewEvents = FirebaseFirestore.instance
        .collection('Events')
        .where("best_destination", isEqualTo: area)
        .snapshots();
    final Stream<QuerySnapshot> viewParks = FirebaseFirestore.instance
        .collection('Parks')
        .where("best_destination", isEqualTo: area)
        .snapshots();
    final Stream<QuerySnapshot> viewEntertainments = FirebaseFirestore.instance
        .collection('Entertainment')
        .where("best_destination", isEqualTo: area)
        .snapshots();
    // final Stream<QuerySnapshot> viewHotels = FirebaseFirestore.instance.collection('hotel').where("bestDistination",isEqualTo: widget.myindex).snapshots();
    // final Stream<QuerySnapshot> viewHotelList = FirebaseFirestore.instance.collection('hotel').where("bestDistination",isEqualTo: widget.myindex).snapshots();
    return StreamBuilder(
        stream: viewDistination,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print("Something Went Wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final List viewDistination = [];
          snapshot.data!.docs.map((DocumentSnapshot documet) {
            Map a = documet.data() as Map<String, dynamic>;
            viewDistination.add(a);
          }).toList();
          return Material(
            child: Container(
              child: Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  centerTitle: true,
                  iconTheme: IconThemeData(color: Colors.black),
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      size: 16,
                    ),
                    onPressed: () {
                      Navigator.pop(context1);
                    },
                  ),
                  title: Text(viewDistination[0]["name"],
                      style: GoogleFonts.roboto(
                          color: Colors.black, fontSize: 15)),
                  // title: Text(
                  //   "Historical Areas in Swat",
                  //   style: GoogleFonts.roboto(color: Colors.black,fontSize: 15)
                  // ),
                ),
                body: SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                    child: Column(
                      children: [
                        Hero(
                          tag:
                              "background:${viewDistination[0]['ID'].toString()}",
                          child: GestureDetector(
                            onTap: () =>
                                print(viewDistination[0]['ID'].toString()),
                            child: CachedNetworkImage(
                              imageUrl: viewDistination[0]['image'],
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
                        ),
                        SizedBox(height: 20),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      viewDistination[0]["name"],
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                //  Description

                                Text(viewDistination[0]['description']),

                                SizedBox(
                                  height: 20,
                                ),
                                // BUtton
                                // ignore: deprecated_member_use
                                RaisedButton.icon(
                                    color: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.place_outlined,
                                      color: Colors.white,
                                    ),
                                    label: Text(
                                      "Get Direction",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    )),
                              ]),
                        ),
                        SizedBox(height: 20),
                        // Restaurants
                        StreamBuilder(
                          stream: viewRestaurants,
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              print("Something Went Wrong");
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            final List restaurantList = [];
                            snapshot.data!.docs
                                .map((DocumentSnapshot document) {
                              Map aa = document.data() as Map<String, dynamic>;
                              restaurantList.add(aa);
                            }).toList();
                            if (restaurantList.isEmpty) {
                              return Container(width: 0, height: 0);
                            } else {
                              return Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Restaurants",
                                              style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18,
                                              )),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            BestDistinationAttributeContainer(
                                                                areaIndex: 2,
                                                                id: area)));
                                              },
                                              child: Text("See All")),
                                        ],
                                      ),
                                      Container(
                                        height: 200,
                                        child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          children: List.generate(
                                              restaurantList.length,
                                              (int index) => Container(
                                                    width: 250,
                                                    margin: EdgeInsets.only(
                                                        right: 10),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      // border: Border.all(color: Colors.grey)
                                                    ),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) => HotelView(
                                                                    id: restaurantList[
                                                                            index]
                                                                        ['ID'],
                                                                    index: 2)));
                                                      },
                                                      child: Card(
                                                        elevation: 4,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                        ),
                                                        child: Stack(
                                                          alignment: Alignment
                                                              .bottomLeft,
                                                          children: [
                                                            // Image.network(
                                                            //   restaurantList[
                                                            //           index]
                                                            //       ['image'],
                                                            //   fit: BoxFit.cover,
                                                            //   height: double
                                                            //       .infinity,
                                                            //   width: double
                                                            //       .infinity,
                                                            // ),
                                                            CachedNetworkImage(
                                                              imageUrl:
                                                                  restaurantList[
                                                                          index]
                                                                      ['image'],
                                                              height: double
                                                                  .infinity,
                                                              width: double
                                                                  .infinity,
                                                              imageBuilder:
                                                                  (context,
                                                                          imageProvider) =>
                                                                      Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  image:
                                                                      DecorationImage(
                                                                    image:
                                                                        imageProvider,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                              placeholder: (context,
                                                                      url) =>
                                                                  Center(
                                                                      child:
                                                                          CircularProgressIndicator()),
                                                              errorWidget:
                                                                  (context, url,
                                                                          error) =>
                                                                      Center(
                                                                child: Icon(
                                                                    Icons
                                                                        .error),
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .fromLTRB(10,
                                                                      0, 0, 10),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4.8),
                                                                child:
                                                                    BackdropFilter(
                                                                  filter: ImageFilter.blur(
                                                                      sigmaX:
                                                                          19.2,
                                                                      sigmaY:
                                                                          19.2),
                                                                  child:
                                                                      Container(
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          Text(
                                                                        restaurantList[index]
                                                                            [
                                                                            'name'],
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight: FontWeight.w500),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  )),
                                        ),
                                      ),
                                    ],
                                  ));
                            }
                          },
                        ),
                        SizedBox(height: 10),
                        // Hotels
                        StreamBuilder(
                          stream: viewHotels,
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              print("Something Went Wrong");
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            final List hotelsList = [];
                            snapshot.data!.docs
                                .map((DocumentSnapshot document) {
                              Map aa = document.data() as Map<String, dynamic>;
                              hotelsList.add(aa);
                            }).toList();
                            if (hotelsList.isEmpty) {
                              return Container(
                                height: 0,
                                width: 0,
                              );
                            } else {
                              return Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  child: Column(
                                    children: [
                                      //
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Hotels",
                                              style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18,
                                              )),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            BestDistinationAttributeContainer(
                                                                areaIndex: 1,
                                                                id: area)));
                                              },
                                              child: Text("See All")),
                                        ],
                                      ),
                                      Container(
                                        height: 200,
                                        child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          children: List.generate(
                                              hotelsList.length,
                                              (int index) => Container(
                                                    width: 250,
                                                    margin: EdgeInsets.only(
                                                        right: 10),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) => HotelView(
                                                                    index: 1,
                                                                    id: hotelsList[
                                                                            index]
                                                                        [
                                                                        'ID'])));
                                                      },
                                                      child: Card(
                                                        elevation: 4,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                        ),
                                                        child: Stack(
                                                          alignment: Alignment
                                                              .bottomLeft,
                                                          children: [
                                                            // Image.network(
                                                            //   hotelsList[index]
                                                            //       ['image'],
                                                            //   fit: BoxFit.cover,
                                                            //   height: double
                                                            //       .infinity,
                                                            //   width: double
                                                            //       .infinity,
                                                            // ),
                                                            CachedNetworkImage(
                                                              imageUrl:
                                                                  hotelsList[
                                                                          index]
                                                                      ['image'],
                                                              height: double
                                                                  .infinity,
                                                              width: double
                                                                  .infinity,
                                                              imageBuilder:
                                                                  (context,
                                                                          imageProvider) =>
                                                                      Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  image:
                                                                      DecorationImage(
                                                                    image:
                                                                        imageProvider,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                              placeholder: (context,
                                                                      url) =>
                                                                  Center(
                                                                      child:
                                                                          CircularProgressIndicator()),
                                                              errorWidget:
                                                                  (context, url,
                                                                          error) =>
                                                                      Center(
                                                                child: Icon(
                                                                    Icons
                                                                        .error),
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .fromLTRB(10,
                                                                      0, 0, 10),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4.8),
                                                                child:
                                                                    BackdropFilter(
                                                                  filter: ImageFilter.blur(
                                                                      sigmaX:
                                                                          19.2,
                                                                      sigmaY:
                                                                          19.2),
                                                                  child:
                                                                      Container(
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          Text(
                                                                        hotelsList[index]
                                                                            [
                                                                            'name'],
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight: FontWeight.w500),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  )),
                                        ),
                                      ),
                                    ],
                                  ));
                            }
                          },
                        ),
                        // Events
                        SizedBox(height: 10),
                        StreamBuilder<QuerySnapshot>(
                          stream: viewEvents,
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              print("Something went Wrong");
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            final eventsList = [];
                            snapshot.data!.docs
                                .map((QueryDocumentSnapshot document) {
                              Map a = document.data() as Map<String, dynamic>;
                              eventsList.add(a);
                            }).toList();
                            if (eventsList.isEmpty) {
                              return Container(
                                width: 0,
                                height: 0,
                              );
                            } else {
                              return Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  child: Column(
                                    children: [
                                      //
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Events",
                                              style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18,
                                              )),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            BestDistinationAttributeContainer(
                                                                areaIndex: 3,
                                                                id: area)));
                                              },
                                              child: Text("See All")),
                                        ],
                                      ),
                                      Container(
                                        height: 200,
                                        child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          children: List.generate(
                                              eventsList.length,
                                              (int index) => Container(
                                                    width: 250,
                                                    margin: EdgeInsets.only(
                                                        right: 10),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      // border: Border.all(color: Colors.grey)
                                                    ),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) => DistrictAttributeContainer(
                                                                    areaIndex:
                                                                        6,
                                                                    a_id: eventsList[
                                                                            index]
                                                                        [
                                                                        'ID'])));
                                                      },
                                                      child: Card(
                                                        elevation: 4,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                        ),
                                                        child: Stack(
                                                          alignment: Alignment
                                                              .bottomLeft,
                                                          children: [
                                                            // Image.network(
                                                            //   eventsList[index]
                                                            //       ['image'],
                                                            //   fit: BoxFit.cover,
                                                            //   height: double
                                                            //       .infinity,
                                                            //   width: double
                                                            //       .infinity,
                                                            // ),
                                                            CachedNetworkImage(
                                                              imageUrl:
                                                                  eventsList[
                                                                          index]
                                                                      ['image'],
                                                              height: double
                                                                  .infinity,
                                                              width: double
                                                                  .infinity,
                                                              imageBuilder:
                                                                  (context,
                                                                          imageProvider) =>
                                                                      Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  image:
                                                                      DecorationImage(
                                                                    image:
                                                                        imageProvider,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                              placeholder: (context,
                                                                      url) =>
                                                                  Center(
                                                                      child:
                                                                          CircularProgressIndicator()),
                                                              errorWidget:
                                                                  (context, url,
                                                                          error) =>
                                                                      Center(
                                                                child: Icon(
                                                                    Icons
                                                                        .error),
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .fromLTRB(10,
                                                                      0, 0, 10),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4.8),
                                                                child:
                                                                    BackdropFilter(
                                                                  filter: ImageFilter.blur(
                                                                      sigmaX:
                                                                          19.2,
                                                                      sigmaY:
                                                                          19.2),
                                                                  child:
                                                                      Container(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            5,
                                                                        vertical:
                                                                            4),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          Text(
                                                                        eventsList[index]
                                                                            [
                                                                            'name'],
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight: FontWeight.w500),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  )),
                                        ),
                                      ),
                                    ],
                                  ));
                            }
                          },
                        ),
                        //  Entertainments
                        SizedBox(height: 10),
                        StreamBuilder<QuerySnapshot>(
                          stream: viewEntertainments,
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              print("Something went Wrong");
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            final entertainmentsList = [];
                            snapshot.data!.docs
                                .map((QueryDocumentSnapshot document) {
                              Map a = document.data() as Map<String, dynamic>;
                              entertainmentsList.add(a);
                            }).toList();
                            if (entertainmentsList.isEmpty) {
                              return Container(
                                width: 0,
                                height: 0,
                              );
                            } else {
                              return Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  child: Column(
                                    children: [
                                      //
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Entertainments",
                                              style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18,
                                              )),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            BestDistinationAttributeContainer(
                                                                areaIndex: 4,
                                                                id: area)));
                                              },
                                              child: Text("See All")),
                                        ],
                                      ),
                                      Container(
                                        height: 200,
                                        // width: 300,
                                        child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          children: List.generate(
                                              entertainmentsList.length,
                                              (int index) => Container(
                                                    width: 250,
                                                    margin: EdgeInsets.only(
                                                        right: 10),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      // border: Border.all(color: Colors.grey)
                                                    ),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) => DistrictAttributeContainer(
                                                                    areaIndex:
                                                                        7,
                                                                    a_id: entertainmentsList[
                                                                            index]
                                                                        [
                                                                        'ID'])));
                                                      },
                                                      child: Card(
                                                        elevation: 4,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                        ),
                                                        child: Stack(
                                                          alignment: Alignment
                                                              .bottomLeft,
                                                          children: [
                                                            // Image.network(
                                                            //   entertainmentsList[
                                                            //       index]['image'],
                                                            //   fit: BoxFit.cover,
                                                            //   height:
                                                            //       double.infinity,
                                                            //   width:
                                                            //       double.infinity,
                                                            // ),
                                                            CachedNetworkImage(
                                                              imageUrl:
                                                                  entertainmentsList[
                                                                          index]
                                                                      ['image'],
                                                              height: double
                                                                  .infinity,
                                                              width: double
                                                                  .infinity,
                                                              imageBuilder:
                                                                  (context,
                                                                          imageProvider) =>
                                                                      Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  image:
                                                                      DecorationImage(
                                                                    image:
                                                                        imageProvider,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                              placeholder: (context,
                                                                      url) =>
                                                                  Center(
                                                                      child:
                                                                          CircularProgressIndicator()),
                                                              errorWidget:
                                                                  (context, url,
                                                                          error) =>
                                                                      Center(
                                                                child: Icon(
                                                                    Icons
                                                                        .error),
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .fromLTRB(10,
                                                                      0, 0, 10),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4.8),
                                                                child:
                                                                    BackdropFilter(
                                                                  filter: ImageFilter.blur(
                                                                      sigmaX:
                                                                          19.2,
                                                                      sigmaY:
                                                                          19.2),
                                                                  child:
                                                                      Container(
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          Text(
                                                                        entertainmentsList[index]
                                                                            [
                                                                            'name'],
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight: FontWeight.w500),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  )),
                                        ),
                                      ),
                                    ],
                                  ));
                            }
                          },
                        ),
                        // parks
                        SizedBox(height: 10),
                        StreamBuilder<QuerySnapshot>(
                          stream: viewParks,
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              print("Something went Wrong");
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            final parksList = [];
                            snapshot.data!.docs
                                .map((QueryDocumentSnapshot document) {
                              Map a = document.data() as Map<String, dynamic>;
                              parksList.add(a);
                            }).toList();
                            if (parksList.isEmpty) {
                              return Container(
                                width: 0,
                                height: 0,
                              );
                            } else {
                              return Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  child: Column(
                                    children: [
                                      //
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Parks",
                                              style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18,
                                              )),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            BestDistinationAttributeContainer(
                                                                areaIndex: 5,
                                                                id: area)));
                                              },
                                              child: Text("See All")),
                                        ],
                                      ),
                                      Container(
                                        // width: double.infinity,
                                        // decoration: BoxDecoration(
                                        //   border: Border.all(color: Colors.black)
                                        // ),
                                        height: 200,
                                        child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          children: List.generate(
                                              parksList.length,
                                              (int index) => Container(
                                                    width: 250,
                                                    margin: EdgeInsets.only(
                                                        right: 10),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      // border: Border.all(color: Colors.grey)
                                                    ),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) => HotelView(
                                                                    id: parksList[
                                                                            index]
                                                                        ['ID'],
                                                                    index: 3)));
                                                      },
                                                      child: Card(
                                                        elevation: 4,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                        ),
                                                        child: Stack(
                                                          alignment: Alignment
                                                              .bottomLeft,
                                                          children: [
                                                            // Image.network(
                                                            //   parksList[index]
                                                            //       ["image"],
                                                            //   fit: BoxFit.cover,
                                                            //   height: double
                                                            //       .infinity,
                                                            //   width: double
                                                            //       .infinity,
                                                            // ),
                                                            CachedNetworkImage(
                                                              imageUrl:
                                                                  parksList[
                                                                          index]
                                                                      ['image'],
                                                              height: double
                                                                  .infinity,
                                                              width: double
                                                                  .infinity,
                                                              imageBuilder:
                                                                  (context,
                                                                          imageProvider) =>
                                                                      Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  image:
                                                                      DecorationImage(
                                                                    image:
                                                                        imageProvider,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                              placeholder: (context,
                                                                      url) =>
                                                                  Center(
                                                                      child:
                                                                          CircularProgressIndicator()),
                                                              errorWidget:
                                                                  (context, url,
                                                                          error) =>
                                                                      Center(
                                                                child: Icon(
                                                                    Icons
                                                                        .error),
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .fromLTRB(10,
                                                                      0, 0, 10),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4.8),
                                                                child:
                                                                    BackdropFilter(
                                                                  filter: ImageFilter.blur(
                                                                      sigmaX:
                                                                          19.2,
                                                                      sigmaY:
                                                                          19.2),
                                                                  child:
                                                                      Container(
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          Text(
                                                                        parksList[index]
                                                                            [
                                                                            "name"],
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight: FontWeight.w500),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  )),
                                        ),
                                      ),
                                    ],
                                  ));
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                endDrawer: MyDrawer(),
                bottomNavigationBar: footer(),
              ),
            ),
          );
        });
  }
}
