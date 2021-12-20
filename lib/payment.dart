import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  DateTime inDate = DateTime.now();
  String expDate = "";
  late String defaultText;
  var paymentList = ["Select Default", "Debit Card", "Easy Paisa", "Jazz Cash"];
  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: inDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2050, 6));
    if (picked != null) {
      setState(() {
        expDate = DateFormat("MM-yyyy").format(picked).toString();
        // expDate = picked;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    defaultText = paymentList[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
          child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Scaffold(
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
              "Payment",
              style: GoogleFonts.roboto(color: Colors.black),
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: [],
          ),
          body: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(25)),
                    width: 300,
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton(
                            items: paymentList.map((e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              );
                            }).toList(),
                            onChanged: (newValue) async {
                              setState(() {
                                defaultText = newValue.toString();
                              });
                            },
                            value: defaultText),
                      ),
                    ),
                  ),
                ]),
                SizedBox(
                  height: 10,
                ),
                // Debit card
                if (defaultText == "Debit Card")
                  Container(
                      child: Column(children: [
                    TextField(
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(25)),
                          border: new OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(25)),
                          hintText: "Enter Card Number"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            // padding: EdgeInsets.all(20),
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(25)),
                            child: TextButton(
                                onPressed: () {
                                  _selectDate(context);
                                },
                                child: expDate == ""
                                    ? Text("Exp",
                                        style: TextStyle(color: Colors.black))
                                    : Text(expDate,
                                        style: TextStyle(color: Colors.black))),
                          ),
                          Container(
                            height: 50,
                            width: 100,
                            // padding: EdgeInsets.all(20),
                            child: TextField(
                              maxLength: 3,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintText: "CVV",
                                  counterText: '',
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.circular(25)),
                                  border: new OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.circular(25))),
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                          ),
                        ]),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(25)),
                        child: Text(
                          "Room Price :",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 50,
                            width: 120,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25)))),
                                onPressed: () {},
                                child: Text("Cancel",
                                    style: TextStyle(color: Colors.black))),
                          ),
                          Container(
                            height: 50,
                            width: 120,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25)))),
                                onPressed: () {},
                                child: Text("Confirm",
                                    style: TextStyle(color: Colors.black))),
                          ),
                        ]),
                  ]))

                // //

                // Easypaisaa

                else if (defaultText == "Easy Paisa")
                  Container(
                      child: Column(children: [
                    TextField(
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(25)),
                          border: new OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(25)),
                          hintText: "Easypaisa Number"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(25)),
                        child: Text(
                          "Room Price :",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 50,
                            width: 120,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25)))),
                                onPressed: () {},
                                child: Text("Cancel",
                                    style: TextStyle(color: Colors.black))),
                          ),
                          Container(
                            height: 50,
                            width: 120,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25)))),
                                onPressed: () {},
                                child: Text("Confirm",
                                    style: TextStyle(color: Colors.black))),
                          ),
                        ]),
                  ]))

                //  //

                // jazz cash
                else if (defaultText == "Jazz Cash")
                  Container(
                      child: Column(children: [
                    TextField(
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(25)),
                          border: new OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(25)),
                          hintText: "Jazz Cash Number"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(25)),
                        child: Text(
                          "Room Price :",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 50,
                            width: 120,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25)))),
                                onPressed: () {},
                                child: Text("Cancel",
                                    style: TextStyle(color: Colors.black))),
                          ),
                          Container(
                            height: 50,
                            width: 120,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25)))),
                                onPressed: () {},
                                child: Text("Confirm",
                                    style: TextStyle(color: Colors.black))),
                          ),
                        ]),
                  ]))
                //  //

                else
                  Container(child: Text("Please select payment method"))
              ],
            ),
          ),
        ),
      )),
    );
  }
}
