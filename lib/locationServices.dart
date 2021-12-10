import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LocationService {
  //API KEY;
  final String key = "AIzaSyANqXxhrJQA1hXAMXo-nWZivPlhkWcutF8";
  Future<Map<String, dynamic>> getDirection(
      String origin, String designation) async {
    final String url =
        "https://maps.googleapis.com/maps/api/directions/json?destination=$designation&origin=$origin&key=$key";
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var result = {
      'bound_ne': json['route'][0]['bounds']['northeast'],
      'bound_se': json['route'][0]['bounds']['southeast'],
      'start_location': json['route'][0]['legs'][0]['start_location'],
      'end_location': json['route'][0]['legs'][0]['end_location'],
      'polyline': json['route'][0]['overview_polyline']['start_location']
          ['points']
    };
    return result;
    // print(json);
  }
}
