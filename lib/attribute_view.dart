// ignore: import_of_legacy_library_into_null_safe
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'drawer.dart';

class DistrictAttributeContainer extends StatefulWidget {
  const DistrictAttributeContainer(
      {Key? key,
      required this.areaIndex,
      // ignore: non_constant_identifier_names
      required this.a_id})
      : super(key: key);
  final int areaIndex;
  // ignore: non_constant_identifier_names
  final String a_id;
  @override
  _DistrictAttributeContainerState createState() =>
      _DistrictAttributeContainerState();
}

class _DistrictAttributeContainerState
    extends State<DistrictAttributeContainer> {
  @override
  Widget build(BuildContext context) {
    //String district = widget.dist;
    String id = widget.a_id;
    final Stream<QuerySnapshot> _stream;
    final Stream<QuerySnapshot> _stream1;
    var area = "Areas";
    switch (widget.areaIndex) {
      case 2:
        _stream = FirebaseFirestore.instance
            .collection(area)
            //.where('district', isEqualTo: district)
            .where('explored_area', isEqualTo: true)
            .where('ID', isEqualTo: id)
            .snapshots();
        _stream1 = FirebaseFirestore.instance
            .collection("Gallery")
            .where("area", isEqualTo: id)
            .snapshots();
        break;
      case 3:
        _stream = FirebaseFirestore.instance
            .collection(area)
            //.where('district', isEqualTo: district)
            .where('hiking_and_tracking', isEqualTo: true)
            .where('ID', isEqualTo: id)
            .snapshots();
        _stream1 = FirebaseFirestore.instance
            .collection("Gallery")
            .where("area", isEqualTo: id)
            .snapshots();
        break;
      case 4:
        _stream = FirebaseFirestore.instance
            .collection("Parks")
            // .where('district', isEqualTo: district)
            .where('ID', isEqualTo: id)
            .snapshots();
        _stream1 = FirebaseFirestore.instance
            .collection("Gallery")
            .where("parks", isEqualTo: id)
            .snapshots();
        break;
      case 5:
        _stream = FirebaseFirestore.instance
            .collection(area)
            .where("historical", isEqualTo: true)
            .where("ID", isEqualTo: id)
            .snapshots();
        _stream1 = FirebaseFirestore.instance
            .collection("Gallery")
            .where("area", isEqualTo: id)
            .snapshots();
        break;
      case 6:
        _stream = FirebaseFirestore.instance
            .collection("Events")
            //.where("district", isEqualTo: district)
            .where('ID', isEqualTo: id)
            .where("present", isEqualTo: true)
            .snapshots();
        _stream1 = FirebaseFirestore.instance
            .collection("Gallery")
            .where("event", isEqualTo: id)
            .snapshots();
        break;
      case 7:
        _stream = FirebaseFirestore.instance
            .collection("Entertainment")
            //.where("district", isEqualTo: district)
            .where('ID', isEqualTo: id)
            .snapshots();
        _stream1 = FirebaseFirestore.instance
            .collection("Gallery")
            .where("entertainment", isEqualTo: id)
            .snapshots();
        break;
      case 8:
        _stream = FirebaseFirestore.instance
            .collection("Resturents")
            .where("ID", isEqualTo: id)
            .snapshots();
        _stream1 = FirebaseFirestore.instance
            .collection("Gallery")
            .where("resturent", isEqualTo: id)
            .snapshots();
        break;
      default:
        _stream = FirebaseFirestore.instance
            .collection(area)
            //.where("district", isEqualTo: district)
            .where("hiking_and_tracking", isEqualTo: true)
            .where('ID', isEqualTo: id)
            .snapshots();
        _stream1 = FirebaseFirestore.instance
            .collection("Gallery")
            .where("area", isEqualTo: id)
            .snapshots();
    }

    return StreamBuilder<QuerySnapshot>(
        stream: _stream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print("Something went wrong ");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }
          final List storeArea = [];
          snapshot.data!.docs.map((DocumentSnapshot e) {
            Map dis = e.data() as Map<String, dynamic>;
            storeArea.add(dis);
          }).toList();
          return Scaffold(
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
              title: Text(storeArea[0]['name'],
                  style: GoogleFonts.roboto(color: Colors.black, fontSize: 16)),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  // decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          // decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
                          width: double.infinity,
                          child: Image(
                            image: NetworkImage(
                              storeArea[0]['image'],
                            ),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  storeArea[0]['name'],
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Text(storeArea[0]['description'])
                            ]),
                      ),
                      // SizedBox(height: 20,),

                      // get direction
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            // ignore: deprecated_member_use
                            child: RaisedButton.icon(
                                color: Colors.blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                padding: EdgeInsets.fromLTRB(10, 5, 20, 5),
                                onPressed: () {},
                                icon: Icon(
                                  Icons.place_outlined,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  "Get Direction",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Column(children: [
                          // padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Gallery"),
                              TextButton(
                                  onPressed: () {
                                    // Navigator.pushNamed(
                                    //     context, MyRoute.chukailBandaGallery);
                                  },
                                  child: Text("View All")),
                            ],
                          ),
                          StreamBuilder(
                            stream: _stream1,
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasError) {
                                print("Something Went Wrong");
                              }
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              final List viewGallery = [];
                              snapshot.data!.docs
                                  .map((DocumentSnapshot documet) {
                                Map a = documet.data() as Map<String, dynamic>;
                                viewGallery.add(a);
                              }).toList();
                              return Container(
                                child: GridView.builder(
                                    shrinkWrap: true,
                                    itemCount: viewGallery.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                        child: InkWell(
                                          onTap: () {},
                                          child: Stack(
                                            alignment: Alignment.bottomLeft,
                                            children: [
                                              Card(
                                                clipBehavior: Clip.antiAlias,
                                                elevation: 4,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                ),
                                                child: Hero(
                                                  tag:
                                                      "hero-${index.toString()}",
                                                  child: Image.network(
                                                    // "assets/images/${imageData[index].imageName}",
                                                    viewGallery[index]["image"],
                                                    fit: BoxFit.cover,
                                                    height:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              );
                            },
                          )
                        ]),
                      )
                    ],
                  ),
                ),
              ),
            ),
            endDrawer: MyDrawer(),
            bottomNavigationBar: footer(),
          );
        });
  }
}
