// import 'dart:html';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tourmate1/singleTraspComp.dart';
import 'footer.dart';
import 'singleTransport.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sticky_headers/sticky_headers.dart';

import 'drawer.dart';
import 'singleDistrict.dart';

// ignore: camel_case_types
class transport extends StatefulWidget {
  const transport({Key? key}) : super(key: key);

  @override
  _transportState createState() => _transportState();
}

// ignore: camel_case_types
class _transportState extends State<transport> {
  @override
  Widget build(BuildContext context) {
    String swatID = "VOiZdZ1cERBF8gYRQebY";
    String chitralID = "snhw3PT7gayj363xtCLq";
    final Stream<QuerySnapshot> _swatTransportStream = FirebaseFirestore
        .instance
        .collection('Transport')
        .where("district", isEqualTo: swatID)
        .snapshots();
    // final Stream<QuerySnapshot> _kumratTransportStream = FirebaseFirestore
    //     .instance
    //     .collection('Transport')
    //     .where("district", isEqualTo: kumratID)
    //     .snapshots();
    final Stream<QuerySnapshot> _chitralTransportStream = FirebaseFirestore
        .instance
        .collection('Transport')
        .where("district", isEqualTo: chitralID)
        .snapshots();
    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Transportations", style: TextStyle(color: Colors.black)),
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
                                    tabIndex: 3, district: swatID)));
                      },
                      child: Text(
                        "Swat Transport",
                        style: TextStyle(color: Colors.blue),
                      )),
                  //kumrat
                  // InkWell(
                  //     onTap: () {
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => singleDistrict(
                  //                   tabIndex: 3, district: kumratID)));
                  //     },
                  //     child: Text(
                  //       "Kumrat Transport",
                  //       style: TextStyle(color: Colors.blue),
                  //     )),
                  /*chitral*/
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => singleDistrict(
                                    tabIndex: 3, district: chitralID)));
                      },
                      child: Text(
                        "Chitral Transport",
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
                    Text("Transports In Swat",
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
                                      tabIndex: 3, district: swatID)));
                        },
                        child: Text(
                          "View All",
                        )),
                    SizedBox(width: 10)
                  ],
                ),
                StreamBuilder(
                    stream: _swatTransportStream,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        print("something wrong");
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      final List swatTransportList = [];
                      snapshot.data!.docs.map((QueryDocumentSnapshot document) {
                        Map a = document.data() as Map<String, dynamic>;
                        swatTransportList.add(a);
                      }).toList();
                      return Container(
                        height: 230,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, bottom: 10.0),
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
                                          swatTransportList.length,
                                          (index) => Container(
                                                margin: const EdgeInsets.only(
                                                    right: 10.0),
                                                width: 250,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    if (swatTransportList[index]
                                                            ["local"] ==
                                                        false) {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  compSingle(
                                                                      local:
                                                                          false,
                                                                      dist:
                                                                          swatID)));
                                                    } else {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  singleTransport(
                                                                      id: swatTransportList[
                                                                              index]
                                                                          [
                                                                          'ID'])));
                                                    }
                                                  },
                                                  child: Card(
                                                    margin: EdgeInsets.only(
                                                        bottom: 10),
                                                    elevation: 4,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0)),
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      children: [
                                                        // Image(
                                                        //     image: NetworkImage(
                                                        //         swatTransportList[
                                                        //                 index]
                                                        //             ["image"]),
                                                        //     fit: BoxFit.cover),
                                                        CachedNetworkImage(
                                                          imageUrl:
                                                              swatTransportList[
                                                                      index]
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
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              Center(
                                                                  child: Icon(Icons
                                                                      .error)),
                                                        ),
                                                        Positioned(
                                                          bottom: 10,
                                                          left: 10,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.8),
                                                            child:
                                                                BackdropFilter(
                                                              filter: ImageFilter
                                                                  .blur(
                                                                      sigmaY:
                                                                          19.2,
                                                                      sigmaX:
                                                                          19.2),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: Row(
                                                                  children: [
                                                                    Icon(
                                                                        Icons
                                                                            .place_outlined,
                                                                        color: Colors
                                                                            .white),
                                                                    Text(
                                                                        swatTransportList[index]
                                                                            [
                                                                            "name"],
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight: FontWeight.w500)),
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
                    }),
                //kumrat
                // Row(
                //   children: [
                //     SizedBox(width: 10),
                //     Text("Transports In Kumrat",
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
                //                       tabIndex: 3, district: kumratID)));
                //         },
                //         child: Text(
                //           "View All",
                //         )),
                //     SizedBox(width: 10)
                //   ],
                // ),
                // StreamBuilder(
                //     stream: _kumratTransportStream,
                //     builder: (BuildContext context,
                //         AsyncSnapshot<QuerySnapshot> snapshot) {
                //       if (snapshot.hasError) {
                //         print("something wrong");
                //       }
                //       if (snapshot.connectionState == ConnectionState.waiting) {
                //         return Center(child: CircularProgressIndicator());
                //       }
                //       final List kumratTransportList = [];
                //       snapshot.data!.docs.map((QueryDocumentSnapshot document) {
                //         Map a = document.data() as Map<String, dynamic>;
                //         kumratTransportList.add(a);
                //       }).toList();
                //       return Container(
                //         height: 230,
                //         child: Padding(
                //           padding:
                //               const EdgeInsets.only(left: 10.0, bottom: 10.0),
                //           child: Stack(
                //             children: [
                //               Positioned(
                //                   top: 10,
                //                   child: Container(
                //                     height: 200,
                //                     width: MediaQuery.of(context).size.width,
                //                     child: ListView(
                //                       scrollDirection: Axis.horizontal,
                //                       physics: BouncingScrollPhysics(),
                //                       children: List.generate(
                //                           kumratTransportList.length,
                //                           (index) => Container(
                //                                 margin: const EdgeInsets.only(
                //                                     right: 10.0),
                //                                 width: 250,
                //                                 child: GestureDetector(
                //                                   onTap: () {
                //                                     Navigator.push(
                //                                         context,
                //                                         MaterialPageRoute(
                //                                             builder: (context) =>
                //                                                 singleTransport(
                //                                                     id: kumratTransportList[
                //                                                             index]
                //                                                         [
                //                                                         'ID'])));
                //                                   },
                //                                   child: Card(
                //                                     margin: EdgeInsets.only(
                //                                         bottom: 10),
                //                                     elevation: 4,
                //                                     clipBehavior:
                //                                         Clip.antiAlias,
                //                                     shape:
                //                                         RoundedRectangleBorder(
                //                                             borderRadius:
                //                                                 BorderRadius
                //                                                     .circular(
                //                                                         5.0)),
                //                                     child: Stack(
                //                                       alignment:
                //                                           Alignment.bottomLeft,
                //                                       children: [
                //                                         // Image(
                //                                         //     image: NetworkImage(
                //                                         //         kumratTransportList[
                //                                         //                 index]
                //                                         //             ["image"]),
                //                                         //     fit: BoxFit.cover),
                //                                         CachedNetworkImage(
                //                                           imageUrl:
                //                                               kumratTransportList[
                //                                                       index]
                //                                                   ['image'],
                //                                           imageBuilder: (context,
                //                                                   imageProvider) =>
                //                                               Container(
                //                                             decoration:
                //                                                 BoxDecoration(
                //                                               image:
                //                                                   DecorationImage(
                //                                                 image:
                //                                                     imageProvider,
                //                                                 fit: BoxFit
                //                                                     .cover,
                //                                               ),
                //                                             ),
                //                                           ),
                //                                           placeholder: (context,
                //                                                   url) =>
                //                                               CircularProgressIndicator(),
                //                                           errorWidget: (context,
                //                                                   url, error) =>
                //                                               Icon(Icons.error),
                //                                         ),
                //                                         Positioned(
                //                                           bottom: 10,
                //                                           left: 10,
                //                                           child: ClipRRect(
                //                                             borderRadius:
                //                                                 BorderRadius
                //                                                     .circular(
                //                                                         4.8),
                //                                             child:
                //                                                 BackdropFilter(
                //                                               filter: ImageFilter
                //                                                   .blur(
                //                                                       sigmaY:
                //                                                           19.2,
                //                                                       sigmaX:
                //                                                           19.2),
                //                                               child: Padding(
                //                                                 padding:
                //                                                     const EdgeInsets
                //                                                             .all(
                //                                                         8.0),
                //                                                 child: Row(
                //                                                   children: [
                //                                                     Icon(
                //                                                         Icons
                //                                                             .place_outlined,
                //                                                         color: Colors
                //                                                             .white),
                //                                                     Text(
                //                                                         kumratTransportList[index]
                //                                                             [
                //                                                             "name"],
                //                                                         style: TextStyle(
                //                                                             color:
                //                                                                 Colors.white,
                //                                                             fontWeight: FontWeight.w500)),
                //                                                   ],
                //                                                 ),
                //                                               ),
                //                                             ),
                //                                           ),
                //                                         )
                //                                       ],
                //                                     ),
                //                                   ),
                //                                 ),
                //                               )).toList(),
                //                     ),
                //                   ))
                //             ],
                //           ),
                //         ),
                //       );
                //     }),
                /*chitral*/
                Row(
                  children: [
                    SizedBox(width: 10),
                    Text("Transports In Chitral",
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
                                      tabIndex: 3, district: chitralID)));
                        },
                        child: Text(
                          "View All",
                        )),
                    SizedBox(width: 10)
                  ],
                ),
                StreamBuilder(
                    stream: _chitralTransportStream,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        print("something wrong");
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      final List swatTransportList = [];
                      snapshot.data!.docs.map((QueryDocumentSnapshot document) {
                        Map a = document.data() as Map<String, dynamic>;
                        swatTransportList.add(a);
                      }).toList();
                      return Container(
                        height: 230,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, bottom: 10.0),
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
                                          swatTransportList.length,
                                          (index) => Container(
                                                margin: const EdgeInsets.only(
                                                    right: 10.0),
                                                width: 250,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    if (swatTransportList[index]
                                                            ["local"] ==
                                                        false) {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  compSingle(
                                                                      local:
                                                                          false,
                                                                      dist:
                                                                          chitralID)));
                                                    } else {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  singleTransport(
                                                                      id: swatTransportList[
                                                                              index]
                                                                          [
                                                                          'ID'])));
                                                    }
                                                  },
                                                  child: Card(
                                                    margin: EdgeInsets.only(
                                                        bottom: 10),
                                                    elevation: 4,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0)),
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      children: [
                                                        // Image(
                                                        //     image: NetworkImage(
                                                        //         swatTransportList[
                                                        //                 index]
                                                        //             ["image"]),
                                                        //     fit: BoxFit.cover),
                                                        CachedNetworkImage(
                                                          imageUrl:
                                                              swatTransportList[
                                                                      index]
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
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              Center(
                                                                  child: Icon(Icons
                                                                      .error)),
                                                        ),
                                                        Positioned(
                                                          bottom: 10,
                                                          left: 10,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.8),
                                                            child:
                                                                BackdropFilter(
                                                              filter: ImageFilter
                                                                  .blur(
                                                                      sigmaY:
                                                                          19.2,
                                                                      sigmaX:
                                                                          19.2),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: Row(
                                                                  children: [
                                                                    Icon(
                                                                        Icons
                                                                            .place_outlined,
                                                                        color: Colors
                                                                            .white),
                                                                    Text(
                                                                        swatTransportList[index]
                                                                            [
                                                                            "name"],
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight: FontWeight.w500)),
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
                    }),
              ],
            ),
          )),
        ),
        bottomNavigationBar: footer(),
      ),
    );
  }
}
