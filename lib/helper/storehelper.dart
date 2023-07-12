import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Storehelper {
  Storehelper._();
  static final Storehelper storehelper = Storehelper._();

  static final FirebaseAuth firebaseauth = FirebaseAuth.instance;
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  static final GoogleSignIn googleSignIn = GoogleSignIn();
  // Future<void> submitVote(String userId, String party) async {
  Future<void> submitVote(String party) async {
    final doc = firestore.collection('votes').doc();
    await doc.set({
      'party': party,
      'timestamp': DateTime.now().toUtc().millisecondsSinceEpoch,
    });
  }

  Future<void> storedvote() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('vote', 1);
  }
}
