import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import 'footer.dart';

class AboutUS extends StatefulWidget {
  const AboutUS({Key? key}) : super(key: key);

  @override
  _AboutUSState createState() => _AboutUSState();
}

class _AboutUSState extends State<AboutUS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 16,
            color: Colors.blue,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("About Us", style: GoogleFonts.roboto(color: Colors.blue)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //  FIrst row
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff7c94b6),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter: new ColorFilter.mode(
                              Colors.black.withOpacity(0.7), BlendMode.dstATop),
                          image: NetworkImage(
                              "https://image.freepik.com/free-vector/green-curve-abstract-background_53876-99569.jpg"))),
                  child: Column(
                    children: [
                      Text("Our Mission",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                          "Our Mission is to maximize travel and tourism oppertuinities throughout the northen Areas, build economic prosperity  and spread the dynamic image of our country around the world",
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                // 2nd row
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff7c94b6),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter: new ColorFilter.mode(
                              Colors.black.withOpacity(0.7), BlendMode.dstATop),
                          image: NetworkImage(
                              "https://img.freepik.com/free-photo/nature-design-with-bokeh-effect_1048-1882.jpg?size=338&ext=jpg"))),
                  child: Column(
                    children: [
                      Text("Our Vision",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                          "Our vision is to be innovators, leaders and creative in the concepts of travel, positioning our company in the market within the best tourism companies in Pakistan, being recognized for our professionalism and high quality products.",
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
//  Third row
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff7c94b6),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter: new ColorFilter.mode(
                              Colors.black.withOpacity(0.7), BlendMode.dstATop),
                          image: NetworkImage(
                              "https://image.freepik.com/free-vector/vector-illustration-mountain-landscape_1441-77.jpg"))),
                  child: Column(
                    children: [
                      Text("Our Core Values",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                          "Whether you come into contact with us as a customer, what can you expect from us in terms of attitude and behavior? The following core values apply to TOUR MATE:",
                          style: TextStyle(color: Colors.white)),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 7),
                              child: Icon(
                                Icons.circle_rounded,
                                size: 8,
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text("Honesty",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 14.0),
                        child: Text(
                            "We strive to demonstrate honest behavior towards our environment (clients, suppliers and other parties who we conduct business with).",
                            style: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 7),
                              child: Icon(
                                Icons.circle_rounded,
                                size: 8,
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text("Standard",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 14.0),
                        child: Text(
                            "We provide a high standard of services suitable for individuals seeking relaxing, comfortable and memorable experiences in the hospitality and tourism industry.",
                            style: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 7),
                              child: Icon(
                                Icons.circle_rounded,
                                size: 8,
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text("Transparency",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 14.0),
                        child: Text(
                            "Our team strive to be clear in our products, services and processes. Be transparent to our direct environment.",
                            style: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 7),
                              child: Icon(
                                Icons.circle_rounded,
                                size: 8,
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text("Quality",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 14.0),
                        child: Text(
                            "Clients come in the first place, we provide high quality services to our costumers.",
                            style: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 7),
                              child: Icon(
                                Icons.circle_rounded,
                                size: 8,
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text("Sustainable tourism",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 14.0),
                        child: Text(
                            "Company conducts business in a sustainable way. We also take into account the  interest of the local people, preserve the cultural heritage, take care of our environment  and focusing economically on long term results and fair economic fair practices.",
                            style: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 7),
                              child: Icon(
                                Icons.circle_rounded,
                                size: 8,
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text("Professional",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 14.0),
                        child: Text(
                            "We take our business very serious. It means our behavior is correct, objective, balanced, efficient and reliable. We are down to earth in the way we conduct business.",
                            style: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 7),
                              child: Icon(
                                Icons.circle_rounded,
                                size: 8,
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text("Excellence",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 14.0),
                        child: Text(
                            "We are committed to being a high performance organization by staying focused on total customer satisfaction. We continuously analyze our processes and ourselves in order to become the best of the best.",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ),
//  Last container
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff7c94b6),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              colorFilter: new ColorFilter.mode(
                                  Colors.black.withOpacity(0.4),
                                  BlendMode.dstATop),
                              image: NetworkImage(
                                  "https://image.freepik.com/free-photo/businessman-touching-virtual-screen_1232-737.jpg"))),
                      child: Column(
                        children: [
                          Text(
                            "Connect With Us",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  // ignore: deprecated_member_use
                                  FlatButton(
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.email,
                                          color: Color(0xffEA4335),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Tourmate1234@gmail.com",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  // ignore: deprecated_member_use
                                  FlatButton(
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        Icon(Icons.facebook,
                                            color: Color(0xff1778F2)),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "TourMate Northern Areas",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  // ignore: deprecated_member_use
                                  FlatButton(
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.phone_android,
                                          color: Colors.green,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "+92 342 8270869",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  // ignore: deprecated_member_use
                                  FlatButton(
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        LineIcon(
                                          LineIcons.youtube,
                                          color: Colors.red,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "https://www.youtube/userid1209/.com",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  // ignore: deprecated_member_use
                                  FlatButton(
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        LineIcon(LineIcons.instagram,
                                            color: Colors.purple[400]),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "https://www.instagram/userid1209/.com",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
      // endDrawer: MyDrawer(),
      bottomNavigationBar: footer(),
    );
  }
}
