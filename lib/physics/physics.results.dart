import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:awesome_circular_chart/awesome_circular_chart.dart';
import 'package:flutter/widgets.dart';
import 'package:hingorja_buisness/screens/mainpage.dart';

class Physicsresult extends StatelessWidget {
  Physicsresult(this.score);
  int score;
  static String id = "Physicsresult";
  Widget judge() {
    if (score < 4) {
      return Text(
        "your result is too bad".toUpperCase(),
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),
      );
    } else if (score < 8) {
      return Text(
        "your result is average".toUpperCase(),
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.lightGreenAccent),
      );
    } else {
      return Text(
        "your result is good".toUpperCase(),
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.green),
      );
    }
  } //ine the key and size for the chart

  Widget Result() {
    if (score < 4) {
      return Text(
        "fail".toUpperCase(),
        style: TextStyle(
            fontSize: 40, fontWeight: FontWeight.bold, color: Colors.red),
      );
    } else if (score < 8) {
      return Text(
        "pass".toUpperCase(),
        style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.lightGreenAccent),
      );
    } else {
      return Text(
        "vip".toUpperCase(),
        style: TextStyle(
            fontSize: 40, fontWeight: FontWeight.bold, color: Colors.green),
      );
    }
  } //ine the key and size for the c

  static final GlobalKey<AnimatedCircularChartState> _chartKey =
      GlobalKey<AnimatedCircularChartState>();
  static final Size _chartSize = const Size(400.0, 400.0);

  @override
  Widget build(BuildContext context) {
    double completedPercentage = (score / 10) * 100;
    double remainingPercentage = 100 - completedPercentage;
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            judge(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Result(),
            ),
            AnimatedCircularChart(
              key: _chartKey,
              size: _chartSize,
              initialChartData: <CircularStackEntry>[
                CircularStackEntry(
                  <CircularSegmentEntry>[
                    CircularSegmentEntry(
                      completedPercentage,
                      Colors.blue[400],
                      rankKey: 'completed',
                    ),
                    CircularSegmentEntry(
                      remainingPercentage,
                      Colors.blueGrey[600],
                      rankKey: 'remaining',
                    ),
                  ],
                  rankKey: 'progress',
                ),
              ],
              chartType: CircularChartType.Radial,
              percentageValues: true,
              holeLabel: '${score}/10',
              labelStyle: TextStyle(
                color: Colors.blueGrey[600],
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, Mainpage.id);
              },
              child: Text(
                "Main Menu",
                style: TextStyle(fontSize: 30),
              ),
            )
          ],
        ),
      ),
    );
  }
}
