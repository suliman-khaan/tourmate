import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'drawer.dart';
import 'singleTransport.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'footer.dart';

// ignore: camel_case_types
class compSingle extends StatefulWidget {
  final bool local;
  final String dist;
  const compSingle({Key? key, required this.local, required this.dist})
      : super(key: key);

  @override
  _compSingleState createState() => _compSingleState();
}

// ignore: camel_case_types
class _compSingleState extends State<compSingle> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> transportNameStream = FirebaseFirestore.instance
        .collection("Transport")
        .where("district", isEqualTo: widget.dist)
        .where("local", isEqualTo: widget.local)
        .snapshots();
    return StreamBuilder(
        stream: transportNameStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          final List name = [];
          snapshot.data!.docs.map((DocumentSnapshot e) {
            Map nlist = e.data() as Map<String, dynamic>;
            name.add(nlist);
          }).toList();
          return Material(
              child: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                title: Text(name[0]['company'],
                    style: TextStyle(color: Colors.black)),
                centerTitle: true,
                leading: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios_new,
                      color: Colors.black, size: 16.0),
                ),
                actions: [
                  Builder(
                      builder: (context) => IconButton(
                          onPressed: () {
                            Scaffold.of(context).openEndDrawer();
                          },
                          icon: Icon(Icons.menu, color: Colors.black)))
                ],
              ),
              endDrawer: MyDrawer(),
              body: Container(
                padding: EdgeInsets.only(top: 10.0),
                child: GridView.count(
                    crossAxisCount: 1,
                    childAspectRatio: 1 / 0.5,
                    children: List.generate(name.length, (index) {
                      return Card(
                        margin: EdgeInsets.only(
                            bottom: 10, left: 10.0, right: 10.0),
                        elevation: 4,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => singleTransport(
                                            id: name[index]['ID'])));
                              },
                              child: Hero(
                                tag: "img-${name[0]['ID']}",
                                child: Image(
                                    image: NetworkImage(name[index]['image']),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 10,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4.8),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaY: 19.2, sigmaX: 19.2),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Icon(Icons.local_taxi_outlined,
                                            color: Colors.black),
                                        Text(name[index]['name'],
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    })),
              ),
              bottomNavigationBar: footer(),
            ),
          ));
        });
  }
}
