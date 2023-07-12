import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screens/Votepage.dart';
import 'Screens/finalpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(
    MaterialApp(
      initialRoute: (prefs.getInt('vote') == 1) ? "finalpage" : "/",
      routes: {
        "/": (context) => const Votepage(),
        "finalpage": (context) => const Finalpage(),
      },
    ),
  );
}
