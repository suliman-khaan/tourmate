import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tourmate1/Register.dart';
import 'package:tourmate1/login.dart';
import 'footer.dart';
import 'package:flutter/material.dart';

class Review extends StatefulWidget {
  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  String userId = "";
  final formKey = GlobalKey<FormState>();
  var user;
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('Kas loginn nadi yar....');
      } else {
        final User? user = auth.currentUser;
        final uid = user!.uid;
        userId = uid;
      }
    });
  }

  final TextEditingController commentController = TextEditingController();
  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Builder(builder: (context) {
              return Container(
                height: 145,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "To make a review, you need to be Logged In",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => register()));
                      },
                      child: const Text('Sign Up'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("or", style: TextStyle(color: Colors.grey)),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => login()));
                            },
                            child: Text("Login",
                                style: TextStyle(color: Colors.blue))),
                      ],
                    ),
                  ],
                ),
              );
            }),
          );
        });
  }

  Widget commentChild(data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: new BoxDecoration(
                      color: Colors.blue,
                      borderRadius: new BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(data[i]['pic'])),
                ),
              ),
              title: Text(
                data[i]['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data[i]['message']),
            ),
          )
      ],
    );
  }

  Widget logincommentChild(data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: new BoxDecoration(
                      color: Colors.blue,
                      borderRadius: new BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(data[i]['pic'])),
                ),
              ),
              title: Text(
                data[i]['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data[i]['message']),
            ),
          ),
        Divider(
          color: Colors.black,
        ),
        SizedBox(height: 5),
        Center(
            child: TextButton(
          style: TextButton.styleFrom(
              textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue)),
          child: Text("Rate Your Experience"),
          onPressed: () {
            createAlertDialog(context);
          },
        )),
        SizedBox(height: 5),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> reviewStream =
        FirebaseFirestore.instance.collection("Review").snapshots();
    // if (FirebaseAuth.instance.currentUser == null) {
    //   bool login = false;
    // } else
    //   bool login = true;

    return Material(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                size: 16,
                color: Colors.black,
              )),
          title: Text(
            "Review Page",
            style: TextStyle(color: Colors.blue),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: StreamBuilder(
            stream: reviewStream,
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              final List reviewList = [];
              snapshot.data!.docs.map((DocumentSnapshot e) {
                Map dataList = e.data() as Map<String, dynamic>;
                reviewList.add(dataList);
              }).toList();
              final Stream<QuerySnapshot> reviewDisplayStream =
                  FirebaseFirestore.instance
                      .collection("customer")
                      .where("uid", isEqualTo: userId)
                      .snapshots();
              return SafeArea(
                child: Container(
                    child: userId == ""
                        ? logincommentChild(reviewList)
                        : StreamBuilder(
                            stream: reviewDisplayStream,
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              final List reviewDisplayList = [];
                              snapshot.data!.docs.map((DocumentSnapshot e) {
                                Map dataList = e.data() as Map<String, dynamic>;
                                reviewDisplayList.add(dataList);
                              }).toList();
                              return CommentBox(
                                userImage: reviewDisplayList[0]['image'] != ''
                                    ? reviewDisplayList[0]['image']
                                    : "https://firebasestorage.googleapis.com/v0/b/fir-prictice-81c0f.appspot.com/o/profile.png?alt=media&token=8fdf702b-8f5a-4a12-b46a-091758812a5d",
                                child: commentChild(
                                    reviewList), //display review of cusotmer....
                                labelText: 'Write a breif review...',
                                withBorder: true,
                                errorText: 'Review cannot be blank',
                                sendButtonMethod: () {
                                  if (formKey.currentState!.validate()) {
                                    print(commentController.text);
                                    setState(() {
                                      Map<String, dynamic> value = {
                                        'name': reviewDisplayList[0]['name'],
                                        'pic': reviewDisplayList[0]['image'] !=
                                                ''
                                            ? reviewDisplayList[0]['image']
                                            : "https://firebasestorage.googleapis.com/v0/b/fir-prictice-81c0f.appspot.com/o/profile.png?alt=media&token=8fdf702b-8f5a-4a12-b46a-091758812a5d",
                                        'message': commentController.text
                                      };
                                      FirebaseFirestore.instance
                                          .collection("Review")
                                          .add(value);
                                    });
                                    commentController.clear();
                                    FocusScope.of(context).unfocus();
                                  } else {
                                    print("Not validated");
                                  }
                                },
                                formKey: formKey,
                                commentController: commentController,
                                backgroundColor: Colors.blue,
                                textColor: Colors.white,
                                sendWidget: Icon(Icons.send_sharp,
                                    size: 24, color: Colors.white),
                              );
                            })),
              );
            }),
        bottomNavigationBar: footer(
          tabIndex: 2,
        ),
      ),
    );
  }
}
