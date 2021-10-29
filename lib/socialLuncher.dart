import 'package:url_launcher/url_launcher.dart';

Future emailLaunch({
  required String toEmail,
}) async {
  final url = 'mailto:$toEmail';
  if (await canLaunch(url)) {
    await launch(url);
  }
}

Future whatsAppLaunch({
  required String phone,
}) async {
  final whatsappUrl = "whatsapp://send?phone=+92$phone";
  if (await canLaunch(whatsappUrl)) {
    await launch(whatsappUrl);
  } else {
    print(
        "open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
  }
}

Future facebookLaunch({
  required String name,
}) async {
  final facebookUrl = "fb://$name";
  if (await canLaunch(facebookUrl)) {
    await launch(facebookUrl);
  } else {
    print(
        "open facebook app link or do a snackbar with notification that there is no Facebook installed");
  }
}
