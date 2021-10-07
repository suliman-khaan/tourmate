import 'package:dotted_line/dotted_line.dart';
import 'package:tourmate1/teamMembersClass.dart';
import 'footer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'drawer.dart';
class TeamMembers extends StatefulWidget {
  @override
  _TeamMembersState createState() => _TeamMembersState();
}

class _TeamMembersState extends State<TeamMembers> {
  List<Quotes> teamList = [
    Quotes(
        name: "Fahim Ullah",
        email: "fahimullah@gmail.com",
        image: 'assets/images/fahim.jpg',
        rank: 'CEO',
        contact: '03469794125',
        description:
            'What Is Chief Executive Officer (CEO)?A chief executive officer (CEO) is the highest-ranking executive in a company, whose primary responsibilities include making major corporate decisions, managing the overall operations and resources of a company, acting as the main point of communication between the board of directors (the board) and corporate operations and being the public face of the company. A CEO is elected by the board and its shareholders.',
        facebook: 'Fahimullahofficial',
         dashes: 40),
  ];
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        endDrawer: MyDrawer(),
        bottomNavigationBar: footer(),
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
              "Our Team",
              style: GoogleFonts.roboto(color: Colors.black, fontSize: 16),
            )),
        body: SingleChildScrollView(
            child: Container(
                decoration: BoxDecoration(color: Colors.white),
                padding: EdgeInsets.all(8),
                child: Column(
                  children: teamList.map((e) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      elevation: 5,
                      color: Colors.grey[200],
                      clipBehavior: Clip.antiAlias,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Container(
                              width: 200,
                              height: 200,
                              child: CircleAvatar(
                                backgroundImage: AssetImage(e.image),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              child: Column(
                                children: [
                                  Text(
                                    e.name,
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "CEO",
                                    style: TextStyle(
                                        // decoration: TextDecoration.underline,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold

                                        ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: DottedLine(
                                      direction: Axis.horizontal,
                                      dashLength: 10,
                                      lineLength: e.dashes,
                                      dashColor: Colors.black,
                                      lineThickness: 4,
                                      dashGapRadius: 10,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(e.description),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(left: 8),
                                    child: Column(
                                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {},
                                                child: Icon(
                                                    Icons.call_end_sharp,
                                                    size: 24,
                                                    color: Colors.green),
                                                style: ButtonStyle(
                                                  shape:
                                                      MaterialStateProperty.all(
                                                          CircleBorder()),
                                                  padding:
                                                      MaterialStateProperty.all(
                                                          EdgeInsets.all(8)),
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors
                                                              .white), // <-- Button color
                                                  overlayColor:
                                                      MaterialStateProperty
                                                          .resolveWith<Color?>(
                                                              (states) {
                                                    if (states.contains(
                                                        MaterialState.pressed))
                                                      return Colors
                                                          .red; // <-- Splash color
                                                  }),
                                                ),
                                              ),
                                              SizedBox(width: 15),
                                              Text(e.contact,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {},
                                                child: Icon(
                                                  Icons.mail,
                                                  size: 18,
                                                  color: Colors.red,
                                                ),
                                                style: ButtonStyle(
                                                  shape:
                                                      MaterialStateProperty.all(
                                                          CircleBorder()),
                                                  padding:
                                                      MaterialStateProperty.all(
                                                          EdgeInsets.all(8)),
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors
                                                              .white), // <-- Button color
                                                  overlayColor:
                                                      MaterialStateProperty
                                                          .resolveWith<Color?>(
                                                              (states) {
                                                    if (states.contains(
                                                        MaterialState.pressed))
                                                      return Colors
                                                          .red; // <-- Splash color
                                                  }),
                                                ),
                                              ),
                                              SizedBox(width: 15),
                                              Text(e.email,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {},
                                                child: Icon(Icons.facebook,
                                                    size: 24,
                                                    color: Colors.blue[900]),
                                                style: ButtonStyle(
                                                  shape:
                                                      MaterialStateProperty.all(
                                                          CircleBorder()),
                                                  padding:
                                                      MaterialStateProperty.all(
                                                          EdgeInsets.all(8)),
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors
                                                              .white), // <-- Button color
                                                  overlayColor:
                                                      MaterialStateProperty
                                                          .resolveWith<Color?>(
                                                              (states) {
                                                    if (states.contains(
                                                        MaterialState.pressed))
                                                      return Colors
                                                          .red; // <-- Splash color
                                                  }),
                                                ),
                                              ),
                                              SizedBox(width: 15),
                                              Text(e.facebook,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          )
                                        ]),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                )
                /*          
              child: Column(children: [
               
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  elevation: 5,
                  color: Colors.grey[200],
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/fahim.jpg"),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Column(
                            children: [
                              Text(
                                "Fahim Ullah",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "CEO",
                                style: TextStyle(
                                    // decoration: TextDecoration.underline,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 8),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: DottedLine(
                                  direction: Axis.horizontal,
                                  dashLength: 10,
                                  lineLength: 40,
                                  dashColor: Colors.black,
                                  lineThickness: 4,
                                  dashGapRadius: 10,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      "What Is Chief Executive Officer (CEO)?A chief executive officer (CEO) is the highest-ranking executive in a company, whose primary responsibilities include making major corporate decisions, managing the overall operations and resources of a company, acting as the main point of communication between the board of directors (the board) and corporate operations and being the public face of the company. A CEO is elected by the board and its shareholders."),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 8),
                                child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {},
                                            child: Icon(Icons.call_end_sharp,
                                                size: 24, color: Colors.green),
                                            style: ButtonStyle(
                                              shape: MaterialStateProperty.all(
                                                  CircleBorder()),
                                              padding:
                                                  MaterialStateProperty.all(
                                                      EdgeInsets.all(8)),
                                              backgroundColor:
                                                  MaterialStateProperty.all(Colors
                                                      .white), // <-- Button color
                                              overlayColor:
                                                  MaterialStateProperty
                                                      .resolveWith<Color?>(
                                                          (states) {
                                                if (states.contains(
                                                    MaterialState.pressed))
                                                  return Colors
                                                      .red; // <-- Splash color
                                              }),
                                            ),
                                          ),
                                          SizedBox(width: 15),
                                          Text("034799977272",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {},
                                            child: Icon(
                                              Icons.mail,
                                              size: 18,
                                              color: Colors.red,
                                            ),
                                            style: ButtonStyle(
                                              shape: MaterialStateProperty.all(
                                                  CircleBorder()),
                                              padding:
                                                  MaterialStateProperty.all(
                                                      EdgeInsets.all(8)),
                                              backgroundColor:
                                                  MaterialStateProperty.all(Colors
                                                      .white), // <-- Button color
                                              overlayColor:
                                                  MaterialStateProperty
                                                      .resolveWith<Color?>(
                                                          (states) {
                                                if (states.contains(
                                                    MaterialState.pressed))
                                                  return Colors
                                                      .red; // <-- Splash color
                                              }),
                                            ),
                                          ),
                                          SizedBox(width: 15),
                                          Text("fahimullah@gmail.com",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {},
                                            child: Icon(Icons.facebook,
                                                size: 24,
                                                color: Colors.blue[900]),
                                            style: ButtonStyle(
                                              shape: MaterialStateProperty.all(
                                                  CircleBorder()),
                                              padding:
                                                  MaterialStateProperty.all(
                                                      EdgeInsets.all(8)),
                                              backgroundColor:
                                                  MaterialStateProperty.all(Colors
                                                      .white), // <-- Button color
                                              overlayColor:
                                                  MaterialStateProperty
                                                      .resolveWith<Color?>(
                                                          (states) {
                                                if (states.contains(
                                                    MaterialState.pressed))
                                                  return Colors
                                                      .red; // <-- Splash color
                                              }),
                                            ),
                                          ),
                                          SizedBox(width: 15),
                                          Text("Fahil Ullah ",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      )
                                    ]),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )]),
                
                */
                //   Card(
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(8)),
                //     elevation: 5,
                //     color: Colors.grey[200],
                //     clipBehavior: Clip.antiAlias,
                //     child: Container(
                //       padding: EdgeInsets.all(8),
                //       child: Column(
                //         children: [
                //           Container(
                //             width: 200,
                //             height: 200,
                //             child: CircleAvatar(
                //               backgroundImage: AssetImage(
                //                 "assets/images/saad.jpeg",
                //               ),
                //             ),
                //           ),
                //           Container(
                //             margin: EdgeInsets.only(top: 15),
                //             child: Column(
                //               children: [
                //                 Text(
                //                   "Mr. Saad Khan",
                //                   style: TextStyle(
                //                       fontSize: 18.0,
                //                       color: Colors.blue,
                //                       fontWeight: FontWeight.bold),
                //                 ),
                //                 Text(
                //                   "Co-Founder",
                //                   style: TextStyle(
                //                     // decoration: TextDecoration.underline,
                //                     color: Colors.black,
                //                     fontWeight: FontWeight.bold,
                //                   ),
                //                 ),
                //                 Container(
                //                   margin: EdgeInsets.only(top: 5),
                //                   child: DottedLine(
                //                     direction: Axis.horizontal,
                //                     dashLength: 10,
                //                     lineLength: 60,
                //                     dashColor: Colors.black,
                //                     lineThickness: 4,
                //                     dashGapRadius: 10,
                //                   ),
                //                 ),
                //                 SizedBox(
                //                   height: 5,
                //                 ),
                //                 Container(
                //                   child: Padding(
                //                     padding: const EdgeInsets.all(8.0),
                //                     child: Text(
                //                         "A co-founder is a member of the executive team who played a role in the founding of a company. This person typically works with other founders to create and launch a business. A co-founder usually shares certain responsibilities with the other co-founders"),
                //                   ),
                //                 ),
                //                 Container(
                //                   padding: EdgeInsets.only(left: 8),
                //                   child: Column(
                //                       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //                       children: [
                //                         Row(
                //                           children: [
                //                             ElevatedButton(
                //                               onPressed: () {},
                //                               child: Icon(
                //                                 Icons.call_end_sharp,
                //                                 size: 14,
                //                                 color: Colors.green,
                //                               ),
                //                               style: ButtonStyle(
                //                                 shape: MaterialStateProperty.all(
                //                                     CircleBorder()),
                //                                 padding:
                //                                     MaterialStateProperty.all(
                //                                         EdgeInsets.all(15)),
                //                                 backgroundColor:
                //                                     MaterialStateProperty.all(Colors
                //                                         .white), // <-- Button color
                //                                 overlayColor:
                //                                     MaterialStateProperty
                //                                         .resolveWith<Color?>(
                //                                             (states) {
                //                                   if (states.contains(
                //                                       MaterialState.pressed))
                //                                     return Colors
                //                                         .red; // <-- Splash color
                //                                 }),
                //                               ),
                //                             ),
                //                             SizedBox(width: 15),
                //                             Text("034799977222",
                //                                 style: TextStyle(
                //                                     fontSize: 14,
                //                                     fontWeight: FontWeight.bold)),
                //                           ],
                //                         ),
                //                         SizedBox(height: 5),
                //                         Row(
                //                           children: [
                //                             ElevatedButton(
                //                               onPressed: () {},
                //                               child: Icon(
                //                                 Icons.mail,
                //                                 size: 14,
                //                                 color: Colors.red,
                //                               ),
                //                               style: ButtonStyle(
                //                                 shape: MaterialStateProperty.all(
                //                                     CircleBorder()),
                //                                 padding:
                //                                     MaterialStateProperty.all(
                //                                         EdgeInsets.all(15)),
                //                                 backgroundColor:
                //                                     MaterialStateProperty.all(Colors
                //                                         .white), // <-- Button color
                //                                 overlayColor:
                //                                     MaterialStateProperty
                //                                         .resolveWith<Color?>(
                //                                             (states) {
                //                                   if (states.contains(
                //                                       MaterialState.pressed))
                //                                     return Colors
                //                                         .red; // <-- Splash color
                //                                 }),
                //                               ),
                //                             ),
                //                             SizedBox(width: 15),
                //                             Text("Saddkhan123@gmail.com",
                //                                 style: TextStyle(
                //                                     fontSize: 14,
                //                                     fontWeight: FontWeight.bold)),
                //                           ],
                //                         ),
                //                         SizedBox(height: 5),
                //                         Row(
                //                           children: [
                //                             ElevatedButton(
                //                               onPressed: () {},
                //                               child: Icon(Icons.facebook,
                //                                   size: 14,
                //                                   color: Colors.blue[900]),
                //                               style: ButtonStyle(
                //                                 shape: MaterialStateProperty.all(
                //                                     CircleBorder()),
                //                                 padding:
                //                                     MaterialStateProperty.all(
                //                                         EdgeInsets.all(15)),
                //                                 backgroundColor:
                //                                     MaterialStateProperty.all(Colors
                //                                         .white), // <-- Button color
                //                                 overlayColor:
                //                                     MaterialStateProperty
                //                                         .resolveWith<Color?>(
                //                                             (states) {
                //                                   if (states.contains(
                //                                       MaterialState.pressed))
                //                                     return Colors
                //                                         .red; // <-- Splash color
                //                                 }),
                //                               ),
                //                             ),
                //                             SizedBox(width: 15),
                //                             Text("Saad khan ",
                //                                 style: TextStyle(
                //                                     fontSize: 14,
                //                                     fontWeight: FontWeight.bold)),
                //                           ],
                //                         )
                //                       ]),
                //                 )
                //               ],
                //             ),
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                //   Card(
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(8)),
                //     elevation: 5,
                //     color: Colors.grey[200],
                //     clipBehavior: Clip.antiAlias,
                //     child: Container(
                //       padding: EdgeInsets.all(8),
                //       child: Column(
                //         children: [
                //           Container(
                //             width: 200,
                //             height: 200,
                //             child: CircleAvatar(
                //               backgroundImage:
                //                   AssetImage("assets/images/Suliman.jpg"),
                //             ),
                //           ),
                //           Container(
                //             margin: EdgeInsets.only(top: 15),
                //             child: Column(
                //               children: [
                //                 Text(
                //                   "Sayed Suliman",
                //                   style: TextStyle(
                //                       fontSize: 18.0,
                //                       color: Colors.blue,
                //                       fontWeight: FontWeight.bold),
                //                 ),
                //                 Text(
                //                   "Technical Manager",
                //                   style: TextStyle(
                //                     // decoration: TextDecoration.underline,
                //                     color: Colors.black,
                //                     fontWeight: FontWeight.bold,
                //                   ),
                //                 ),
                //                 Container(
                //                   margin: EdgeInsets.only(top: 5),
                //                   child: DottedLine(
                //                     direction: Axis.horizontal,
                //                     dashLength: 10,
                //                     lineLength: 80,
                //                     dashColor: Colors.black,
                //                     lineThickness: 4,
                //                     dashGapRadius: 10,
                //                   ),
                //                 ),
                //                 SizedBox(
                //                   height: 5,
                //                 ),
                //                 Container(
                //                   child: Padding(
                //                     padding: const EdgeInsets.all(8.0),
                //                     child: Text(
                //                         "he technical manager is the point person for any issues that arise within the team. They are responsible for making key decisions for technical issues related to the company after considering everything from cost to quality of hardware or software. "),
                //                   ),
                //                 ),
                //                 Container(
                //                   padding: EdgeInsets.only(left: 8),
                //                   child: Column(
                //                       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //                       children: [
                //                         Row(
                //                           children: [
                //                             ElevatedButton(
                //                               onPressed: () {},
                //                               child: Icon(
                //                                 Icons.call_end_sharp,
                //                                 size: 14,
                //                                 color: Colors.green,
                //                               ),
                //                               style: ButtonStyle(
                //                                 shape: MaterialStateProperty.all(
                //                                     CircleBorder()),
                //                                 padding:
                //                                     MaterialStateProperty.all(
                //                                         EdgeInsets.all(15)),
                //                                 backgroundColor:
                //                                     MaterialStateProperty.all(Colors
                //                                         .white), // <-- Button color
                //                                 overlayColor:
                //                                     MaterialStateProperty
                //                                         .resolveWith<Color?>(
                //                                             (states) {
                //                                   if (states.contains(
                //                                       MaterialState.pressed))
                //                                     return Colors
                //                                         .red; // <-- Splash color
                //                                 }),
                //                               ),
                //                             ),
                //                             SizedBox(width: 15),
                //                             Text("03469794125",
                //                                 style: TextStyle(
                //                                     fontSize: 14,
                //                                     fontWeight: FontWeight.bold)),
                //                           ],
                //                         ),
                //                         SizedBox(height: 5),
                //                         Row(
                //                           children: [
                //                             ElevatedButton(
                //                               onPressed: () {},
                //                               child: Icon(
                //                                 Icons.mail,
                //                                 size: 14,
                //                                 color: Colors.red,
                //                               ),
                //                               style: ButtonStyle(
                //                                 shape: MaterialStateProperty.all(
                //                                     CircleBorder()),
                //                                 padding:
                //                                     MaterialStateProperty.all(
                //                                         EdgeInsets.all(15)),
                //                                 backgroundColor:
                //                                     MaterialStateProperty.all(Colors
                //                                         .white), // <-- Button color
                //                                 overlayColor:
                //                                     MaterialStateProperty
                //                                         .resolveWith<Color?>(
                //                                             (states) {
                //                                   if (states.contains(
                //                                       MaterialState.pressed))
                //                                     return Colors
                //                                         .red; // <-- Splash color
                //                                 }),
                //                               ),
                //                             ),
                //                             SizedBox(width: 15),
                //                             Text("sulimasayed003@gmail.com",
                //                                 style: TextStyle(
                //                                     fontSize: 14,
                //                                     fontWeight: FontWeight.bold)),
                //                           ],
                //                         ),
                //                         SizedBox(height: 5),
                //                         Row(
                //                           children: [
                //                             ElevatedButton(
                //                               onPressed: () {},
                //                               child: Icon(Icons.facebook,
                //                                   size: 14,
                //                                   color: Colors.blue[900]),
                //                               style: ButtonStyle(
                //                                 shape: MaterialStateProperty.all(
                //                                     CircleBorder()),
                //                                 padding:
                //                                     MaterialStateProperty.all(
                //                                         EdgeInsets.all(15)),
                //                                 backgroundColor:
                //                                     MaterialStateProperty.all(Colors
                //                                         .white), // <-- Button color
                //                                 overlayColor:
                //                                     MaterialStateProperty
                //                                         .resolveWith<Color?>(
                //                                             (states) {
                //                                   if (states.contains(
                //                                       MaterialState.pressed))
                //                                     return Colors
                //                                         .red; // <-- Splash color
                //                                 }),
                //                               ),
                //                             ),
                //                             SizedBox(width: 15),
                //                             Text("Sayed Suliman",
                //                                 style: TextStyle(
                //                                     fontSize: 14,
                //                                     fontWeight: FontWeight.bold)),
                //                           ],
                //                         )
                //                       ]),
                //                 )
                //               ],
                //             ),
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                //   Card(
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(8)),
                //     elevation: 5,
                //     color: Colors.grey[200],
                //     clipBehavior: Clip.antiAlias,
                //     child: Container(
                //       padding: EdgeInsets.all(8),
                //       child: Column(
                //         children: [
                //           Container(
                //             width: 200,
                //             height: 200,
                //             child: CircleAvatar(
                //               backgroundImage:
                //                   AssetImage("assets/images/Shiekh.jpg"),
                //             ),
                //           ),
                //           Container(
                //             margin: EdgeInsets.only(top: 15),
                //             child: Column(
                //               children: [
                //                 Text(
                //                   "Suliman Khan",
                //                   style: TextStyle(
                //                       fontSize: 18.0,
                //                       color: Colors.blue,
                //                       fontWeight: FontWeight.bold),
                //                 ),
                //                 Text(
                //                   "App Developer",
                //                   style: TextStyle(
                //                     // decoration: TextDecoration.underline,
                //                     color: Colors.black,
                //                     fontWeight: FontWeight.bold,
                //                   ),
                //                 ),
                //                 Container(
                //                   margin: EdgeInsets.only(top: 5),
                //                   child: DottedLine(
                //                     direction: Axis.horizontal,
                //                     dashLength: 10,
                //                     lineLength: 60,
                //                     dashColor: Colors.black,
                //                     lineThickness: 4,
                //                     dashGapRadius: 10,
                //                   ),
                //                 ),
                //                 SizedBox(
                //                   height: 5,
                //                 ),
                //                 Container(
                //                   child: Padding(
                //                     padding: const EdgeInsets.all(8.0),
                //                     child: Text(
                //                         "If you are hiring a Software Developer professional, the job description can feature: Researching, designing, implementing, and managing software programs. Testing and evaluating new programs. ... Deploying software tools, processes, and metrics. Maintaining and upgrading existing systems. "),
                //                   ),
                //                 ),
                //                 Container(
                //                   padding: EdgeInsets.only(left: 8),
                //                   child: Column(
                //                       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //                       children: [
                //                         Row(
                //                           children: [
                //                             ElevatedButton(
                //                               onPressed: () {},
                //                               child: Icon(
                //                                 Icons.call_end_sharp,
                //                                 size: 14,
                //                                 color: Colors.green,
                //                               ),
                //                               style: ButtonStyle(
                //                                 shape: MaterialStateProperty.all(
                //                                     CircleBorder()),
                //                                 padding:
                //                                     MaterialStateProperty.all(
                //                                         EdgeInsets.all(15)),
                //                                 backgroundColor:
                //                                     MaterialStateProperty.all(Colors
                //                                         .white), // <-- Button color
                //                                 overlayColor:
                //                                     MaterialStateProperty
                //                                         .resolveWith<Color?>(
                //                                             (states) {
                //                                   if (states.contains(
                //                                       MaterialState.pressed))
                //                                     return Colors
                //                                         .red; // <-- Splash color
                //                                 }),
                //                               ),
                //                             ),
                //                             SizedBox(width: 15),
                //                             Text("034897126633",
                //                                 style: TextStyle(
                //                                     fontSize: 14,
                //                                     fontWeight: FontWeight.bold)),
                //                           ],
                //                         ),
                //                         SizedBox(height: 5),
                //                         Row(
                //                           children: [
                //                             ElevatedButton(
                //                               onPressed: () {},
                //                               child: Icon(
                //                                 Icons.mail,
                //                                 size: 14,
                //                                 color: Colors.red,
                //                               ),
                //                               style: ButtonStyle(
                //                                 shape: MaterialStateProperty.all(
                //                                     CircleBorder()),
                //                                 padding:
                //                                     MaterialStateProperty.all(
                //                                         EdgeInsets.all(15)),
                //                                 backgroundColor:
                //                                     MaterialStateProperty.all(Colors
                //                                         .white), // <-- Button color
                //                                 overlayColor:
                //                                     MaterialStateProperty
                //                                         .resolveWith<Color?>(
                //                                             (states) {
                //                                   if (states.contains(
                //                                       MaterialState.pressed))
                //                                     return Colors
                //                                         .red; // <-- Splash color
                //                                 }),
                //                               ),
                //                             ),
                //                             SizedBox(width: 15),
                //                             Text("sulimank48@gmail.com",
                //                                 style: TextStyle(
                //                                     fontSize: 14,
                //                                     fontWeight: FontWeight.bold)),
                //                           ],
                //                         ),
                //                         SizedBox(height: 5),
                //                         Row(
                //                           children: [
                //                             ElevatedButton(
                //                               onPressed: () {},
                //                               child: Icon(Icons.facebook,
                //                                   size: 14,
                //                                   color: Colors.blue[900]),
                //                               style: ButtonStyle(
                //                                 shape: MaterialStateProperty.all(
                //                                     CircleBorder()),
                //                                 padding:
                //                                     MaterialStateProperty.all(
                //                                         EdgeInsets.all(15)),
                //                                 backgroundColor:
                //                                     MaterialStateProperty.all(Colors
                //                                         .white), // <-- Button color
                //                                 overlayColor:
                //                                     MaterialStateProperty
                //                                         .resolveWith<Color?>(
                //                                             (states) {
                //                                   if (states.contains(
                //                                       MaterialState.pressed))
                //                                     return Colors
                //                                         .red; // <-- Splash color
                //                                 }),
                //                               ),
                //                             ),
                //                             SizedBox(width: 15),
                //                             Text("Suliman Khan",
                //                                 style: TextStyle(
                //                                     fontSize: 14,
                //                                     fontWeight: FontWeight.bold)),
                //                           ],
                //                         )
                //                       ]),
                //                 )
                //               ],
                //             ),
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                //   Card(
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(8)),
                //     elevation: 5,
                //     color: Colors.grey[200],
                //     clipBehavior: Clip.antiAlias,
                //     child: Container(
                //       padding: EdgeInsets.all(8),
                //       child: Column(
                //         children: [
                //           Container(
                //             width: 200,
                //             height: 200,
                //             child: CircleAvatar(
                //               backgroundImage:
                //                   AssetImage("assets/images/bashir.jpg"),
                //             ),
                //           ),
                //           Container(
                //             margin: EdgeInsets.only(top: 15),
                //             child: Column(
                //               children: [
                //                 Text(
                //                   "Mr.Bashir Ullah",
                //                   style: TextStyle(
                //                       fontSize: 18.0,
                //                       color: Colors.blue,
                //                       fontWeight: FontWeight.bold),
                //                 ),
                //                 Text(
                //                   "Graphic Designer",
                //                   style: TextStyle(
                //                     // decoration: TextDecoration.underline,
                //                     color: Colors.black,
                //                     fontWeight: FontWeight.bold,
                //                   ),
                //                 ),
                //                 Container(
                //                   margin: EdgeInsets.only(top: 5),
                //                   child: DottedLine(
                //                     direction: Axis.horizontal,
                //                     dashLength: 10,
                //                     lineLength: 60,
                //                     dashColor: Colors.black,
                //                     lineThickness: 4,
                //                     dashGapRadius: 10,
                //                   ),
                //                 ),
                //                 SizedBox(
                //                   height: 5,
                //                 ),
                //                 Container(
                //                   child: Padding(
                //                     padding: const EdgeInsets.all(8.0),
                //                     child: Text(
                //                         "Graphic designers/artists design graphics for use in media products such as magazines, labels, advertising and signage. ... developing concepts, graphics and layouts for product illustrations, company logos and websites. determining size and arrangement of copy and illustrative material, as well as font style and size "),
                //                   ),
                //                 ),
                //                 Container(
                //                   padding: EdgeInsets.only(left: 8),
                //                   child: Column(
                //                       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //                       children: [
                //                         Row(
                //                           children: [
                //                             ElevatedButton(
                //                               onPressed: () {},
                //                               child: Icon(
                //                                 Icons.call_end_sharp,
                //                                 size: 14,
                //                                 color: Colors.green,
                //                               ),
                //                               style: ButtonStyle(
                //                                 shape: MaterialStateProperty.all(
                //                                     CircleBorder()),
                //                                 padding:
                //                                     MaterialStateProperty.all(
                //                                         EdgeInsets.all(15)),
                //                                 backgroundColor:
                //                                     MaterialStateProperty.all(Colors
                //                                         .white), // <-- Button color
                //                                 overlayColor:
                //                                     MaterialStateProperty
                //                                         .resolveWith<Color?>(
                //                                             (states) {
                //                                   if (states.contains(
                //                                       MaterialState.pressed))
                //                                     return Colors
                //                                         .red; // <-- Splash color
                //                                 }),
                //                               ),
                //                             ),
                //                             SizedBox(width: 15),
                //                             Text("03481231333",
                //                                 style: TextStyle(
                //                                     fontSize: 14,
                //                                     fontWeight: FontWeight.bold)),
                //                           ],
                //                         ),
                //                         SizedBox(height: 5),
                //                         Row(
                //                           children: [
                //                             ElevatedButton(
                //                               onPressed: () {},
                //                               child: Icon(
                //                                 Icons.mail,
                //                                 size: 14,
                //                                 color: Colors.red,
                //                               ),
                //                               style: ButtonStyle(
                //                                 shape: MaterialStateProperty.all(
                //                                     CircleBorder()),
                //                                 padding:
                //                                     MaterialStateProperty.all(
                //                                         EdgeInsets.all(15)),
                //                                 backgroundColor:
                //                                     MaterialStateProperty.all(Colors
                //                                         .white), // <-- Button color
                //                                 overlayColor:
                //                                     MaterialStateProperty
                //                                         .resolveWith<Color?>(
                //                                             (states) {
                //                                   if (states.contains(
                //                                       MaterialState.pressed))
                //                                     return Colors
                //                                         .red; // <-- Splash color
                //                                 }),
                //                               ),
                //                             ),
                //                             SizedBox(width: 15),
                //                             Text("mrbashirkhan122@gmail.com",
                //                                 style: TextStyle(
                //                                     fontSize: 14,
                //                                     fontWeight: FontWeight.bold)),
                //                           ],
                //                         ),
                //                         SizedBox(height: 5),
                //                         Row(
                //                           children: [
                //                             ElevatedButton(
                //                               onPressed: () {},
                //                               child: Icon(Icons.facebook,
                //                                   size: 14,
                //                                   color: Colors.blue[900]),
                //                               style: ButtonStyle(
                //                                 shape: MaterialStateProperty.all(
                //                                     CircleBorder()),
                //                                 padding:
                //                                     MaterialStateProperty.all(
                //                                         EdgeInsets.all(15)),
                //                                 backgroundColor:
                //                                     MaterialStateProperty.all(Colors
                //                                         .white), // <-- Button color
                //                                 overlayColor:
                //                                     MaterialStateProperty
                //                                         .resolveWith<Color?>(
                //                                             (states) {
                //                                   if (states.contains(
                //                                       MaterialState.pressed))
                //                                     return Colors
                //                                         .red; // <-- Splash color
                //                                 }),
                //                               ),
                //                             ),
                //                             SizedBox(width: 15),
                //                             Text("Bashir Ullah Khan",
                //                                 style: TextStyle(
                //                                     fontSize: 14,
                //                                     fontWeight: FontWeight.bold)),
                //                           ],
                //                         )
                //                       ]),
                //                 )
                //               ],
                //             ),
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                )),
      ),
    );

    // child: Container(

    // ),
  }
}
