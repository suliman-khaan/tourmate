import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
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
          title: Text("Terms and conditons",
              style: GoogleFonts.roboto(color: Colors.black, fontSize: 15)),
          // title: Text(
          //   "Historical Areas in Swat",
          //   style: GoogleFonts.roboto(color: Colors.black,fontSize: 15)
          // ),
        ),
        body: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Text("TERMS AND CONDITION Tour mate"),
                  Text("1: Booking Hotel and Transport "),
                  Text(
                      "a: All bookings must be made through an authorised representative of the Company. "),
                  Text(
                      "b : At the time of booking must be deposit 50% of total cost  of the booking.  No booking shall be confirmed until the Company issues a mail or message  "),
                  Text(
                      "C : Your tour must be paid in full at least 2 days before the departure date. If payment is not received by the due date, the Company reserves the right to cancel the booking and retain the depositd . "),
                  Text("2: Price policy  "),
                  Text(
                      "a) : The Company reserves the right to notify you  of any increase in price in market  before and after  accepting your booking . "),
                  Text(
                      "b) : Please note that all prices for the services provided by TourMate and As a local operator.TourMate cannot be responsible for currency fluctuations and or additional fees outside its control that may be applied such as bank transfer fees, credit card fees and etc. "),
                  Text(
                      "c) :  All prices shown on our (mobile) website are based on current prices.All prices mentioned on our (mobile) website include company percantage as well . "),
                  Text("3 Disclaimer "),
                  Text(
                      "a) : The Company has made all reasonable efforts to check the accuracy of the information contained in our website. The Company cannot however accept any responsibility for any errors or omissions that may appear in this site."),
                  Text("4 Complaints  "),
                  Text(
                      "a) : If you have a problem during your holiday, please inform the relevant transport, hotel, local agent of other suppliers immediately so that they can endeavour to put things right. If you cannot resolve the problems, you must contact the Company office so that they are given an opportunity to help. The Company will not hold themselves responsible for the non-performance of an itinerary through causes beyond their control or when they are not notified of a problem at the point where remedial action can be taken."),
                  Text(
                      "b:  Any dispute that may arise will be governed by pakistan laws  and both parties shall submit to the jurisdiction of the Pakistan Courts ."),
                  Text(
                      "c) All information given by the Company whether in writing or orally is to the best of the Company’s knowledge and believed correct at the time given and is given in good faith "),
                  Text("5 :Data Protection Act"),
                  Text(
                      "It may be necessary for the Company to ask you for certain personal information. Examples of this would be dietary requirements, disability/medical, merrage status , purpose of tour or religious information etc. This information will be kept confidential by the Company and is available to you to inspect during the Company’s normal working hours. It will be passed to the suppliers, if it is necessary for them to know this information in order to fulfill the Company’s contract to you."),
                  Text("6: Cancellation policy : "),
                  Text("Cancellation Made Within "),
                  Text(
                      "a) : 3 days prior to departure :  100% refundable  Transport "),
                  Text("b) : 2 days prior to departure : 75% refundable "),
                  Text(
                      "c) : if customer not notify about the cancellation than one day payment  0% will be refundable and 100 % refundable other days "),
                  Text(
                      "d) : if a customer want to change the date we will look the situation  make arrangment . "),
                  Text("Somking : "),
                  Text(
                      "a: The Company forbids smoking in any vehicle operated by the Company. . All accommodation will be reserved with non-smoking rooms. "),
                ],
              )),
        ),
      ),
    );
  }
}
