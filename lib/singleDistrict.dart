import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tourmate1/routes.dart';
import 'package:tourmate1/singleTraspComp.dart';
import 'attribute_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Areas.dart';
import 'drawer.dart';
import 'hotel_view.dart';
import 'singleDistrictAllHotel.dart';
import 'footer.dart';
import 'singleDistrictTransport.dart';
import 'singleDistrictAllResturent.dart';
import 'singleTransport.dart';
import 'view_best_distination.dart';

// ignore: camel_case_types
class singleDistrict extends StatefulWidget {
  const singleDistrict({Key? key, this.tabIndex = 0, required this.district})
      : super(key: key);
  final int tabIndex;
  final String district;
  @override
  _singleDistrictState createState() =>
      _singleDistrictState(district: this.district);
}

// ignore: camel_case_types
class _singleDistrictState extends State<singleDistrict>
    with SingleTickerProviderStateMixin {
  final String district;
  _singleDistrictState({required this.district});
  // ignore: unused_field
  int _current = 0;
  int tabLength = 4;
  dynamic _lineLength = 3;
  var bool;

  int _tabIndex = 0;

  late TabController _tabController;
  var districtStream;
  var regionStream;
  var historicalStream;
  var exploreStream;
  var hikingStream;
  var hotelStream;
  var resturantStream;
  var transportStream;
  var parkStream;
  var eventStream;
  var entStream;
  var slideStream;
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabLength);
    districtStream = FirebaseFirestore.instance
        .collection("District")
        .where("ID", isEqualTo: district)
        .snapshots();
    regionStream = FirebaseFirestore.instance
        .collection("Areas")
        .where("district", isEqualTo: district)
        .where("best_destination", isEqualTo: true)
        .snapshots();
    historicalStream = FirebaseFirestore.instance
        .collection("Areas")
        .where("district", isEqualTo: district)
        .where("historical", isEqualTo: true)
        .snapshots();
    exploreStream = FirebaseFirestore.instance
        .collection("Areas")
        .where("district", isEqualTo: district)
        .where("explored_area", isEqualTo: true)
        .snapshots();
    hikingStream = FirebaseFirestore.instance
        .collection("Areas")
        .where("district", isEqualTo: district)
        .where("hiking_and_tracking", isEqualTo: true)
        .snapshots();
    hotelStream = FirebaseFirestore.instance
        .collection("hotel")
        .where("district", isEqualTo: district)
        .snapshots();
    resturantStream = FirebaseFirestore.instance
        .collection("Resturents")
        .where("district", isEqualTo: district)
        .snapshots();
    transportStream = FirebaseFirestore.instance
        .collection("Transport")
        .where("district", isEqualTo: district)
        .snapshots();
    parkStream = FirebaseFirestore.instance
        .collection("Parks")
        .where("district", isEqualTo: district)
        .snapshots();
    eventStream = FirebaseFirestore.instance
        .collection("Events")
        .where("district", isEqualTo: district)
        .snapshots();
    entStream = FirebaseFirestore.instance
        .collection("Entertainment")
        .where("district", isEqualTo: district)
        .snapshots();
    // slideStream = slideStreamF();
    bool = false;
  }

  void _secondTab() {
    _tabIndex = _tabController.index + 1;
    _tabController.animateTo(_tabIndex);
  }

  void _thirdTab() {
    _tabIndex = _tabController.index + 2;
    _tabController.animateTo(_tabIndex);
  }

  void _fourthTab() {
    _tabIndex = _tabController.index + 3;
    _tabController.animateTo(_tabIndex);
  }

  // void _fifthTab() {
  //   _tabIndex = _tabController.index + 4;
  //   _tabController.animateTo(_tabIndex);
  // }

  @override
  Widget build(BuildContext context) {
    _tabController.index = widget.tabIndex;
    return StreamBuilder(
        stream: districtStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
                color: Colors.white,
                child: Center(child: CircularProgressIndicator()));
          }
          final List dist = [];
          snapshot.data!.docs.map((DocumentSnapshot e) {
            Map dataList = e.data() as Map<String, dynamic>;
            dist.add(dataList);
          }).toList();
          slideStream = FirebaseFirestore.instance
              .collection("Gallery")
              .where("name", isEqualTo: dist[0]['name'])
              .snapshots();
          return Material(
            child: DefaultTabController(
              length: tabLength,
              child: Scaffold(
                endDrawer: MyDrawer(),
                appBar: AppBar(
                    iconTheme: IconThemeData(color: Colors.black),
                    leading: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          size: 16,
                        )),
                    backgroundColor: Colors.white,
                    title: Text(
                      dist[0]['name'],
                      style: GoogleFonts.roboto(color: Colors.black),
                    ),
                    centerTitle: true,
                    elevation: 0,
                    bottom: TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      labelColor: Colors.blue,
                      unselectedLabelColor: Colors.black,
                      indicatorColor: Colors.blue,
                      indicatorWeight: 2.0,
                      unselectedLabelStyle: GoogleFonts.roboto(),
                      indicator: UnderlineTabIndicator(
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.blue),
                          insets: EdgeInsets.only(bottom: 8)),
                      labelStyle:
                          GoogleFonts.roboto(fontWeight: FontWeight.w700),
                      tabs: [
                        Tab(
                            icon: Icon(Icons.article_outlined),
                            text: "Overview"),
                        Tab(icon: Icon(Icons.home_outlined), text: "Hotel"),
                        Tab(
                            icon: Icon(Icons.restaurant_outlined),
                            text: "Restaurant"),
                        Tab(
                            icon: Icon(Icons.local_taxi_outlined),
                            text: "Transport"),
                      ],
                    )),
                body: Container(
                  child: TabBarView(
                      controller: _tabController,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        singleOverview(dist, slideStream),
                        PageSecond(dist: district),
                        pageThird(dist: district),
                        singleTransportDistrict(dist: district)
                      ]),
                ),
                bottomNavigationBar: footer(),
              ),
            ),
          );
        });
  }

  Widget singleOverview(dist, slideStream) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(alignment: Alignment.bottomLeft, children: [
              StreamBuilder(
                  stream: slideStream,
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                          height: 200,
                          child: Center(child: CircularProgressIndicator()));
                    }
                    if (snapshot.hasData) {
                      // ignore: non_constant_identifier_names
                      final List ImageList = [];
                      snapshot.data!.docs.map((DocumentSnapshot e) {
                        Map dataList = e.data() as Map<String, dynamic>;
                        ImageList.add(dataList);
                      }).toList();
                      return Container(
                        child: CarouselSlider(
                          options: CarouselOptions(
                              height: 200,
                              aspectRatio: 16 / 9,
                              viewportFraction: 1.0,
                              enlargeCenterPage: true,
                              enableInfiniteScroll: true,
                              autoPlay: true,
                              // onPageChanged: (index, reason) {
                              //   setState(() {
                              //     _current = index;
                              //   });
                              // },
                              autoPlayCurve: Curves.easeInToLinear),
                          items: List.generate(
                              ImageList.length,
                              (int index) => Container(
                                      child: CachedNetworkImage(
                                    imageUrl: ImageList[index]['image'],
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
                                  ))),
                        ),
                      );
                    } else {
                      return Container(
                          height: 200,
                          child: Center(
                              child: Text(
                            "Data Getting Failed from the server.\nPlease Make sure\nYour Internet Connection",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                color: Colors.red, fontSize: 18),
                          )));
                    }
                  }),
            ]),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(dist[0]['name'],
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        )),
                  ),
                  AnimatedCrossFade(
                    duration: Duration(milliseconds: 500),
                    crossFadeState: bool
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    firstChild: Text(
                      dist[0]['description'],
                      style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                    ),
                    secondChild: Text(
                      dist[0]['description'],
                      style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                      maxLines: _lineLength,
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.only(left: 0),
                        textStyle: TextStyle(fontSize: 14, color: Colors.blue)),
                    child: bool ? Text("Read Less") : Text("Read More"),
                    onPressed: () {
                      setState(() {
                        bool = !bool;
                      });
                      if (bool == true) {
                        _lineLength = null;
                      } else {
                        _lineLength = 3;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // ignore: deprecated_member_use
                      FlatButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, MyRoute.map),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          color: Colors.blue,
                          padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.place_outlined, color: Colors.white),
                                Text(
                                  "Get Direction",
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(width: 5)
                              ])),
                    ],
                  ),
                ],
              ),
            ),
            //***********Best Destination***********
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 10),
                    Text("Best Destination",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        )),
                    Expanded(child: Center()),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Areas(
                                      areaIndex: 1, dist: dist[0]['ID'])));
                        },
                        child: Text(
                          "View All",
                        )),
                    SizedBox(width: 10)
                  ],
                ),
                streamList(stream: regionStream, areaIndex: 1)
              ],
            ),
            /********Hotel********/
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 10),
                    Text("Hotels",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        )),
                    Expanded(child: Center()),
                    TextButton(
                        onPressed: _secondTab,
                        child: Text(
                          "View All",
                        )),
                    SizedBox(width: 10)
                  ],
                ),
                streamList(
                  stream: hotelStream,
                  areaIndex: 0,
                )
              ],
            ),
            /******Transportation******/
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 10),
                    Text("Transport",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        )),
                    Expanded(child: Center()),
                    TextButton(
                        onPressed: _fourthTab,
                        child: Text(
                          "View All",
                        )),
                    SizedBox(width: 10)
                  ],
                ),
                StreamBuilder(
                  stream: transportStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      print("SOMETHINGWRONG");
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    // ignore: non_constant_identifier_names
                    final List db_data = [];
                    snapshot.data!.docs.map((DocumentSnapshot e) {
                      Map dataList = e.data() as Map<String, dynamic>;
                      db_data.add(dataList);
                    }).toList();
                    return Container(
                      height: 200,
                      child: Stack(
                        children: [
                          Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              children: List.generate(
                                  db_data.length,
                                  (index) => Container(
                                        margin: const EdgeInsets.only(
                                            left: 10.0, right: 10.0),
                                        width: 250,
                                        child: GestureDetector(
                                          onTap: () {
                                            db_data[index]['local']
                                                ? Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            singleTransport(
                                                                id: db_data[
                                                                        index]
                                                                    ['ID'])))
                                                : Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            compSingle(
                                                                local: false,
                                                                dist: db_data[
                                                                        index][
                                                                    'district'])));
                                          },
                                          child: Card(
                                            margin: EdgeInsets.only(bottom: 10),
                                            elevation: 4,
                                            clipBehavior: Clip.antiAlias,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0)),
                                            child: Stack(
                                              alignment: Alignment.bottomLeft,
                                              children: [
                                                Hero(
                                                  tag: db_data[index]['ID'],
                                                  child: CachedNetworkImage(
                                                    imageUrl: db_data[index]
                                                        ['image'],
                                                    // height: 180,
                                                    imageBuilder: (context,
                                                            imageProvider) =>
                                                        Container(
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: imageProvider,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    placeholder: (context,
                                                            url) =>
                                                        Center(
                                                            child:
                                                                CircularProgressIndicator()),
                                                    errorWidget: (context, url,
                                                            error) =>
                                                        Center(
                                                            child: Icon(
                                                                Icons.error)),
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom: 10,
                                                  left: 10,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.8),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                          sigmaY: 19.2,
                                                          sigmaX: 19.2),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                                Icons
                                                                    .place_outlined,
                                                                color: Colors
                                                                    .white),
                                                            Text(
                                                                db_data[index]
                                                                    ['name'],
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )).toList(),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
            /***********Explored Area***********/
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 10),
                    Text("Explored Area",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        )),
                    Expanded(child: Center()),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Areas(
                                      areaIndex: 2, dist: dist[0]['ID'])));
                        },
                        child: Text(
                          "View All",
                        )),
                    SizedBox(width: 10)
                  ],
                ),
                streamList(
                  stream: exploreStream,
                  areaIndex: 2,
                )
              ],
            ),
            /************Hiking Area************/
            hikingStream == null
                ? Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Text("Hiking And Trecking Area",
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              )),
                          Expanded(child: Center()),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Areas(
                                            areaIndex: 3,
                                            dist: dist[0]['ID'])));
                              },
                              child: Text(
                                "View All",
                              )),
                          SizedBox(width: 10)
                        ],
                      ),
                      streamList(stream: hikingStream, areaIndex: 3)
                    ],
                  )
                : Text(""),
            /************Resturant***************/
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 10),
                    Text("Resturant",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        )),
                    Expanded(child: Center()),
                    TextButton(
                        onPressed: _thirdTab,
                        child: Text(
                          "View All",
                        )),
                    SizedBox(width: 10)
                  ],
                ),
                streamList(
                  stream: resturantStream,
                  areaIndex: 8,
                )
              ],
            ),
            /*********Parks********/
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 10),
                    Text("Parks",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        )),
                    Expanded(child: Center()),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Areas(
                                      areaIndex: 4, dist: dist[0]['ID'])));
                        },
                        child: Text(
                          "View All",
                        )),
                    SizedBox(width: 10)
                  ],
                ),
                streamList(stream: parkStream, areaIndex: 4)
              ],
            ),
            /***********Historical Places*************/
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 10),
                    Text("Historical Places",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        )),
                    Expanded(child: Center()),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Areas(
                                      areaIndex: 5, dist: dist[0]['ID'])));
                        },
                        child: Text(
                          "View All",
                        )),
                    SizedBox(width: 10)
                  ],
                ),
                streamList(stream: historicalStream, areaIndex: 5)
              ],
            ),
            /***********Events*************/
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 10),
                    Text("Events",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        )),
                    Expanded(child: Center()),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Areas(
                                      areaIndex: 6, dist: dist[0]['ID'])));
                        },
                        child: Text(
                          "View All",
                        )),
                    SizedBox(width: 10)
                  ],
                ),
                streamList(stream: eventStream, areaIndex: 6)
              ],
            ),
            /***********Entertainment*************/
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 10),
                    Text("Entertainment",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        )),
                    Expanded(child: Center()),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Areas(
                                      areaIndex: 7, dist: dist[0]['ID'])));
                        },
                        child: Text(
                          "View All",
                        )),
                    SizedBox(width: 10)
                  ],
                ),
                streamList(stream: entStream, areaIndex: 7)
              ],
            )
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class streamList extends StatelessWidget {
  const streamList({Key? key, required this.stream, required this.areaIndex})
      : super(key: key);

  final Stream<QuerySnapshot<Object?>> stream;
  final dynamic areaIndex;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          print("SOMETHINGWRONG");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        // ignore: non_constant_identifier_names
        final List db_data = [];
        snapshot.data!.docs.map((DocumentSnapshot e) {
          Map dataList = e.data() as Map<String, dynamic>;
          db_data.add(dataList);
        }).toList();
        return Container(
          height: 200,
          child: Stack(
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  children: List.generate(
                      db_data.length,
                      (index) => Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            width: 250,
                            child: GestureDetector(
                              onTap: () {
                                if (areaIndex == 1) {
                                  print(db_data[index]['ID']);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ViewDistination(
                                              areaID: db_data[index]['ID'])));
                                } else if (areaIndex == 0) {
                                  //hotel
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HotelView(
                                              index: 1,
                                              id: db_data[index]['ID'])));
                                } else if (areaIndex == 8) {
                                  //resturants
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HotelView(
                                              index: 2,
                                              id: db_data[index]['ID'])));
                                } else if (areaIndex == 4) {
                                  //parks
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HotelView(
                                              index: 3,
                                              id: db_data[index]['ID'])));
                                } else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DistrictAttributeContainer(
                                                areaIndex: areaIndex,
                                                a_id: db_data[index]['ID'],
                                              )));
                                }
                              },
                              child: Card(
                                margin: EdgeInsets.only(bottom: 10),
                                elevation: 4,
                                clipBehavior: Clip.antiAlias,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Hero(
                                      tag:
                                          "background:${db_data[index]['ID'].toString()}",
                                      child: CachedNetworkImage(
                                        imageUrl: db_data[index]['image'],
                                        imageBuilder:
                                            (context, imageProvider) =>
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
                                                Text(db_data[index]['name'],
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
                            ),
                          )).toList(),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
