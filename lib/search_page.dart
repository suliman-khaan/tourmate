import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'singleDistrict.dart';
import 'singleTransport.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
// ignore: unused_import
import 'package:matcher/matcher.dart';
import 'package:provider/provider.dart';
import 'hotel_view.dart';
import 'provider.dart';
import 'attribute_view.dart';
// import 'provider.dart';
// ignore: unused_import
import 'footer.dart';
import 'drawer.dart';
import 'view_best_distination.dart';
import 'datamodel.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // bool _isSearching = true;
  final TextEditingController searchController = TextEditingController();

  get prefixIcon => null;

  final Stream<QuerySnapshot> _alldistinationStream = FirebaseFirestore.instance
      .collection('Areas')
      .where("explored_area", isEqualTo: true)
      .snapshots();
  late ProductProvider productProvider;
  // late QuerySnapshot snapshotData;
  bool isExecuted = false;
  bool valueofsearch = true;
  String query = "";

  @override
  void initState() {
    //
    productProvider = Provider.of(context, listen: false);
    productProvider.fatchAreaData();
    // productProvider.fatchRestaurantList();
    // productProvider.fatchHoteltList();
    // productProvider.fatchEntertainmentsList();
    // productProvider.fatchEventsList();
    // productProvider.fatchTransporttList();
    // productProvider.fatchParksList();
    // productProvider.fatchAreaCatagoryData();
    // productProvider.fatchRestaurantData();
    // productProvider.fatchAllHotelsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);

    searchItem(String query) {
      List<ProductModel> searchDis =
          productProvider.getAllItems.where((element) {
        return element.areaName.toLowerCase().contains(query);
      }).toList();
      return searchDis;
    }

    List<ProductModel> _searchItem = searchItem(query);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
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
            "Search",
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          centerTitle: true,
        ),
        endDrawer: MyDrawer(),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                /* Contianer for Search Bar  */
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: TextFormField(
                      controller: searchController,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          valueofsearch = false;
                        } else {
                          valueofsearch = true;
                        }
                        setState(() {
                          query = value;
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(90.0)),
                        ),
                        prefixIcon: prefixIcon ??
                            Icon(Icons.search, color: Colors.black),
                        focusedBorder: UnderlineInputBorder(
                            //borderSide: BorderSide(color: Colors.black),
                            ),
                        hintText: "Search Your Destination",
                      ),
                    ),
                  ),
                ),
                // items of search
                Container(
                  child: valueofsearch
                      ? Container()
                      : Column(
                          children: _searchItem.map((e) {
                          return InkWell(
                            onTap: () {
                              if (e.type == "best_destination") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ViewDistination(areaID: e.id)));
                              } else if (e.type == "hotel") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HotelView(
                                              index: 1,
                                              id: e.id,
                                            )));
                              } else if (e.type == "district") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            singleDistrict(district: e.id)));
                              } else if (e.type == 'transport') {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            singleTransport(id: e.id)));
                              } else if (e.type == "restaurant") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            HotelView(id: e.id, index: 2)));
                              } else if (e.type == "park") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            HotelView(id: e.id, index: 3)));
                              } else if (e.type == "event") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DistrictAttributeContainer(
                                                areaIndex: 6, a_id: e.id)));
                              } else if (e.type == "entertainment") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DistrictAttributeContainer(
                                                areaIndex: 7, a_id: e.id)));
                              } else if (e.type == "historical_area") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DistrictAttributeContainer(
                                                areaIndex: 5, a_id: e.id)));
                              } else if (e.type == "explored_area") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DistrictAttributeContainer(
                                                areaIndex: 2, a_id: e.id)));
                              } else if (e.type == "hiking_and_tracking") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DistrictAttributeContainer(
                                                areaIndex: 3, a_id: e.id)));
                              } else {
                                print("Nothing to show");
                                print(e.type);
                                print(e.id);
                              }
                            },
                            child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(e.imageArea),
                                ),
                                title: Text(e.areaName)),
                          );
                        }).toList()),
                ),
                // Container for most visited area
                Container(
                  child: Column(
                    children: [
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SizedBox(
                            width: 200,
                            child: Text(
                              "Most Visited Areas",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                          ),
                        ),
                      ),
                      //   Most Vistied Areas
                      StreamBuilder(
                          stream: _alldistinationStream,
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              print("Something went Wrong");
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Container(
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }
                            final List allDistinationData = [];
                            snapshot.data!.docs
                                .map((DocumentSnapshot document) {
                              Map a = document.data() as Map<String, dynamic>;
                              allDistinationData.add(a);
                              // print(allDistinationData);
                            }).toList();
                            return Container(
                              child: Wrap(
                                children: allDistinationData
                                    .map((e) => Stack(
                                          alignment: Alignment.bottomLeft,
                                          children: [
                                            Container(
                                              height: 200,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2,
                                              child: GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              DistrictAttributeContainer(
                                                                  areaIndex: 2,
                                                                  a_id: e[
                                                                      'ID'])));
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5.0,
                                                          bottom: 10,
                                                          right: 5),
                                                  child: Card(
                                                    elevation: 4,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0)),
                                                    child: Stack(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      children: [
                                                        CachedNetworkImage(
                                                          imageUrl: e['image'],
                                                          imageBuilder: (context,
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
                                                        ),
                                                        Positioned(
                                                          bottom: 10,
                                                          left: 10,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.8),
                                                            child:
                                                                BackdropFilter(
                                                              filter: ImageFilter
                                                                  .blur(
                                                                      sigmaY:
                                                                          19.2,
                                                                      sigmaX:
                                                                          19.2),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: Text(
                                                                    e['name'],
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.w500)),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ))
                                    .toList(),
                              ),
                            );
                          }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: footer(tabIndex: 1),
      ),
    );
  }
}
