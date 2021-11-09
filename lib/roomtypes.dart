import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RoomTypes extends StatefulWidget {
  RoomTypes({Key? key}) : super(key: key);

  @override
  _RoomTypesState createState() => _RoomTypesState();
}

class _RoomTypesState extends State<RoomTypes> {
  int _standardRoomcount = 1;
  int _deluxRoomcount = 1;
  int _sweetyRoomcount = 1;
  int _personcount = 1;
  int _deluxPersoncount = 1;
  int _sweetyPersoncount = 1;
  double _price = 3500.0;
  double _deluxPrice = 4500.0;
  double _sweetyPrice = 6000.0;

  void _incrementRoom() {
    setState(() {
      _standardRoomcount++;
    });
  }

  void _incrementDeluxRoom() {
    setState(() {
      _deluxRoomcount++;
    });
  }

  void _incrementSweetyRoom() {
    setState(() {
      _sweetyRoomcount++;
    });
  }

  void _incrementPerson() {
    setState(() {
      _personcount++;
    });
  }

  void _incrementDeluxPerson() {
    setState(() {
      _deluxPersoncount++;
    });
  }

  void _incrementSweetyPerson() {
    setState(() {
      _sweetyPersoncount++;
    });
  }

  void _decrementRoom() {
    setState(() {
      if (_standardRoomcount > 1) {
        _standardRoomcount--;
      }
    });
  }

  void _decrementDeluxRoom() {
    setState(() {
      if (_deluxRoomcount > 1) {
        _deluxRoomcount--;
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
      if (_deluxPersoncount > 1) {
        _deluxPersoncount--;
      }
    });
  }

  void _decrementSweetyPerson() {
    setState(() {
      if (_sweetyPersoncount > 1) {
        _sweetyPersoncount--;
      }
    });
  }

  void _decrementSweetyRoom() {
    setState(() {
      if (_sweetyRoomcount > 1) {
        _sweetyRoomcount--;
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
                                        child: _standardRoomcount == 1
                                            ? Text(
                                                "$_standardRoomcount Room",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              )
                                            : Text(
                                                "$_standardRoomcount Rooms",
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
                                            "  :  $_personcount",
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
                              "PKR : ${_standardRoomcount * _price}",
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
                                        child: _deluxRoomcount == 1
                                            ? Text(
                                                "$_deluxRoomcount Room",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              )
                                            : Text(
                                                "$_deluxRoomcount Rooms",
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
                                            "  :  $_deluxPersoncount",
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
                              "PKR : ${_deluxRoomcount * _deluxPrice}",
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
                                        child: _sweetyRoomcount == 1
                                            ? Text(
                                                "$_sweetyRoomcount Room",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              )
                                            : Text(
                                                "$_sweetyRoomcount Rooms",
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
                                            "  :  $_sweetyPersoncount",
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
                              "PKR : ${_sweetyRoomcount * _sweetyPrice}",
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
