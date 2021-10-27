import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:flutter_elegant_number_button/flutter_elegant_number_button.dart';

class RoomBooking extends StatefulWidget {
  const RoomBooking({Key? key}) : super(key: key);

  @override
  State<RoomBooking> createState() => _RoomBookingState();
}

class _RoomBookingState extends State<RoomBooking> {
  num child = 1;
  String childNum = '1';
  int incNum = 0;
  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget remindButton = ElegantNumberButton(
        initialValue: child,
        minValue: 1,
        maxValue: 20,
        step:1,
        onChanged: (value) {
          setState(() {
            child = value;
          });
        },
        decimalPlaces: 1);
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Select rooms and guests"),
      content: Column(
        children: [
          Row(children: [
            Text("Adults"),
            Expanded(child: Center()),
            TextButton(onPressed: () {}, child: Text("+")),
            Text("1"),
            TextButton(onPressed: () {}, child: Text("-"))
          ]),
          Row(children: [
            Text("Children"),
            Expanded(child: Center()),
            ElegantNumberButton(
        initialValue: child,
        minValue: 1,
        maxValue: 20,
        step:1,
        onChanged: (value) {
          setState(() {
            child = value;
          });
        },
        decimalPlaces: 1)
          ]),
          Row(children: [
            Text("Rooms"),
            Expanded(child: Center()),
            TextButton(onPressed: () {
              setState(() {
                incNum--;
                childNum = incNum.toString();
                print(childNum);
              });
              
            }, child: Text("-")),
            Text(childNum),
            TextButton(onPressed: () {
               setState(() {
                incNum++;
                childNum = incNum.toString();
              });
            }, child: Text("+"))
          ])
        ],
      ),
      actions: [
        cancelButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  final DateRangePickerController _controller = DateRangePickerController();
  String test = '';
  String test1 = '';
  String fromDate =
      DateFormat('E,MMMM dd, yyyy').format(DateTime.now()).toString();
  String toDate = DateFormat('E,MMMM dd, yyyy')
      .format(DateTime.now().add(Duration(days: 1)))
      .toString();
  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    SchedulerBinding.instance!.addPostFrameCallback((duration) {
      fromDate =
          DateFormat('E,MMMM dd, yyyy').format(args.value.startDate).toString();
      test =
          DateFormat('E,MMMM dd, yyyy').format(args.value.startDate).toString();
      ;
      toDate =
          DateFormat('E,MMMM dd, yyyy').format(args.value.endDate).toString();
      test1 =
          DateFormat('E,MMMM dd, yyyy').format(args.value.endDate).toString();
      ;
      setState(() {});
    });
  }

  Future _sellectionDateRange(BuildContext context) async {
    return showDialog<Widget>(
        context: context,
        builder: (BuildContext context) {
          return Card(
            margin: const EdgeInsets.fromLTRB(40, 100, 50, 40),
            child: SfDateRangePicker(
              controller: _controller,
              backgroundColor: Colors.white,
              selectionMode: DateRangePickerSelectionMode.range,
              showActionButtons: true,
              // allowViewNavigation: ,
              onSubmit: (Object value) {
                Navigator.pop(context);
              },
              onSelectionChanged: selectionChanged,
              onCancel: () {
                Navigator.pop(context);
              },
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
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
            "Booking",
            style: GoogleFonts.roboto(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [],
        ),
        body: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Container(
                  color: Colors.yellowAccent[700],
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: GestureDetector(
                          onTap: () => _sellectionDateRange(context),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                width:
                                    MediaQuery.of(context).size.width / 2 - 20,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Text("Check-In-Date",
                                        style: TextStyle(fontSize: 14)),
                                    Text(
                                      fromDate,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                width:
                                    MediaQuery.of(context).size.width / 2 - 20,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Text(
                                      "Check-Out-Date",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Text(
                                      toDate,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: GestureDetector(
                          onTap: () {
                            showAlertDialog(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width:
                                    MediaQuery.of(context).size.width / 3 - 14,
                                color: Colors.white,
                                child: Column(
                                  children: [Text("Adults"), Text("1")],
                                ),
                              ),
                              Container(
                                width:
                                    MediaQuery.of(context).size.width / 3 - 14,
                                color: Colors.white,
                                child: Column(
                                  children: [Text("Children"), Text("1")],
                                ),
                              ),
                              Container(
                                width:
                                    MediaQuery.of(context).size.width / 3 - 14,
                                color: Colors.white,
                                child: Column(
                                  children: [Text("Rooms"), Text(childNum)],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
      )),
    );
  }
}
