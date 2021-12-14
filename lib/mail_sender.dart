// import 'dart:io';

// import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class SendMail {
  Future sendmail(
      {required String firstname,
      required String lastname,
      required String email,
      required String hotel_name}) async {
    String username = 'tourmate111@gmail.com';
    String password = 'Friend\$77';

    // ignore: deprecated_member_use
    final smtpServer = gmail(username, password);
    // Use the SmtpServer class to configure an SMTP server:
    // final smtpServer = SmtpServer('smtp.domain.com');
    // See the named arguments of SmtpServer for further configuration
    // options.

    // Create our message.
    final message = Message()
      ..from = Address(
        username,
      )
      ..recipients.add('${email}')
      // ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
      ..bccRecipients.add(Address('tourmate111@gmail.com'))
      ..subject = 'Room Reservation ${DateTime.now()}'
      // ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html =
          "<h1>Hello ${firstname + " " + lastname} </h1>\n<h2>Confirmed</h2>\n<p>Your accomodation Booked we sent your email to ${email}</p>\n<h3>Hotel :${hotel_name} </h3><p>For More Information Contact Us </p>\n<p>Contact No: 03428270869</p>\n<p>Email: tourmate111@gmail.com</p>\n<h3>Thank You!</h3>";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent. ---$e');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
    // DONE

    // Let's send another message using a slightly different syntax:
    //
    // Addresses without a name part can be set directly.
    // For instance `..recipients.add('destination@example.com')`
    // If you want to display a name part you have to create an
    // Address object: `new Address('destination@example.com', 'Display name part')`
    // Creating and adding an Address object without a name part
    // `new Address('destination@example.com')` is equivalent to
    // adding the mail address as `String`.
    // final equivalentMessage = Message()
    //   ..from = Address(username, 'Your name 😀')
    //   ..recipients.add(Address('destination@example.com'))
    //   ..ccRecipients
    //       .addAll([Address('destCc1@example.com'), 'destCc2@example.com'])
    //   ..bccRecipients.add('bccAddress@example.com')
    //   ..subject = 'Test Dart Mailer library :: 😀 :: ${DateTime.now()}'
    //   ..text = 'This is the plain text.\nThis is line 2 of the text part.'
    //   ..html =
    //       '<h1>Test</h1>\n<p>Hey! Here is some HTML content</p><img src="cid:myimg@3.141"/>'
    //   ..attachments = [
    //     FileAttachment(File('exploits_of_a_mom.png'))
    //       ..location = Location.inline
    //       ..cid = '<myimg@3.141>'
    //   ];

    // final sendReport2 = await send(equivalentMessage, smtpServer);

    // Sending multiple messages with the same connection
    //
    // Create a smtp client that will persist the connection
    var connection = PersistentConnection(smtpServer);

    // Send the first message
    await connection.send(message);

    // send the equivalent message
    // await connection.send(equivalentMessage);

    // close the connection
    await connection.close();
  }
}
