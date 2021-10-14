import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'view_best_distination.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';

import 'footer.dart';

class AllDistinations extends StatefulWidget {
  const AllDistinations({Key? key}) : super(key: key);

  @override
  _AllDistinationsState createState() => _AllDistinationsState();
}

class _AllDistinationsState extends State<AllDistinations> {
  final Stream<QuerySnapshot> _alldistinationStream = FirebaseFirestore.instance
      .collection('Areas')
      .where("best_destination", isEqualTo: true)
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _alldistinationStream,
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
          final List allDistinationData = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            allDistinationData.add(a);
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
                      "Best Distinations",
                      style:
                          GoogleFonts.roboto(color: Colors.black, fontSize: 16),
                    )),
                body: GridView.builder(
                    itemCount: allDistinationData.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewDistination(
                                        areaID: allDistinationData[index]
                                            ['ID'])));
                          },
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Card(
                                margin: EdgeInsets.all(5.0),
                                elevation: 4,
                                clipBehavior: Clip.antiAlias,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Stack(
                                  alignment: Alignment.bottomLeft,
                                  children: [
                                    Hero(
                                      tag: "hero-${index.toString()}",
                                      child: 
                                      // Ink.image(
                                      //     image: NetworkImage(
                                      //         allDistinationData[index]
                                      //             ['image']),
                                      //     // height: 180,
                                      //     fit: BoxFit.cover),
                                      CachedNetworkImage(
                                                                  imageUrl: allDistinationData[
                                                                          index]
                                                                      ['image'],
                                                                  imageBuilder:
                                                                      (context,
                                                                              imageProvider) =>
                                                                          Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      image:
                                                                          DecorationImage(
                                                                        image:
                                                                            imageProvider,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  placeholder: (context,
                                                                          url) =>
                                                                      CircularProgressIndicator(),
                                                                  errorWidget: (context,
                                                                          url,
                                                                          error) =>
                                                                      Icon(Icons
                                                                          .error),
                                                                ),
                                    ),
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
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Icon(Icons.place_outlined,
                                                    color: Colors.white),
                                                Text(
                                                    allDistinationData[index]
                                                        ['name'],
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
