import "package:flutter/material.dart";
import 'package:hingorja_buisness/physics/physics.dart';
import '../components/constants.dart';
import 'package:hingorja_buisness/sections/biology.dart';
import 'package:hingorja_buisness/chemistry/chemistry.dart';

class Mainpage extends StatelessWidget {
  const Mainpage({super.key});

  static const id = "mainpage";

  // This widget is the r
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        centerTitle: true,
        title: Text(
          "Sections",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ksecytionbuttonstyle("images/biology.webp", () {
              Navigator.pushNamed(context, Biology.id);
            }),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ksecytionbuttonstyle("images/chemistry.jpg", () {
              Navigator.pushNamed(context, Chemistry.id);
            }),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ksecytionbuttonstyle("images/physics.webp", () {
              Navigator.pushNamed(context, Physics.id);
            }),
          )),
        ],
      ),
    );
  }
}
