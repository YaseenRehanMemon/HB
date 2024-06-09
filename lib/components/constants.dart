import 'package:flutter/material.dart';
import 'package:hingorja_buisness/biologyquestiobank/biologymcqsbank.dart';
import 'package:hingorja_buisness/sections/biology.result.dart';
import 'dart:async';
import 'dart:math';

const firsticon = Icon(
  Icons.circle_outlined,
  size: 20,
);
const finalIcon = Icon(
  Icons.circle_rounded,
  color: Colors.blue,
  size: 20,
);

class Constants {
  static String appId = "1:356265156146:web:fbc9e5fd2d589ddc1f662b";
  static String apiKey = "AIzaSyA5GVCwWe5bhoLx3QKpbs_6kjOt60-HVYM";
  static String messagingSenderId = "356265156146";
  static String projectId = "hingorja-buisness";
}

class ksecytionbuttonstyle extends StatelessWidget {
  const ksecytionbuttonstyle(this.imageasset, this.onpress);
  final String imageasset;
  final VoidCallback onpress;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: onpress,
                child: Image.asset(imageasset),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class koptionbuttonstyle extends StatefulWidget {
  final String optionText;
  final VoidCallback onPress;
  koptionbuttonstyle(this.optionText, this.onPress, this.icon);
  final Icon icon;

  @override
  _koptionbuttonstyleState createState() => _koptionbuttonstyleState();
}

class _koptionbuttonstyleState extends State<koptionbuttonstyle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: MaterialButton(
                  onPressed: () {
                    widget.onPress();
                  },
                  child: Row(
                    children: [
                      widget.icon,
                      Expanded(
                        child: Text(
                          "${widget.optionText}",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Expanded optionButtons(
    String option1,
    String option2,
    String option3,
    String option4,
    Color colorforcontainer,
    int questionIndexNumber,
    String enableOption,
    Icon iconforoption1,
    Icon iconForOption2,
    Icon iconForOption3,
    Icon iconForOption4,
    Function(String, Icon, Icon, Icon, Icon) updateState) {
  return Expanded(
    child: Container(
      color: colorforcontainer,
      child: Column(
        children: [
          Expanded(
            child: koptionbuttonstyle(
              option1,
              () {
                updateState(
                  option1,
                  finalIcon,
                  firsticon,
                  firsticon,
                  firsticon,
                );
              },
              iconforoption1,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: koptionbuttonstyle(
              option2,
              () {
                updateState(
                  option2,
                  firsticon,
                  finalIcon,
                  firsticon,
                  firsticon,
                );
              },
              iconForOption2,
            ),
          ),
          Expanded(
            child: koptionbuttonstyle(
              option3,
              () {
                updateState(
                  option3,
                  firsticon,
                  firsticon,
                  finalIcon,
                  firsticon,
                );
              },
              iconForOption3,
            ),
          ),
          Expanded(
            child: koptionbuttonstyle(
              option4,
              () {
                updateState(
                  option4,
                  firsticon,
                  firsticon,
                  firsticon,
                  finalIcon,
                );
              },
              iconForOption4,
            ),
          ),
        ],
      ),
    ),
  );
}

Padding questionnumberandtext(String questiontext) {
  return Padding(
    padding: const EdgeInsets.only(left: 8),
    child: Text(
      questiontext,
      style: TextStyle(fontSize: 20),
    ),
  );
}

Text nextbutton(String button) {
  return Text(button,
      style: TextStyle(
          fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold));
}

Icon nextbuttonicon(IconData nextbuttonicon) {
  return Icon(
    color: Colors.white,
    nextbuttonicon,
    size: 50,
  );
}

Padding Sectionname(String sectionname, Color sectioncolor) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      color: sectioncolor,
      padding: const EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 10),
      child: Text(
        sectionname,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
