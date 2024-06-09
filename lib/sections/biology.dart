import 'package:flutter/material.dart';
import 'package:hingorja_buisness/components/Questions.dart';
import 'dart:math';
import 'dart:async';
import 'package:hingorja_buisness/biologyquestiobank/biologymcqsbank.dart';
import 'package:hingorja_buisness/components/constants.dart';
import 'package:hingorja_buisness/sections/biology.result.dart';

class Biology extends StatefulWidget {
  static const id = "biology";
  int score = 0;

  @override
  _BiologyState createState() => _BiologyState();
}

class _BiologyState extends State<Biology> {
  int timeinminutes = 15;
  int timeinseconds = 0;
  int questionindexnumber = Random().nextInt(10);
  Icon iconforoption1 = firsticon;
  Icon iconforoption2 = firsticon;
  Icon iconforoption3 = firsticon;
  Icon iconforoption4 = firsticon;
  String enableoption = "";
  int questionnumber = 1;

  // Track used questions
  Set<int> usedQuestions = {};

  void questionchecker(int questionindexnumber, String option) {
    if (QuizBrain().biologyQuestions[questionindexnumber].questionans ==
        option) {
      setState(() {
        widget.score++;
      });
    }
  }

  void startCountdown() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (timeinseconds > 0) {
          timeinseconds--;
        } else if (timeinminutes > 0) {
          timeinminutes--;
          timeinseconds = 59;
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    startCountdown();
    usedQuestions.add(questionindexnumber);
  }

  void nextQuestion() {
    // Prevent question change if no option is selected
    if (enableoption.isEmpty) return;

    setState(() {
      if (questionnumber < QuizBrain().biologyQuestions.length) {
        do {
          questionindexnumber =
              Random().nextInt(QuizBrain().biologyQuestions.length);
        } while (usedQuestions.contains(questionindexnumber));

        usedQuestions.add(questionindexnumber);
        questionnumber++;
        iconforoption1 = firsticon;
        iconforoption2 = firsticon;
        iconforoption3 = firsticon;
        iconforoption4 = firsticon;
        enableoption = "";
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Biologyresult(widget.score),
          ),
        );
      }
    });
  }

  void updateState(String newEnabledOption, Icon newIconForOption1,
      Icon newIconForOption2, Icon newIconForOption3, Icon newIconForOption4) {
    setState(() {
      enableoption = newEnabledOption;
      iconforoption1 = newIconForOption1;
      iconforoption2 = newIconForOption2;
      iconforoption3 = newIconForOption3;
      iconforoption4 = newIconForOption4;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: timeinseconds < 10
            ? Text("$timeinminutes min : 0 $timeinseconds sec")
            : Text("$timeinminutes min: $timeinseconds sec"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(
            Icons.timer,
            size: 50,
          ),
          Sectionname("Biology Section", Colors.blue),
          questionnumberandtext("Question # $questionnumber"),
          questionnumberandtext(
              QuizBrain().biologyQuestions[questionindexnumber].questionText),
          optionButtons(
            QuizBrain().biologyQuestions[questionindexnumber].option1,
            QuizBrain().biologyQuestions[questionindexnumber].option2,
            QuizBrain().biologyQuestions[questionindexnumber].option3,
            QuizBrain().biologyQuestions[questionindexnumber].option4,
            Colors.blue,
            questionindexnumber,
            enableoption,
            iconforoption1,
            iconforoption2,
            iconforoption3,
            iconforoption4,
            updateState,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: MaterialButton(
              onPressed: () {
                questionchecker(questionindexnumber, enableoption);
                nextQuestion();
              },
              child: Container(
                color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    questionnumber < QuizBrain().biologyQuestions.length
                        ? nextbutton("Next")
                        : nextbutton("Submit"),
                    questionnumber < QuizBrain().biologyQuestions.length
                        ? nextbuttonicon(Icons.arrow_circle_right_outlined)
                        : nextbuttonicon(Icons.file_upload),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
