import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'drawer.dart';
import 'footer.dart';

// void main() => runApp(singleTransport());

// ignore: camel_case_types
class singleTransport extends StatefulWidget {
  final String id;
  singleTransport({Key? key, required this.id}) : super(key: key);

  @override
  _singleTransportState createState() => _singleTransportState();
}

// ignore: camel_case_types
class _singleTransportState extends State<singleTransport> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> transportStream = FirebaseFirestore.instance
        .collection("Transport")
        .where("ID", isEqualTo: widget.id)
        .snapshots();
    final Stream<QuerySnapshot> fStream = FirebaseFirestore.instance
        .collection("Facilities")
        .where("transport", isEqualTo: widget.id)
        .snapshots();
    return StreamBuilder(
        stream: transportStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final List transport = [];
          snapshot.data!.docs.map((DocumentSnapshot e) {
            Map tList = e.data() as Map<String, dynamic>;
            transport.add(tList);
          }).toList();
          return Material(
            child: SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  iconTheme: IconThemeData(color: Colors.black),
                  backgroundColor: Colors.white,
                  elevation: 0,
                  leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        size: 16,
                      )),
                  title: Text(transport[0]['name'],
                      style: GoogleFonts.roboto(
                          fontSize: 18, color: Colors.black)),
                  centerTitle: true,
                ),
                endDrawer: MyDrawer(),
                body: SingleChildScrollView(
                  child: Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(image: NetworkImage(transport[0]['image'])),
                      // CachedNetworkImage(
                      //   imageUrl: transport[0]['image'],
                      //   imageBuilder: (context, imageProvider) => Container(
                      //     decoration: BoxDecoration(
                      //       image: DecorationImage(
                      //         image: imageProvider,
                      //         fit: BoxFit.cover,
                      //       ),
                      //     ),
                      //   ),
                      //   placeholder: (context, url) =>
                      //       CircularProgressIndicator(),
                      //   errorWidget: (context, url, error) => Icon(Icons.error),
                      // ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(transport[0]['name'],
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, top: 10),
                        child: Text(
                          transport[0]['description'],
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          // decoration: BoxDecoration(
                          // border: Border.all(color: Colors.blue)
                          // ),

                          padding: EdgeInsets.fromLTRB(8, 20, 8, 10),
                          child: Column(children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Facilities",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              ),
                            ),
                            // Facilities

                            StreamBuilder(
                                stream: fStream,
                                builder: (BuildContext context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  }

                                  if (snapshot.hasData) {
                                    final List facilities = [];
                                    snapshot.data!.docs
                                        .map((DocumentSnapshot e) {
                                      Map list =
                                          e.data() as Map<String, dynamic>;
                                      facilities.add(list);
                                    }).toList();
                                    return Container(
                                      padding: EdgeInsets.all(8),
                                      width: MediaQuery.of(context).size.width,
                                      color: Colors.grey[200],
                                      child: Wrap(
                                        children: [
                                          Wrap(
                                            children: [
                                              //food
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2 -
                                                    16,
                                                child: RichText(
                                                  text: TextSpan(
                                                      // ignore: deprecated_member_use
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2,
                                                      children: [
                                                        WidgetSpan(
                                                            child: Icon(
                                                          Icons.restaurant,
                                                          size: 16,
                                                          color: facilities[0][
                                                                      'food'] ==
                                                                  true
                                                              ? Colors.black
                                                              : Colors.grey,
                                                        )),
                                                        TextSpan(
                                                            text: "  Food",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              color: facilities[
                                                                              0]
                                                                          [
                                                                          'food'] ==
                                                                      true
                                                                  ? Colors.black
                                                                  : Colors.grey,
                                                            )),
                                                        // TextSpan(text:" "),
                                                      ]),
                                                ),
                                              ),
                                              //Drink
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2 -
                                                    16,
                                                child: RichText(
                                                  text: TextSpan(
                                                      // ignore: deprecated_member_use
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2,
                                                      children: [
                                                        WidgetSpan(
                                                            child: Icon(
                                                          Icons
                                                              .local_bar_outlined,
                                                          size: 16,
                                                          color: facilities[0][
                                                                      'drink'] ==
                                                                  true
                                                              ? Colors.black
                                                              : Colors.grey,
                                                        )),
                                                        TextSpan(
                                                            text: "  Drink",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              color: facilities[
                                                                              0]
                                                                          [
                                                                          'drink'] ==
                                                                      true
                                                                  ? Colors.black
                                                                  : Colors.grey,
                                                            )),
                                                      ]),
                                                ),
                                              ),
                                              //LCD
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2 -
                                                    16,
                                                child: RichText(
                                                  text: TextSpan(
                                                      // ignore: deprecated_member_use
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2,
                                                      children: [
                                                        WidgetSpan(
                                                            child: Icon(
                                                          Icons.tv_outlined,
                                                          size: 16,
                                                          color: facilities[0]
                                                                      ['lcd'] ==
                                                                  true
                                                              ? Colors.black
                                                              : Colors.grey,
                                                        )),
                                                        TextSpan(
                                                            text: "  LCD",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              color: facilities[
                                                                              0]
                                                                          [
                                                                          'lcd'] ==
                                                                      true
                                                                  ? Colors.black
                                                                  : Colors.grey,
                                                            )),
                                                        // TextSpan(text:" "),
                                                      ]),
                                                ),
                                              ),
                                              //AC
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2 -
                                                    16,
                                                child: RichText(
                                                  text: TextSpan(
                                                      // ignore: deprecated_member_use
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2,
                                                      children: [
                                                        WidgetSpan(
                                                            child: Icon(
                                                          Icons
                                                              .ac_unit_outlined,
                                                          size: 16,
                                                          color: facilities[0]
                                                                      ['ac'] ==
                                                                  true
                                                              ? Colors.black
                                                              : Colors.grey,
                                                        )),
                                                        TextSpan(
                                                            text:
                                                                "  Air Condition",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              color: facilities[
                                                                              0]
                                                                          [
                                                                          'ac'] ==
                                                                      true
                                                                  ? Colors.black
                                                                  : Colors.grey,
                                                            )),
                                                        // TextSpan(text:" "),
                                                      ]),
                                                ),
                                              ),
                                              //First Aid
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2 -
                                                    16,
                                                child: RichText(
                                                  text: TextSpan(
                                                      // ignore: deprecated_member_use
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2,
                                                      children: [
                                                        WidgetSpan(
                                                            child: Icon(
                                                          Icons
                                                              .health_and_safety_outlined,
                                                          size: 16,
                                                          color: facilities[0][
                                                                      'firstaid'] ==
                                                                  true
                                                              ? Colors.black
                                                              : Colors.grey,
                                                        )),
                                                        TextSpan(
                                                            text: "  First Aid",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              color: facilities[
                                                                              0]
                                                                          [
                                                                          'firstaid'] ==
                                                                      true
                                                                  ? Colors.black
                                                                  : Colors.grey,
                                                            )),
                                                        // TextSpan(text:" "),
                                                      ]),
                                                ),
                                              ),
                                              //Heater
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2 -
                                                    16,
                                                child: RichText(
                                                  text: TextSpan(
                                                      // ignore: deprecated_member_use
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2,
                                                      children: [
                                                        WidgetSpan(
                                                            child: Icon(
                                                          Icons
                                                              .microwave_outlined,
                                                          size: 16,
                                                          color: facilities[0][
                                                                      'heater'] ==
                                                                  true
                                                              ? Colors.black
                                                              : Colors.grey,
                                                        )),
                                                        TextSpan(
                                                            text: "  Heater",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              color: facilities[
                                                                              0]
                                                                          [
                                                                          'heater'] ==
                                                                      true
                                                                  ? Colors.black
                                                                  : Colors.grey,
                                                            )),
                                                        // TextSpan(text:" "),
                                                      ]),
                                                ),
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5),
                                                width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2 -
                                                    16,
                                                child: RichText(
                                                  text: TextSpan(
                                                      // ignore: deprecated_member_use
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2,
                                                      children: [
                                                        WidgetSpan(
                                                            child: Icon(
                                                          Icons.wifi,
                                                          size: 16,
                                                          color: facilities[0][
                                                                      'wifi'] ==
                                                                  true
                                                              ? Colors.black
                                                              : Colors.grey,
                                                        )),
                                                        TextSpan(
                                                            text: "  Wifi",
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              color: facilities[
                                                                              0]
                                                                          [
                                                                          'wifi'] ==
                                                                      true
                                                                  ? Colors.black
                                                                  : Colors.grey,
                                                            )),
                                                        // TextSpan(text:" "),
                                                      ]),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    );
                                  } else {
                                    return Center(
                                        child: Text(
                                            "Sorry! No Facilities Availiable."));
                                  }
                                })
                          ]),
                        ),
                      ),
                    ],
                  )),
                ),
                bottomNavigationBar: footer(),
              ),
            ),
          );
        });
  }
}
