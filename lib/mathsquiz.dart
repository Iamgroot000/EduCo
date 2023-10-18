import 'package:flutter/material.dart';
import 'dart:math';

import 'package:get/get.dart';

void main() => runApp(MathQuizApp());

class MathQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MathQuiz(),
    );
  }
}

class MathQuiz extends StatefulWidget {
  @override
  _MathQuizState createState() => _MathQuizState();
}

class _MathQuizState extends State<MathQuiz> {
  Random random = Random();
  late int num1, num2, result, userAnswer;
  late String operator, question;
  int score = 0;
  int questionCount = 0;

  List<String> operators = [
    'sin',
    'cos',
    'tan',
    'probability',
    'integration',
    'puzzle'
  ];

  void generateQuestion() {
    num1 = random.nextInt(20) + 1;
    num2 = random.nextInt(20) + 1;
    operator = operators[random.nextInt(operators.length)];

    switch (operator) {
      case 'sin':
        num1 = random.nextInt(90) + 1; // Generate an angle in degrees
        result = (sin(num1 * pi / 180) * 100).truncate(); // Convert to radians and round to 2 decimal places
        question = 'sin($num1°) = ?';
        break;
      case 'cos':
        num1 = random.nextInt(90) + 1; // Generate an angle in degrees
        result = (cos(num1 * pi / 180) * 100).truncate(); // Convert to radians and round to 2 decimal places
        question = 'cos($num1°) = ?';
        break;
      case 'tan':
        num1 = random.nextInt(45) + 1; // Generate an angle in degrees (restricted to avoid undefined values)
        result = (tan(num1 * pi / 180) * 100).truncate(); // Convert to radians and round to 2 decimal places
        question = 'tan($num1°) = ?';
        break;
      case 'probability':
        num1 = random.nextInt(6) + 1; // Roll a fair six-sided die
        num2 = random.nextInt(6) + 1; // Roll a fair six-sided die
        result = (num1 + num2);
        question = 'What is the probability of rolling a sum of $result with two six-sided dice? (in decimal form)';
        break;
      case 'integration':
      // Generate a basic integration question, e.g., ∫(x^2 + 2x + 1) dx
        num1 = random.nextInt(5) + 1;
        question = '∫(x^$num1 + ${num1 + 1}x + 1) dx = ?';
        result = (1 / (num1 + 1)).truncate(); // Basic integral result for x^(n+1)
        break;
      case 'puzzle':
      // Generate a puzzle question
        List<int> puzzleNumbers = List.generate(5, (_) => random.nextInt(100) + 1);
        result = puzzleNumbers.reduce((a, b) => a * b); // Find the product of numbers
        question = 'Find the product of: ${puzzleNumbers.join(', ')}';
        break;
    }
  }

  void checkAnswer() {
    setState(() {
      if (userAnswer == result) {
        score++;
      }
      questionCount++;

      if (questionCount < 15) {
        generateQuestion();
      } else {
        // Show a dialog with the final score and reset the quiz
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Quiz Over'),
              content: Text('Your score: $score / 15'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    resetQuiz();
                  },
                  child: Text('Play Again'),
                ),
              ],
            );
          },
        );
      }
    });
  }

  void skipQuestion() {
    setState(() {
      questionCount++;
      if (questionCount < 15) {
        generateQuestion();
      } else {
        // Show a dialog with the final score and reset the quiz
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Quiz Over'),
              content: Text('Your score: $score / 15'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    resetQuiz();
                  },
                  child: Text('Play Again'),
                ),
              ],
            );
          },
        );
      }
    });
  }

  void resetQuiz() {
    setState(() {
      score = 0;
      questionCount = 0;
      generateQuestion();
    });
  }

  @override
  void initState() {
    super.initState();
    generateQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Maths Quiz"), ///Custom app bar
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        elevation: 0.00,
        backgroundColor: Colors.greenAccent[400],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Question $questionCount/15',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              question,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  userAnswer = int.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: checkAnswer,
                  child: Text('Submit'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: skipQuestion,
                  child: Text('Skip'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Score: $score/15',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
