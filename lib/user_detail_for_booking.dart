import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:international_phone_input/international_phone_input.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tourmate1/allHotel.dart';
import 'package:tourmate1/home.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:tourmate1/mail_sender.dart';

class UserDetailForBooking extends StatefulWidget {
  const UserDetailForBooking(
      {Key? key,
      required this.room_name,
      required this.rooms,
      required this.price,
      required this.hotel_name})
      : super(key: key);
  final String hotel_name;
  final String room_name;
  final int rooms;
  final dynamic price;

  @override
  _UserDetailForBookingState createState() => _UserDetailForBookingState();
}

class _UserDetailForBookingState extends State<UserDetailForBooking> {
  CollectionReference users =
      FirebaseFirestore.instance.collection("user_detail_for_booking");
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'PK';
  PhoneNumber number = PhoneNumber(isoCode: 'PK');
  late String _firstname;
  late String _lastname;
  late String _email;
  late String _country;
  late String _phonenumber;
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  String title = "Country code Picker";
  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'PK');

    setState(() {
      this.number = number;
    });
  }

  final SendMail _mail = SendMail();
  createAlertDialogMail(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Confirm Booking",
            ),
            content: Text("Would You Like to Confirm Booking"),
            actions: [
              MaterialButton(
                color: Colors.blue,
                onPressed: () async {
                  await _mail.sendmail(
                      firstname: _firstname,
                      lastname: _lastname,
                      email: _email,
                      hotel_name: widget.hotel_name);
                  String _room_name = widget.room_name;
                  int _rooms = widget.rooms;
                  int _price = widget.price;

                  await users.add({
                    "first_name": _firstname,
                    "last_name": _lastname,
                    "email": _email,
                    "contact_no": _phonenumber,
                    "room_name": _room_name,
                    "rooms": _rooms,
                    "price": _price
                  }).then((value) => print("user added" + value.toString()));
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => home()));
                  print("your Data added Successfuly");
                  // print(name);
                },
                child: Text(
                  "Yes",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("No", style: TextStyle(color: Colors.white)),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text(
          "Book Now",
          style: GoogleFonts.roboto(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [],
      ),
      body: Builder(
        builder: (context) => SingleChildScrollView(
          child: Container(
            child: Form(
              key: _formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Enter Your Details",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "*required fields",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                    //First Field For Full Name
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "First Name",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          setState(() {
                            _firstname = value;
                          });
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFDFECF5),
                            labelText: "First Name",
                            hintText: "Enter Your First Name",
                            prefixIcon: Padding(
                                padding: EdgeInsets.all(0),
                                child: Icon(Icons.person)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                        validator: MultiValidator([
                          RequiredValidator(
                              errorText: "Please Enter your First name!"),
                        ])),
                    //Field For Last Name
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Last Name",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          setState(() {
                            _lastname = value;
                          });
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFDFECF5),
                            labelText: "Last Name",
                            hintText: "Enter Your Last Name",
                            prefixIcon: Padding(
                                padding: EdgeInsets.all(0),
                                child: Icon(Icons.person)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                        validator: MultiValidator([
                          RequiredValidator(
                              errorText: "Please Enter your Last name!"),
                        ])),
                    //TextField for Email
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Email",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          setState(() {
                            _email = value;
                          });
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFDFECF5),
                            labelText: "Email",
                            hintText: "Enter Your Email",
                            prefixIcon: Padding(
                                padding: EdgeInsets.all(0),
                                child: Icon(Icons.email)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                        validator: MultiValidator([
                          RequiredValidator(
                              errorText: "Please Enter Your Email"),
                          EmailValidator(
                              errorText: "The Input Should be Email!"),
                        ])),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Contact No",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //widget for Phone Number

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: IntlPhoneField(
                        initialCountryCode: "PK",
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFDFECF5),
                          hintText: "i.e 340xxxxxxx",
                          labelText: 'Phone Number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onChanged: (phone) {
                          _phonenumber = phone.completeNumber;
                          print(phone.completeNumber);
                        },
                        onCountryChanged: (phone) {
                          print('Country code changed to: ');
                        },
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: MaterialButton(
                        height: 40,
                        // minWidth: double.infinity,
                        color: Colors.blue,
                        child: Text(
                          "Payment",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate())
                            createAlertDialogMail(context);
                          // _formKey.currentState!.save();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
