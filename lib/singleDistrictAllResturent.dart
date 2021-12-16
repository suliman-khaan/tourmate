import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tourmate1/hotel_view.dart';
import 'attribute_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class pageThird extends StatefulWidget {
  const pageThird({Key? key, required this.dist}) : super(key: key);
  final String dist;
  @override
  pageThirdState createState() => pageThirdState();
}

// ignore: camel_case_types
class pageThirdState extends State<pageThird> {
  @override
  Widget build(BuildContext context) {
    return singleResturent(widget.dist);
  }
}

Widget singleResturent(dist) {
  final Stream<QuerySnapshot> resturantStream = FirebaseFirestore.instance
      .collection("Resturents")
      .where("district", isEqualTo: dist)
      .snapshots();
  return SafeArea(
      child: StreamBuilder(
          stream: resturantStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            // ignore: non_constant_identifier_names
            final List db_data = [];
            snapshot.data!.docs.map((DocumentSnapshot e) {
              Map dataList = e.data() as Map<String, dynamic>;
              db_data.add(dataList);
            }).toList();
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: GridView.builder(
                  itemCount: db_data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (ctx, index) {
                    return Container(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Stack(
                          children: [
                            Container(
                              height: 200,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                HotelView(
                                                                  index: 2,
                                                                  id: db_data[
                                                                          index]
                                                                      ['ID'],
                                                                )));
                                },
                                child: Card(
                                  elevation: 4,
                                  clipBehavior: Clip.antiAlias,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: Stack(
                                    alignment: Alignment.bottomLeft,
                                    children: [
                                      // Ink.image(
                                      //     image: NetworkImage(
                                      //         db_data[index]['image']),
                                      //     fit: BoxFit.cover),
                                      CachedNetworkImage(
                                        imageUrl: db_data[index]['image'],
                                        width: double.infinity,
                                        height: double.infinity,
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        placeholder: (context, url) => Center(
                                            child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            Center(child: Icon(Icons.error)),
                                      ),
                                      Positioned(
                                        bottom: 10,
                                        left: 10,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(4.8),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                                sigmaY: 19.2, sigmaX: 19.2),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                      Icons.restaurant_outlined,
                                                      color: Colors.white),
                                                  Text(db_data[index]['name'],
                                                      style: TextStyle(
                                                          color: Colors.white,
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
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            );
          }));
}
