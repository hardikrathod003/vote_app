import 'package:flutter/material.dart';
import 'package:voteapp/helper/storehelper.dart';

class Votepage extends StatefulWidget {
  const Votepage({Key? key}) : super(key: key);

  @override
  State<Votepage> createState() => _VotepageState();
}

class _VotepageState extends State<Votepage> {
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("BJP"), value: "BJP"),
      DropdownMenuItem(child: Text("CONGRESS"), value: "CONGRESS"),
      DropdownMenuItem(child: Text("AAP"), value: "AAP"),
    ];
    return menuItems;
  }

  String party = "BJP";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Voting App"),
          backgroundColor: Colors.purple,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              DropdownButton(
                items: dropdownItems,
                value: party,
                onChanged: (String? newValue) {
                  setState(() {
                    party = newValue!;
                  });
                },
              ),
              ElevatedButton(
                child: Text("Vote"),
                onPressed: () {
                  Storehelper.storehelper.submitVote(party);
                  Storehelper.storehelper.storedvote();
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil("finalpage", (route) => false);
                },
              ),
            ],
          ),
        ));
  }
}
