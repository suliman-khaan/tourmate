import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
String userId = '';
dynamic userID() {
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      final User? user = auth.currentUser;
      final uid = user!.uid;
      userId = uid;
      // return userId;
    }
  });
  return userId;
}
