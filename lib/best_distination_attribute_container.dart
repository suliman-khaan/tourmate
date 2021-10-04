import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'footer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'attribute_view.dart';
import 'hotel_view.dart';

class BestDistinationAttributeContainer extends StatefulWidget {
  const BestDistinationAttributeContainer(
      {Key? key, required this.areaIndex, required this.id})
      : super(key: key);
  final int areaIndex;
  final String id;

  @override
  _BestDistinationAttributeContainerState createState() =>
      _BestDistinationAttributeContainerState();
}

class _BestDistinationAttributeContainerState
    extends State<BestDistinationAttributeContainer> {
  @override
  Widget build(BuildContext context1) {
    String id = widget.id;
    final Stream<QuerySnapshot> _stream;
    switch (widget.areaIndex) {
      case 1:
        _stream = FirebaseFirestore.instance
            .collection("hotel")
            .where("best_destination", isEqualTo: id)
            .snapshots();
        break;
      case 2:
        _stream = FirebaseFirestore.instance
            .collection("Resturents")
            .where("best_destination", isEqualTo: id)
            .snapshots();
        break;
      case 3:
        _stream = FirebaseFirestore.instance
            .collection("Events")
            .where("best_destination", isEqualTo: id)
            .snapshots();
        break;
      case 4:
        _stream = FirebaseFirestore.instance
            .collection("Entertainment")
            .where("best_destination", isEqualTo: id)
            .snapshots();
        break;
      case 5:
        _stream = FirebaseFirestore.instance
            .collection("Parks")
            .where("best_destination", isEqualTo: id)
            .snapshots();
        break;
      case 6:
        _stream = FirebaseFirestore.instance
            .collection("Areas")
            .where("best_destination", isEqualTo: id)
            .where("explored_area", isEqualTo: true)
            .snapshots();
        break;
      default:
        _stream = FirebaseFirestore.instance
            .collection("hotel")
            .where("best_destination", isEqualTo: id)
            .snapshots();
    }
    return StreamBuilder<QuerySnapshot>(
        stream: _stream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print("Something went Wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          final List storeAttribute = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            storeAttribute.add(a);
          }).toList();
          return Material(
            child: Container(
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
                        Navigator.pop(context1);
                      },
                    ),
                    title: Text(
                      storeAttribute[0]["name"],
                      style:
                          GoogleFonts.roboto(color: Colors.black, fontSize: 16),
                    )),
                body: GridView.builder(
                    itemCount: storeAttribute.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: InkWell(
                          onTap: () {
                            if (widget.areaIndex == 1) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HotelView(
                                          index: 1,
                                          id: storeAttribute[index]['ID'])));
                            } else if (widget.areaIndex == 1) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HotelView(
                                          index: 2,
                                          id: storeAttribute[index]['ID'])));
                            } else if (widget.areaIndex == 5) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HotelView(
                                          index: 3,
                                          id: storeAttribute[index]['ID'])));
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DistrictAttributeContainer(
                                              areaIndex: 8,
                                              a_id: storeAttribute[index]
                                                  ['ID'])));
                            }
                          },
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Card(
                                clipBehavior: Clip.antiAlias,
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Hero(
                                  tag: "hero-${index.toString()}",
                                  child: Image.network(
                                    // "assets/images/${imageData[index].imageName}",
                                    storeAttribute[index]["image"],
                                    fit: BoxFit.cover,
                                    height: MediaQuery.of(context).size.height,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                                child: ClipRect(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 10.0, sigmaY: 10.0),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 4),
                                      child: Text(storeAttribute[index]['name'],
                                          style: TextStyle(
                                            color: Colors.white,
                                          )),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                // endDrawer: MyDrawer(),
                bottomNavigationBar: footer(),
              ),
            ),
          );
        });
  }
}
