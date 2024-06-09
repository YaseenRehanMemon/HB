import 'package:flutter/material.dart';
import 'package:hingorja_buisness/components/Questions.dart';
import 'dart:math';
import 'package:hingorja_buisness/components/constants.dart';
import 'package:hingorja_buisness/physics/physicsmcqsbank.dart';
import 'package:hingorja_buisness/physics/physics.results.dart';

class Physics extends StatefulWidget {
  static const id = "physics";
  int score = 0;

  @override
  _PhysicsState createState() => _PhysicsState();
}

class _PhysicsState extends State<Physics> {
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
    if (QuizBrain().physicsQuestion[questionindexnumber].questionans ==
        option) {
      setState(() {
        widget.score++;
      });
    }
  }

  TimeHelper timehelper = TimeHelper();

  @override
  void initState() {
    super.initState();
    usedQuestions.add(questionindexnumber);
  }

  void nextQuestion() {
    // Prevent question change if no option is selected
    if (enableoption.isEmpty) return;

    setState(() {
      if (questionnumber < QuizBrain().physicsQuestion.length) {
        do {
          questionindexnumber =
              Random().nextInt(QuizBrain().physicsQuestion.length);
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
            builder: (context) => Physicsresult(widget.score),
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
          Sectionname("Physics Section", Colors.redAccent),
          questionnumberandtext("Question # $questionnumber"),
          questionnumberandtext(
              QuizBrain().physicsQuestion[questionindexnumber].questionText),
          optionButtons(
            QuizBrain().physicsQuestion[questionindexnumber].option1,
            QuizBrain().physicsQuestion[questionindexnumber].option2,
            QuizBrain().physicsQuestion[questionindexnumber].option3,
            QuizBrain().physicsQuestion[questionindexnumber].option4,
            Colors.redAccent,
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
                color: Colors.redAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    questionnumber < QuizBrain().physicsQuestion.length
                        ? nextbutton("Next")
                        : nextbutton("Submit"),
                    questionnumber < QuizBrain().physicsQuestion.length
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
