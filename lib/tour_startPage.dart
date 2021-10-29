import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';

// ignore: camel_case_types
class tourMate extends StatefulWidget {
  const tourMate({Key? key}) : super(key: key);

  @override
  _tourMateState createState() => _tourMateState();
}

// ignore: camel_case_types
class _tourMateState extends State<tourMate> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 1);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => home()));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => home()),
        );
      },
      child: Stack(
        children: [
          Material(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/background.jpg"),
                      fit: BoxFit.cover)),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(),
                      Image(
                        image: AssetImage("assets/FINAL-LOGO-cc.png"),
                        height: 190.0,
                      ),
                      Container(
                        child: Center(
                          child: Column(
                            children: [
                              Text("Tour Mate",
                                  style: GoogleFonts.cookie(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.w300)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
