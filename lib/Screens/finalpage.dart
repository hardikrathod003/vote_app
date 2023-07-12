import 'package:flutter/material.dart';

class Finalpage extends StatefulWidget {
  const Finalpage({Key? key}) : super(key: key);

  @override
  State<Finalpage> createState() => _FinalpageState();
}

class _FinalpageState extends State<Finalpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Congratulation You have succesfully voted",
        ),
      ),
    );
  }
  
}
