import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

import 'drawer.dart';
import 'hotel_view.dart';
import 'singleDistrict.dart';

class Hotel extends StatefulWidget {
  const Hotel({Key? key}) : super(key: key);

  @override
  _HotelState createState() => _HotelState();
}

// ignore: camel_case_types
class _HotelState extends State<Hotel> {
  @override
  Widget build(BuildContext context) {
    String swatID = "VOiZdZ1cERBF8gYRQebY";
    // String kumratID = "j1jcrpBK4X44Hzpo11Eo";
    String chitralID = "snhw3PT7gayj363xtCLq";
    final Stream<QuerySnapshot> _swatHotelsStream = FirebaseFirestore.instance
        .collection('hotel')
        .where("district", isEqualTo: swatID)
        .where('top_hotel', isEqualTo: true)
        .snapshots();
    // final Stream<QuerySnapshot> _kumratHotelStream = FirebaseFirestore.instance
    //     .collection('hotel')
    //     .where("district", isEqualTo: kumratID)
    //     .where('top_hotel', isEqualTo: true)
    //     .snapshots();
    final Stream<QuerySnapshot> _chitralHotelStream = FirebaseFirestore.instance
        .collection('hotel')
        .where("district", isEqualTo: chitralID)
        .where('top_hotel', isEqualTo: true)
        .snapshots();
    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text("Hotels", style: TextStyle(color: Colors.black)),
          centerTitle: true,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios_new, size: 16.0)),
        ),
        endDrawer: MyDrawer(),
        body: SingleChildScrollView(
          child: Container(
              child: StickyHeader(
            header: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 0.5,
                      blurRadius: 5,
                      offset: Offset(0, 0.1))
                ],
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //swat
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => singleDistrict(
                                    tabIndex: 1, district: swatID)));
                      },
                      child: Text(
                        "Swat Hotel",
                        style: TextStyle(color: Colors.blue),
                      )),
                  //kumrat
                  // InkWell(
                  //     onTap: () {
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => singleDistrict(
                  //                   tabIndex: 1, district: kumratID)));
                  //     },
                  //     child: Text(
                  //       "Kumrat Hotel",
                  //       style: TextStyle(color: Colors.blue),
                  //     )),
                  /*chirtal*/
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => singleDistrict(
                                    tabIndex: 1, district: chitralID)));
                      },
                      child: Text(
                        "Chitral Hotel",
                        style: TextStyle(color: Colors.blue),
                      ))
                ],
              ),
            ),
            content: Column(
              children: [
                //swat
                Row(
                  children: [
                    SizedBox(width: 10),
                    Text("Top Hotel In Swat",
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
                                  builder: (context) => singleDistrict(
                                      tabIndex: 1, district: swatID)));
                        },
                        child: Text(
                          "View All",
                        )),
                    SizedBox(width: 10)
                  ],
                ),
                StreamBuilder(
                  stream: _swatHotelsStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      print("something wrong");
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    final List swatHotelList = [];
                    snapshot.data!.docs.map((QueryDocumentSnapshot document) {
                      Map a = document.data() as Map<String, dynamic>;
                      swatHotelList.add(a);
                    }).toList();
                    return Container(
                      height: 230,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Stack(
                          children: [
                            Positioned(
                                top: 10,
                                child: Container(
                                  height: 200,
                                  width: MediaQuery.of(context).size.width,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    physics: BouncingScrollPhysics(),
                                    children: List.generate(
                                        swatHotelList.length,
                                        (index) => Container(
                                              margin: const EdgeInsets.only(
                                                  right: 10.0),
                                              width: 250,
                                              child: GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              HotelView(
                                                                  index: 1,
                                                                  id: swatHotelList[
                                                                          index]
                                                                      ['ID'])));
                                                },
                                                child: Card(
                                                  margin: EdgeInsets.only(
                                                      left: 10.0, bottom: 10),
                                                  elevation: 4,
                                                  clipBehavior: Clip.antiAlias,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0)),
                                                  child: Stack(
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    children: [
                                                      // Ink.image(
                                                      //     image: NetworkImage(
                                                      //         swatHotelList[
                                                      //                 index]
                                                      //             ['image']),
                                                      //     fit: BoxFit.cover),
                                                      CachedNetworkImage(
                                                        imageUrl:
                                                            swatHotelList[index]
                                                                ['image'],
                                                        imageBuilder: (context,
                                                                imageProvider) =>
                                                            Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            image:
                                                                DecorationImage(
                                                              image:
                                                                  imageProvider,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        placeholder: (context,
                                                                url) =>
                                                            CircularProgressIndicator(),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Icon(Icons.error),
                                                      ),
                                                      Positioned(
                                                        bottom: 10,
                                                        left: 10,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.8),
                                                          child: BackdropFilter(
                                                            filter: ImageFilter
                                                                .blur(
                                                                    sigmaY:
                                                                        19.2,
                                                                    sigmaX:
                                                                        19.2),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Row(
                                                                children: [
                                                                  Icon(
                                                                      Icons
                                                                          .place_outlined,
                                                                      color: Colors
                                                                          .white),
                                                                  Text(
                                                                      swatHotelList[
                                                                              index]
                                                                          [
                                                                          'name'],
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontWeight:
                                                                              FontWeight.w500)),
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
                    );
                  },
                ),
                SizedBox(height: 20),
                //kumrat
                // Row(
                //   children: [
                //     SizedBox(width: 10),
                //     Text("Top Hotel In Kumrat",
                //         style: GoogleFonts.roboto(
                //           fontWeight: FontWeight.w600,
                //           fontSize: 18,
                //         )),
                //     Expanded(child: Center()),
                //     TextButton(
                //         onPressed: () {
                //           Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                   builder: (context) => singleDistrict(
                //                       tabIndex: 1, district: kumratID)));
                //         },
                //         child: Text(
                //           "View All",
                //         )),
                //     SizedBox(width: 10)
                //   ],
                // ),
                // StreamBuilder(
                //   stream: _kumratHotelStream,
                //   builder: (BuildContext context,
                //       AsyncSnapshot<QuerySnapshot> snapshot) {
                //     if (snapshot.hasError) {
                //       print("something wrong");
                //     }
                //     if (snapshot.connectionState == ConnectionState.waiting) {
                //       return Center(child: CircularProgressIndicator());
                //     }
                //     final List swatHotelList = [];
                //     snapshot.data!.docs.map((QueryDocumentSnapshot document) {
                //       Map a = document.data() as Map<String, dynamic>;
                //       swatHotelList.add(a);
                //     }).toList();
                //     return Container(
                //       height: 230,
                //       child: Padding(
                //         padding: const EdgeInsets.only(bottom: 10.0),
                //         child: Stack(
                //           children: [
                //             Positioned(
                //                 top: 10,
                //                 child: Container(
                //                   height: 200,
                //                   width: MediaQuery.of(context).size.width,
                //                   child: ListView(
                //                     scrollDirection: Axis.horizontal,
                //                     physics: BouncingScrollPhysics(),
                //                     children: List.generate(
                //                         swatHotelList.length,
                //                         (index) => Container(
                //                               margin: const EdgeInsets.only(
                //                                   right: 10.0),
                //                               width: 250,
                //                               child: GestureDetector(
                //                                 onTap: () {
                //                                   Navigator.push(
                //                                       context,
                //                                       MaterialPageRoute(
                //                                           builder: (context) =>
                //                                               HotelView(
                //                                                   index: 1,
                //                                                   id: swatHotelList[
                //                                                           index]
                //                                                       ['ID'])));
                //                                 },
                //                                 child: Card(
                //                                   margin: EdgeInsets.only(
                //                                       left: 10.0, bottom: 10),
                //                                   elevation: 4,
                //                                   clipBehavior: Clip.antiAlias,
                //                                   shape: RoundedRectangleBorder(
                //                                       borderRadius:
                //                                           BorderRadius.circular(
                //                                               5.0)),
                //                                   child: Stack(
                //                                     alignment:
                //                                         Alignment.bottomLeft,
                //                                     children: [
                //                                       // Ink.image(
                //                                       //     image: NetworkImage(
                //                                       //         swatHotelList[
                //                                       //                 index]
                //                                       //             ['image']),
                //                                       //     fit: BoxFit.cover),
                //                                       CachedNetworkImage(
                //                                         imageUrl:
                //                                             swatHotelList[index]
                //                                                 ['image'],
                //                                         imageBuilder: (context,
                //                                                 imageProvider) =>
                //                                             Container(
                //                                           decoration:
                //                                               BoxDecoration(
                //                                             image:
                //                                                 DecorationImage(
                //                                               image:
                //                                                   imageProvider,
                //                                               fit: BoxFit.cover,
                //                                             ),
                //                                           ),
                //                                         ),
                //                                         placeholder: (context,
                //                                                 url) =>
                //                                             CircularProgressIndicator(),
                //                                         errorWidget: (context,
                //                                                 url, error) =>
                //                                             Icon(Icons.error),
                //                                       ),
                //                                       Positioned(
                //                                         bottom: 10,
                //                                         left: 10,
                //                                         child: ClipRRect(
                //                                           borderRadius:
                //                                               BorderRadius
                //                                                   .circular(
                //                                                       4.8),
                //                                           child: BackdropFilter(
                //                                             filter: ImageFilter
                //                                                 .blur(
                //                                                     sigmaY:
                //                                                         19.2,
                //                                                     sigmaX:
                //                                                         19.2),
                //                                             child: Padding(
                //                                               padding:
                //                                                   const EdgeInsets
                //                                                       .all(8.0),
                //                                               child: Row(
                //                                                 children: [
                //                                                   Icon(
                //                                                       Icons
                //                                                           .place_outlined,
                //                                                       color: Colors
                //                                                           .white),
                //                                                   Text(
                //                                                       swatHotelList[
                //                                                               index]
                //                                                           [
                //                                                           'name'],
                //                                                       style: TextStyle(
                //                                                           color: Colors
                //                                                               .white,
                //                                                           fontWeight:
                //                                                               FontWeight.w500)),
                //                                                 ],
                //                                               ),
                //                                             ),
                //                                           ),
                //                                         ),
                //                                       )
                //                                     ],
                //                                   ),
                //                                 ),
                //                               ),
                //                             )).toList(),
                //                   ),
                //                 ))
                //           ],
                //         ),
                //       ),
                //     );
                //   },
                // ),
                // SizedBox(height: 20),
                /*chitral*/
                Row(
                  children: [
                    SizedBox(width: 10),
                    Text("Top Hotel In Chitral",
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
                                  builder: (context) => singleDistrict(
                                      tabIndex: 1, district: chitralID)));
                        },
                        child: Text(
                          "View All",
                        )),
                    SizedBox(width: 10)
                  ],
                ),
                StreamBuilder(
                  stream: _chitralHotelStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      print("something wrong");
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    final List chitralHotelList = [];
                    snapshot.data!.docs.map((QueryDocumentSnapshot document) {
                      Map a = document.data() as Map<String, dynamic>;
                      chitralHotelList.add(a);
                    }).toList();
                    return Container(
                      height: 230,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Stack(
                          children: [
                            Positioned(
                                top: 10,
                                child: Container(
                                  height: 200,
                                  width: MediaQuery.of(context).size.width,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    physics: BouncingScrollPhysics(),
                                    children: List.generate(
                                        chitralHotelList.length,
                                        (index) => Container(
                                              margin: const EdgeInsets.only(
                                                  right: 10.0),
                                              width: 250,
                                              child: GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              HotelView(
                                                                  index: 1,
                                                                  id: chitralHotelList[
                                                                          index]
                                                                      ['ID'])));
                                                },
                                                child: Card(
                                                  margin: EdgeInsets.only(
                                                      left: 10.0, bottom: 10),
                                                  elevation: 4,
                                                  clipBehavior: Clip.antiAlias,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0)),
                                                  child: Stack(
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    children: [
                                                      // Ink.image(
                                                      //     image: NetworkImage(
                                                      //         chitralHotelList[
                                                      //                 index]
                                                      //             ['image']),
                                                      //     fit: BoxFit.cover),
                                                      CachedNetworkImage(
                                                        imageUrl:
                                                            chitralHotelList[
                                                                index]['image'],
                                                        imageBuilder: (context,
                                                                imageProvider) =>
                                                            Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            image:
                                                                DecorationImage(
                                                              image:
                                                                  imageProvider,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        placeholder: (context,
                                                                url) =>
                                                            CircularProgressIndicator(),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Icon(Icons.error),
                                                      ),
                                                      Positioned(
                                                        bottom: 10,
                                                        left: 10,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.8),
                                                          child: BackdropFilter(
                                                            filter: ImageFilter
                                                                .blur(
                                                                    sigmaY:
                                                                        19.2,
                                                                    sigmaX:
                                                                        19.2),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Row(
                                                                children: [
                                                                  Icon(
                                                                      Icons
                                                                          .place_outlined,
                                                                      color: Colors
                                                                          .white),
                                                                  Text(
                                                                      chitralHotelList[
                                                                              index]
                                                                          [
                                                                          'name'],
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontWeight:
                                                                              FontWeight.w500)),
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
                    );
                  },
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
