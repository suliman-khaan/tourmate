import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'hotel_view.dart';

class PageSecond extends StatefulWidget {
  const PageSecond({Key? key, required this.dist}) : super(key: key);
  final dynamic dist;
  @override
  _PageSecondState createState() => _PageSecondState();
}

class _PageSecondState extends State<PageSecond> {
  @override
  Widget build(BuildContext context) {
    dynamic dist = widget.dist;

    return singleHotel(dist);
  }
}

Widget singleHotel(dist) {
  final Stream<QuerySnapshot> hotelStream = FirebaseFirestore.instance
      .collection("hotel")
      .where("district", isEqualTo: dist)
      .snapshots();
  return SafeArea(
      child: StreamBuilder(
          stream: hotelStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            final List hotel = [];
            snapshot.data!.docs.map((DocumentSnapshot e) {
              Map dataList = e.data() as Map<String, dynamic>;
              hotel.add(dataList);
            }).toList();
            if (hotel.isEmpty) {
              print(dist);
            }
            return Container(
              child: GridView.builder(
                  itemCount: hotel.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
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
                                          builder: (context) => HotelView(
                                              index: 1,
                                              id: hotel[index]['ID'])));
                                },
                                child: Card(
                                  elevation: 4,
                                  clipBehavior: Clip.antiAlias,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: Stack(
                                    alignment: Alignment.bottomLeft,
                                    children: [
                                      Ink.image(
                                          image: NetworkImage(
                                              hotel[index]['image']),
                                          fit: BoxFit.cover),
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
                                                  Icon(Icons.home_outlined,
                                                      color: Colors.white),
                                                  Text(hotel[index]['name'],
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
