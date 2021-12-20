import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'singleTransport.dart';
import 'singleTraspComp.dart';

// ignore: camel_case_types
class singleTransportDistrict extends StatefulWidget {
  const singleTransportDistrict({Key? key, required this.dist})
      : super(key: key);
  final String dist;
  @override
  _singleTransportDistrictState createState() =>
      _singleTransportDistrictState();
}

// ignore: camel_case_types
class _singleTransportDistrictState extends State<singleTransportDistrict> {
//main section
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> localStream = FirebaseFirestore.instance
        .collection("Transport")
        .where("district", isEqualTo: widget.dist)
        .where("local", isEqualTo: true)
        .snapshots();
    final Stream<QuerySnapshot> compStream = FirebaseFirestore.instance
        .collection("Transport")
        .where("district", isEqualTo: widget.dist)
        .where("local", isEqualTo: false)
        .snapshots();
    return Material(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row(
              //   children: [
              //     SizedBox(width: 10),
              //     Text("Transport Company",
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
              //                   builder: (context) => compSingle(
              //                       local: false, dist: widget.dist)));
              //         },
              //         child: Text(
              //           "View All",
              //         )),
              //   ],
              // ),
              // SizedBox(height: 10),
              Container(
                  height: 280,
                  child: streamListTransport(stream: compStream, local: false)),
              SizedBox(height: 10),
              // Row(
              //   children: [
              //     SizedBox(width: 10),
              //     Text("Local Company",
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
              //                   builder: (context) => compSingle(
              //                         local: true,
              //                         dist: widget.dist,
              //                       )));
              //         },
              //         child: Text(
              //           "View All",
              //         )),
              //     SizedBox(width: 10)
              //   ],
              // ),
              Container(
                  height: 280,
                  child: streamListTransport(stream: localStream, local: true))
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class streamListTransport extends StatelessWidget {
  const streamListTransport(
      {Key? key, required this.stream, required this.local})
      : super(key: key);

  final Stream<QuerySnapshot<Object?>> stream;
  final bool local;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        // ignore: non_constant_identifier_names
        final List db_data = [];
        snapshot.data!.docs.map((DocumentSnapshot e) {
          Map dataList = e.data() as Map<String, dynamic>;
          db_data.add(dataList);
        }).toList();
        if (db_data.isEmpty) {
          return Container();
        } else {
          return Column(
            children: [
              Row(
                children: [
                  SizedBox(width: 10),
                  Text(local == false ? "Transport Company" : "Local Company",
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
                                builder: (context) => compSingle(
                                      local: local,
                                      dist: db_data[0]['district'],
                                    )));
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
                  padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
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
                                  db_data.length,
                                  (index) => Container(
                                        width: 250,
                                        child: GestureDetector(
                                          onTap: () {
                                            if (local) {
                                              // print(db_data[index]['T_ID']);
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          singleTransport(
                                                              id: db_data[index]
                                                                  ['ID'])));
                                            } else {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          compSingle(
                                                              local: false,
                                                              dist: db_data[
                                                                      index][
                                                                  'district'])));
                                            }
                                          },
                                          child: Card(
                                            margin: EdgeInsets.only(
                                                bottom: 5.0,
                                                left: 3.0,
                                                right: 3.0),
                                            elevation: 4,
                                            clipBehavior: Clip.antiAlias,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0)),
                                            child: Stack(
                                              alignment: Alignment.bottomLeft,
                                              children: [
                                                // Ink.image(
                                                //     image: NetworkImage(
                                                //         db_data[index]['image']),
                                                //     // height: 180,
                                                //     fit: BoxFit.cover),
                                                CachedNetworkImage(
                                                  imageUrl: db_data[index]
                                                      ['image'],
                                                  imageBuilder: (context,
                                                          imageProvider) =>
                                                      Container(
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: imageProvider,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  placeholder: (context, url) =>
                                                      Center(
                                                          child:
                                                              CircularProgressIndicator()),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Center(
                                                              child: Icon(
                                                                  Icons.error)),
                                                ),
                                                Positioned(
                                                  bottom: 10,
                                                  left: 10,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.8),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                          sigmaY: 19.2,
                                                          sigmaX: 19.2),
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
                                                                local
                                                                    ? db_data[
                                                                            index]
                                                                        ['name']
                                                                    : db_data[
                                                                            index]
                                                                        [
                                                                        'company'],
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500)),
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
              ),
            ],
          );
        }
      },
    );
  }
}
