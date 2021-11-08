import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RoomTypes extends StatefulWidget {
  RoomTypes({Key? key}) : super(key: key);

  @override
  _RoomTypesState createState() => _RoomTypesState();
}

class _RoomTypesState extends State<RoomTypes> {
  int _StandardRoomcount = 1;
  int _DeluxRoomcount = 1;
  int _SweetyRoomcount = 1;
  int _personcount = 1;
  int _DeluxPersoncount = 1;
  int _SweetyPersoncount = 1;
  double _price = 3500.0;
  double _DeluxPrice = 4500.0;
  double _SweetyPrice = 6000.0;
  late double _finalPrice;

  void _incrementRoom() {
    setState(() {
      _StandardRoomcount++;
    });
  }

  void _incrementDeluxRoom() {
    setState(() {
      _DeluxRoomcount++;
    });
  }

  void _incrementSweetyRoom() {
    setState(() {
      _SweetyRoomcount++;
    });
  }

  void _incrementPerson() {
    setState(() {
      _personcount++;
    });
  }

  void _incrementDeluxPerson() {
    setState(() {
      _DeluxPersoncount++;
    });
  }

  void _incrementSweetyPerson() {
    setState(() {
      _SweetyPersoncount++;
    });
  }

  void _decrementRoom() {
    setState(() {
      if (_StandardRoomcount > 1) {
        _StandardRoomcount--;
      }
    });
  }

  void _decrementDeluxRoom() {
    setState(() {
      if (_DeluxRoomcount > 1) {
        _DeluxRoomcount--;
      }
    });
  }

  void _decrementPerson() {
    setState(() {
      if (_personcount > 1) {
        _personcount--;
      }
    });
  }

  void _decrementDeluxPerson() {
    setState(() {
      if (_DeluxPersoncount > 1) {
        _DeluxPersoncount--;
      }
    });
  }

  void _decrementSweetyPerson() {
    setState(() {
      if (_SweetyPersoncount > 1) {
        _SweetyPersoncount--;
      }
    });
  }

  void _decrementSweetyRoom() {
    setState(() {
      if (_SweetyRoomcount > 1) {
        _SweetyRoomcount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Result",
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.black, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Standard Room",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              decoration: TextDecoration.underline,
                              color: Colors.deepPurple[300],
                              fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.user,
                              size: 15,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            FaIcon(
                              FontAwesomeIcons.user,
                              size: 15,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Bed:",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 15),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              "1 Master Bed",
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Icon(
                              Icons.king_bed_outlined,
                              size: 30,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Wrap(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.black,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Icon(
                                      Icons.balcony_outlined,
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
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.black,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
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
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.black,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
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
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.black,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1),
                                      color: Colors.white,
                                      onPressed: _incrementRoom,
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
                                            width: 1, color: Colors.black)),
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: _StandardRoomcount == 1
                                            ? Text(
                                                "${_StandardRoomcount} Room",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              )
                                            : Text(
                                                "${_StandardRoomcount} Rooms",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              )),
                                  ),
                                  SizedBox(
                                    height: 30,
                                    width: 30,
                                    // ignore: deprecated_member_use
                                    child: OutlineButton(
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 1),
                                        color: Colors.white,
                                        onPressed: _decrementRoom,
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
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1),
                                      color: Colors.white,
                                      onPressed: _incrementPerson,
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
                                            width: 1, color: Colors.black)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.user,
                                            size: 12,
                                          ),
                                          Text(
                                            "  :  ${_personcount}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          )
                                        ],
                                      ),
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
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 1),
                                        color: Colors.white,
                                        onPressed: _decrementPerson,
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
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "PKR : ${_StandardRoomcount * _price}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),

                            // ignore: deprecated_member_use
                            RaisedButton(
                              onPressed: () {},
                              child: Text(
                                "Reserve",
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Colors.blueAccent,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.black, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Delux Room",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              decoration: TextDecoration.underline,
                              color: Colors.deepPurple[300],
                              fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.user,
                              size: 15,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            FaIcon(
                              FontAwesomeIcons.user,
                              size: 15,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            FaIcon(
                              FontAwesomeIcons.user,
                              size: 15,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Beds:",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 15),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              "1 Master Bed",
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Icon(
                              Icons.king_bed_outlined,
                              size: 30,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text("1 Single bed"),
                            SizedBox(
                              width: 3,
                            ),
                            Icon(
                              Icons.single_bed_outlined,
                              size: 25,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Wrap(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.black,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Icon(
                                      Icons.balcony_outlined,
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
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.black,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
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
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.black,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
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
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.black,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1),
                                      color: Colors.white,
                                      onPressed: _incrementDeluxRoom,
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
                                            width: 1, color: Colors.black)),
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: _DeluxRoomcount == 1
                                            ? Text(
                                                "${_DeluxRoomcount} Room",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              )
                                            : Text(
                                                "${_DeluxRoomcount} Rooms",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              )),
                                  ),
                                  SizedBox(
                                    height: 30,
                                    width: 30,
                                    // ignore: deprecated_member_use
                                    child: OutlineButton(
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 1),
                                        color: Colors.white,
                                        onPressed: _decrementDeluxRoom,
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
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1),
                                      color: Colors.white,
                                      onPressed: _incrementDeluxPerson,
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
                                            width: 1, color: Colors.black)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.user,
                                            size: 12,
                                          ),
                                          Text(
                                            "  :  ${_DeluxPersoncount}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          )
                                        ],
                                      ),
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
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 1),
                                        color: Colors.white,
                                        onPressed: _decrementDeluxPerson,
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
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "PKR : ${_DeluxRoomcount * _DeluxPrice}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),

                            // ignore: deprecated_member_use
                            RaisedButton(
                              onPressed: () {},
                              child: Text(
                                "Reserve",
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Colors.blueAccent,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.black, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sweety Room",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              decoration: TextDecoration.underline,
                              color: Colors.deepPurple[300],
                              fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.user,
                              size: 15,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            FaIcon(
                              FontAwesomeIcons.user,
                              size: 15,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            FaIcon(
                              FontAwesomeIcons.user,
                              size: 15,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            FaIcon(
                              FontAwesomeIcons.user,
                              size: 15,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            FaIcon(
                              FontAwesomeIcons.user,
                              size: 15,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Bed:",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 15),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              "1 Master Bed",
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Icon(
                              Icons.king_bed_outlined,
                              size: 30,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              "3 Single Beds",
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Icon(
                              Icons.single_bed_outlined,
                              size: 30,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Wrap(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.black,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Icon(
                                      Icons.balcony_outlined,
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
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.black,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
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
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.black,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
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
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.black,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1),
                                      color: Colors.white,
                                      onPressed: _incrementSweetyRoom,
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
                                            width: 1, color: Colors.black)),
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: _SweetyRoomcount == 1
                                            ? Text(
                                                "${_SweetyRoomcount} Room",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              )
                                            : Text(
                                                "${_SweetyRoomcount} Rooms",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              )),
                                  ),
                                  SizedBox(
                                    height: 30,
                                    width: 30,
                                    // ignore: deprecated_member_use
                                    child: OutlineButton(
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 1),
                                        color: Colors.white,
                                        onPressed: _decrementSweetyRoom,
                                        child: Icon(
                                          Icons.remove,
                                          size: 15,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 30,
                                    width: 30,
                                    // ignore: deprecated_member_use
                                    child: OutlineButton(
                                      // style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(side: )))
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1),
                                      color: Colors.white,
                                      onPressed: _incrementSweetyPerson,
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
                                            width: 1, color: Colors.black)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.user,
                                            size: 12,
                                          ),
                                          Text(
                                            "  :  ${_SweetyPersoncount}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                    width: 30,
                                    // ignore: deprecated_member_use
                                    child: OutlineButton(
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 1),
                                        color: Colors.white,
                                        onPressed: _decrementSweetyPerson,
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
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "PKR : ${_SweetyRoomcount * _SweetyPrice}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),

                            // ignore: deprecated_member_use
                            RaisedButton(
                              onPressed: () {},
                              child: Text(
                                "Reserve",
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Colors.blueAccent,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
