import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourmate1/user_detail_for_booking.dart';

class RoomTypes extends StatefulWidget {
  RoomTypes({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  _RoomTypesState createState() => _RoomTypesState();
}

class _RoomTypesState extends State<RoomTypes> {
  int _personcount = 1;

  var price;

  late int room_count = 1;
  late int incremented_index = 0;

  void _incrementRoom(int index) {
    setState(() {
      incremented_index = index;
      if (index == 0) {
        room_count++;
      } else if (index == 1) {
        room_count++;
      } else {
        room_count++;
      }
    });
  }

  void _decrementRoom(int index) {
    setState(() {
      incremented_index = index;
      if (index == 0 && room_count > 1) {
        room_count--;
      } else if (index == 1 && room_count > 1) {
        room_count--;
      } else {
        if (room_count > 1) {
          room_count--;
        }
      }
    });
  }

  void _incrementPerson(int index) {
    setState(() {
      incremented_index = index;
      if (index == 0) {
        _personcount++;
      } else if (index == 1) {
        _personcount++;
      } else {
        _personcount++;
      }
    });
  }

  void _decrementPerson(int index) {
    setState(() {
      incremented_index = index;
      if (index == 0 && _personcount > 1) {
        _personcount--;
      } else if (index == 1 && _personcount > 1) {
        _personcount--;
      } else {
        if (_personcount > 1) {
          _personcount--;
        }
      }
    });
  }

  var roomTypeStream;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    roomTypeStream = FirebaseFirestore.instance
        .collection("room_type")
        // .where("hotel_id", isEqualTo: "rFtCqTZxocTjVeEd6vbo")
        .snapshots();
  }
  // ignore: empty_constructor_bodies

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: roomTypeStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
                color: Colors.white,
                child: Center(child: CircularProgressIndicator()));
          }
          final List roomType = [];
          snapshot.data!.docs.map((DocumentSnapshot e) {
            Map dataList = e.data() as Map<String, dynamic>;
            roomType.add(dataList);
          }).toList();
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
                "Room Types",
                style: GoogleFonts.roboto(color: Colors.black),
              ),
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
              actions: [],
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Result",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Container(
                      height: MediaQuery.of(context).size.height - 120,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(
                        primary: false,
                        shrinkWrap: true,
                        // physics: NeverScrollableScrollPhysics(),
                        children: List.generate(
                            roomType.length,
                            (index) => Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                              color: Colors.black, width: 1)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              roomType[index]['name'],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  color: Colors.deepPurple[300],
                                                  fontSize: 20),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),

                                            Row(
                                              children: <Widget>[
                                                for (var i = 0;
                                                    i <
                                                        roomType[index]
                                                            ['person'];
                                                    i++)
                                                  FaIcon(
                                                    FontAwesomeIcons.user,
                                                    size: 15,
                                                  ),
                                                SizedBox(
                                                  width: 3,
                                                ),
                                              ],
                                              // children: [
                                              //   FaIcon(
                                              //     FontAwesomeIcons.user,
                                              //     size: 15,
                                              //   ),
                                              //   SizedBox(
                                              //     width: 3,
                                              //   ),
                                              //   FaIcon(
                                              //     FontAwesomeIcons.user,
                                              //     size: 15,
                                              //   ),
                                              // ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Beds:",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      fontSize: 15),
                                                ),
                                                SizedBox(
                                                  width: 3,
                                                ),
                                                Text(
                                                  "${roomType[index]['master_bed']} Master Bed",
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                                SizedBox(
                                                  width: 3,
                                                ),
                                                Icon(
                                                  Icons.king_bed_outlined,
                                                  size: 20,
                                                ),
                                                SizedBox(
                                                  width: 3,
                                                ),
                                                Text(
                                                  "${roomType[index]['single_bed']} Single Bed",
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                                SizedBox(
                                                  width: 3,
                                                ),
                                                Icon(
                                                  Icons.bed_outlined,
                                                  size: 20,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Wrap(
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.5,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      width: 1,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5),
                                                        child: Icon(
                                                          Icons
                                                              .balcony_outlined,
                                                          size: 15,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text("Balcony")
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.5,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      width: 1,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5),
                                                        child: Icon(
                                                          Icons.tv,
                                                          size: 15,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text("Flat-Sreen Tv")
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 30,
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.5,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      width: 1,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5),
                                                        child: Icon(
                                                          Icons.wifi,
                                                          size: 15,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text("Wifi")
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2.5,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      width: 1,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5),
                                                        child: Icon(
                                                          Icons.shower_outlined,
                                                          size: 15,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text("Hot-Shower")
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),

                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        height: 30,
                                                        width: 30,
                                                        // ignore: deprecated_member_use
                                                        child: OutlineButton(
                                                          // style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(side: )))
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .black,
                                                                  width: 1),
                                                          color: Colors.white,
                                                          onPressed: () {
                                                            _incrementRoom(
                                                                index);
                                                          },
                                                          child: Icon(
                                                            Icons.add,
                                                            size: 15,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 31,
                                                        width: 75,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                width: 1,
                                                                color: Colors
                                                                    .black)),
                                                        child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: room_count ==
                                                                    1
                                                                ? index ==
                                                                        incremented_index
                                                                    ? Text(
                                                                        "${room_count} Room",
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontSize: 12),
                                                                      )
                                                                    : Text(
                                                                        "1 Room",
                                                                        style: TextStyle(
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            fontSize:
                                                                                12))
                                                                : incremented_index ==
                                                                        index
                                                                    ? Text(
                                                                        "${room_count} Rooms",
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontSize: 12),
                                                                      )
                                                                    : Text(
                                                                        "1 Room",
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontSize: 12))),
                                                      ),
                                                      SizedBox(
                                                        height: 30,
                                                        width: 30,
                                                        // ignore: deprecated_member_use
                                                        child: OutlineButton(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .black,
                                                                    width: 1),
                                                            color: Colors.white,
                                                            onPressed: () {
                                                              _decrementRoom(
                                                                  index);
                                                            },
                                                            child: Icon(
                                                              Icons.remove,
                                                              size: 15,
                                                            )),
                                                      ),
                                                    ],
                                                  ),
                                                ),

                                                // SizedBox(
                                                //   width: MediaQuery.of(context).size.aspectRatio,
                                                // ),
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        height: 30,
                                                        width: 30,
                                                        // ignore: deprecated_member_use
                                                        child: OutlineButton(
                                                          // style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(side: )))
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .black,
                                                                  width: 1),
                                                          color: Colors.white,
                                                          onPressed: () {
                                                            _incrementPerson(
                                                                index);
                                                          },

                                                          child: Icon(
                                                            Icons.add,
                                                            size: 15,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 31,
                                                        width: 75,
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                width: 1,
                                                                color: Colors
                                                                    .black)),
                                                        child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: index ==
                                                                    incremented_index
                                                                ? Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                        FaIcon(
                                                                          FontAwesomeIcons
                                                                              .user,
                                                                          size:
                                                                              12,
                                                                        ),
                                                                        Text(
                                                                          "  :  ${_personcount}",
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 12),
                                                                        )
                                                                      ])
                                                                : Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                        FaIcon(
                                                                          FontAwesomeIcons
                                                                              .user,
                                                                          size:
                                                                              12,
                                                                        ),
                                                                        Text(
                                                                          "  :  1",
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 12),
                                                                        )
                                                                      ])
                                                            // child: _count == 1
                                                            //     ? Text(
                                                            //         "${_personcount} Person",
                                                            //         style: TextStyle(
                                                            //             fontWeight: FontWeight.bold),
                                                            //       )
                                                            //     : Text(
                                                            //         "${_personcount} Person",
                                                            //         style: TextStyle(
                                                            //             fontWeight: FontWeight.bold),
                                                            //       )
                                                            ),
                                                      ),
                                                      SizedBox(
                                                        height: 30,
                                                        width: 30,
                                                        // ignore: deprecated_member_use
                                                        child: OutlineButton(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .black,
                                                                    width: 1),
                                                            color: Colors.white,
                                                            onPressed: () {
                                                              _decrementPerson(
                                                                  index);
                                                            },
                                                            child: Icon(
                                                              Icons.remove,
                                                              size: 12,
                                                            )),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            //Taken Row for Text Price
                                            Row(
                                              children: [
                                                Text(
                                                  "Price for ",
                                                ),
                                                Text(
                                                  "1 Night",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                incremented_index == index
                                                    ? Text(
                                                        "PKR : ${(room_count * roomType[incremented_index]['price'])}",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )
                                                    : Text(
                                                        "PKR : ${roomType[index]['price']}",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),

                                                // ignore: deprecated_member_use
                                                RaisedButton(
                                                  onPressed: () {
                                                    Navigator.of(context).push(MaterialPageRoute(
                                                        builder: (context) =>
                                                            UserDetailForBooking(
                                                                room_name:
                                                                    roomType[index]
                                                                        [
                                                                        'name'],
                                                                rooms:
                                                                    room_count,
                                                                price: ((room_count *
                                                                    roomType[
                                                                            index]
                                                                        [
                                                                        'price'])),
                                                                hotel_name:
                                                                    widget
                                                                        .name)));
                                                  },
                                                  child: Text(
                                                    "Reserve",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  color: Colors.blueAccent,
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
