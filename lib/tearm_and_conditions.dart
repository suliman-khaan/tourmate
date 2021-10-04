

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
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
              Navigator.pop(context);
            },
          ),
          title: Text("Terms and conditons",
              style: GoogleFonts.roboto(color: Colors.black, fontSize: 15)),
          // title: Text(
          //   "Historical Areas in Swat",
          //   style: GoogleFonts.roboto(color: Colors.black,fontSize: 15)
          // ),
        ),
        body: Container(
          child: Center(child: Text("Our terms and conditoins")),
        ),
      ),
    );
  }
}
