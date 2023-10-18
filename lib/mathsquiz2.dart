import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(PuzzleQuizApp());
}

class PuzzleQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Puzzle Quiz',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: QuizScreen(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  List<Question> questions = [
    Question(
      questionText: "Alfred buys an old scooter for Rs. 4700 and spends Rs. 800 on its repairs. If he sells the scooter for Rs. 5800, his gain percent is:     ",
      options: ["32%", "60%", "10%", "12%"],
      correctAnswer: "60%",
      explanation: "Great job! You calculated it correctly.",
    ),
    Question(
      questionText: "In a certain store, the profit is 320% of the cost. If the cost increases by 25% but the selling price remains constant, approximately what percentage of the selling price is the profit?",
      options: ["30", "70", "100", "250"],
      correctAnswer: "70",
      explanation: "You're correct! The speed is 70%.",
    ),

    Question(
      questionText: "Look at this series: 22, 21, 23, 22, 24, 23, ... What number should come next?   ",
      options: ["24", "22", "25", "26"],
      correctAnswer: "25",
      explanation: "You're correct! The speed is 25.",
    ),
    Question(
      questionText: "Look at this series: 36, 34, 30, 28, 24, ... What number should come next?   ",
      options: ["20", "22", "23", "26"],
      correctAnswer: "22",
      explanation: "You're correct! The speed is 22.",
    ),



    // Add more questions here...
  ];

  String? selectedAnswer;
  String? feedback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Maths Quiz 2"), ///Custom app bar
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
              "Question ${currentQuestionIndex + 1}: ${questions[currentQuestionIndex].questionText}",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Column(
              children: questions[currentQuestionIndex]
                  .options
                  .map((option) => AnswerButton(
                text: option,
                onPressed: () => selectAnswer(option),
              ))
                  .toList(),
            ),
            SizedBox(height: 20),
            if (feedback != null) Text(feedback!),
            SizedBox(height: 20),
            if (feedback != null)
              ElevatedButton(
                onPressed: () => goToNextQuestion(),
                child: Text("Next"),
              ),
          ],
        ),
      ),
    );
  }

  void selectAnswer(String answer) {
    setState(() {
      selectedAnswer = answer;
      if (answer == questions[currentQuestionIndex].correctAnswer) {
        feedback = "Correct! ${questions[currentQuestionIndex].explanation}";
      } else {
        feedback = "Incorrect. Try again.";
      }
    });
  }

  void goToNextQuestion() {
    setState(() {
      currentQuestionIndex++;
      selectedAnswer = null;
      feedback = null;

      if (currentQuestionIndex >= questions.length) {
        // Quiz completed, you can navigate to a summary screen or reset the quiz.
        // For now, we reset the quiz to the first question.
        currentQuestionIndex = 0;
      }
    });
  }
}

class Question {
  final String questionText;
  final List<String> options;
  final String correctAnswer;
  final String explanation;

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswer,
    required this.explanation,
  });
}

class AnswerButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  AnswerButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
