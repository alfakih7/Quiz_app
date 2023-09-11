import 'package:flutter/material.dart';
import 'package:quiz/appbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

AppBrain appBrain = AppBrain();

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> questionresult = [];
  int rightAnswers = 0;

  void checkAnswer(bool whatuserpicked) {
    setState(() {
      bool correctAnswer = appBrain.getanswers();
      if (whatuserpicked == correctAnswer) {
        rightAnswers++;
        questionresult.add(const Padding(
          padding: EdgeInsets.all(3.0),
          child: Icon(
            Icons.thumb_up,
            color: Colors.green,
          ),
        ));
      } else {
        questionresult.add(
          const Padding(
            padding: EdgeInsets.all(3.0),
            child: Icon(Icons.thumb_down, color: Colors.red),
          ),
        );
      }
      if (appBrain.isfinished() == true) {
        Alert(
          context: context,
          title: "The Test is Over",
          desc: " u answered $rightAnswers question",
          buttons: [
            DialogButton(
              onPressed: () => Navigator.pop(context),
              color: Colors.blue,
              width: 120,
              child: const Text(
                "Try Again",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ).show();

        appBrain.reset();
        questionresult = [];
        rightAnswers = 0;
      } else {
        {
          appBrain.nextQuestion();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 197, 196, 196),
        title: const Text('Quiz'),
        centerTitle: true,
        elevation: 3,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: questionresult,
            ),
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  Image.asset(appBrain.getimages()),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    appBrain.getquestintext(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: ElevatedButton(
                  onPressed: () {
                    checkAnswer(true);
                  },
                  child: const Text(
                    'yes',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: ElevatedButton(
                  onPressed: () {
                    checkAnswer(false);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Text(
                    'No',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
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
