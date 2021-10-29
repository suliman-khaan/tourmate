import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'footer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'attribute_view.dart';
import 'drawer.dart';
// ignore: unused_import
import 'routes.dart';
import 'view_best_distination.dart';

class Areas extends StatefulWidget {
  const Areas({Key? key, required this.areaIndex, required this.dist})
      : super(key: key);
  final int areaIndex;
  final String dist;
  @override
  _AreasState createState() => _AreasState();
}

class _AreasState extends State<Areas> {
  @override
  Widget build(BuildContext context) {
    String district = widget.dist;
    final Stream<QuerySnapshot> _stream;
    var area = "Areas";
    switch (widget.areaIndex) {
      case 1:
        _stream = FirebaseFirestore.instance
            .collection(area)
            .where("district", isEqualTo: district)
            .where("best_destination", isEqualTo: true)
            .snapshots();
        break;
      case 2:
        _stream = FirebaseFirestore.instance
            .collection(area)
            .where("district", isEqualTo: district)
            .where("explored_area", isEqualTo: true)
            .snapshots();
        break;
      case 3:
        _stream = FirebaseFirestore.instance
            .collection(area)
            .where("district", isEqualTo: district)
            .where("hiking_and_tracking", isEqualTo: true)
            .snapshots();
        break;
      case 4:
        _stream = FirebaseFirestore.instance
            .collection("Parks")
            .where("district", isEqualTo: district)
            .snapshots();
        break;
      case 5:
        _stream = FirebaseFirestore.instance
            .collection(area)
            .where("district", isEqualTo: district)
            .where("historical", isEqualTo: true)
            .snapshots();
        break;
      case 6:
        _stream = FirebaseFirestore.instance
            .collection("Events")
            .where("district", isEqualTo: district)
            .where("present", isEqualTo: true)
            .snapshots();
        break;
      case 7:
        _stream = FirebaseFirestore.instance
            .collection("Entertainment")
            .where("district", isEqualTo: district)
            .snapshots();
        break;
      default:
        _stream = FirebaseFirestore.instance
            .collection(area)
            .where("district", isEqualTo: district)
            .where("hiking_and_tracking", isEqualTo: true)
            .snapshots();
    }
    final Stream<QuerySnapshot> dNAme = FirebaseFirestore.instance
        .collection("District")
        .where("ID", isEqualTo: district)
        .snapshots();

    return StreamBuilder<QuerySnapshot>(
        stream: dNAme,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print("Something went wrong ");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          }
          final List dname = [];
          snapshot.data!.docs.map((DocumentSnapshot e) {
            Map dis = e.data() as Map<String, dynamic>;
            dname.add(dis);
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
                      Navigator.pop(context);
                    },
                  ),
                  title: Text(
                    'Explored Area in ${dname[0]["name"]}',
                    style:
                        GoogleFonts.roboto(color: Colors.black, fontSize: 16),
                  ),
                ),
                body: StreamBuilder(
                    stream: _stream,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        print("Something went wrong ");
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Colors.blue,
                          ),
                        );
                      }
                      final List storeArea = [];
                      snapshot.data!.docs.map((DocumentSnapshot e) {
                        Map dis = e.data() as Map<String, dynamic>;
                        storeArea.add(dis);
                      }).toList();
                      return Container(
                          child: GridView
                              .builder /*(gridDelegate: gridDelegate, itemBuilder: itemBuilder)*/ (
                        itemCount: storeArea.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 4,
                            mainAxisSpacing: 4),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              if (widget.areaIndex == 1) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ViewDistination(
                                            areaID: storeArea[index]['ID'])));
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DistrictAttributeContainer(
                                              areaIndex: widget.areaIndex,
                                              a_id: storeArea[index]['ID'],
                                            )));
                              }
                            },
                            child: Card(
                              elevation: 4,
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
                              child: Stack(
                                alignment: Alignment.bottomLeft,
                                children: <Widget>[
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            10,
                                    height: 200,
                                    child:
                                        // Image(
                                        //     image: NetworkImage(
                                        //         storeArea[index]['image']),
                                        //     fit: BoxFit.cover)
                                        CachedNetworkImage(
                                      imageUrl: storeArea[index]['image'],
                                      imageBuilder: (context, imageProvider) =>
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
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                                    child: ClipRect(
                                      child: BackdropFilter(
                                        filter: new ImageFilter.blur(
                                            sigmaX: 10.0, sigmaY: 10.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(0.5),
                                          ),
                                          child: Container(
                                            // padding: EdgeInsets.fromLTRB(left, top, right, bottom),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 4),
                                            child: Text(
                                              storeArea[index]['name'],
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ));
                    }),
                bottomNavigationBar: footer(),
                endDrawer: MyDrawer(),
              ),
            ),
          );
        });
  }
}
