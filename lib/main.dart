import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/models/answer_summary.dart';
import 'package:quiz_app/widgets/quiz_screen.dart';
import 'package:quiz_app/widgets/result_screen.dart';
import 'package:quiz_app/widgets/start_screen.dart';

void main() {
  runApp(MaterialApp(
    title: 'Quiz App',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeSCreen = 0;
  int questionIndex = 0;
  var selectedOptions = [];

  void goToQuiz() {
    setState(() {
      activeSCreen = 1;
    });
  }

  void answerQuestion(String optionText) {
    setState(() {
      if (questionIndex < questions.length - 1) {
        questionIndex++;
      } else {
        activeSCreen = 2;
      }
    });
    selectedOptions.add(optionText);
  }

  Map<String, Object> get getSummary {
    final List<Map<String, Object>> answerSummaryList = [];
    final noCorrectAnswers = [];
    for (var i = 0; i < selectedOptions.length; i++) {
      answerSummaryList.add({
        'question_index': i + 1,
        'question': questions[i].question,
        'selected_answer': selectedOptions[i],
        'correct_anser': questions[i].options[0]
      });
      if (selectedOptions[i] == questions[i].options[0]) {
        noCorrectAnswers.add(selectedOptions[i]);
      }
    }

    return {
      'noCorrectAnswers': noCorrectAnswers.length,
      'totalQuestions': questions.length,
      'answerSummaryList': answerSummaryList
    };
  }

  restartQuiz() {
    setState(() {
      activeSCreen = 0;
      questionIndex = 0;
    });

    selectedOptions = [];
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      StartScreen(onPressed: (() => goToQuiz())),
      QuizScreen(
        question: questions[questionIndex].question,
        options: questions[questionIndex].options,
        onPressed: answerQuestion,
      ),
      ResultScreen(
        answerSummary: AnswerSummary(
          noCorrectAnswers: getSummary['noCorrectAnswers'] as int,
          totalQuestions: getSummary['totalQuestions'] as int,
          answerSummaryList:
              getSummary['answerSummaryList'] as List<Map<String, Object>>,
        ),
        onPressed: restartQuiz,
      ),
    ];
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 62, 3, 73),
              Color.fromARGB(255, 154, 11, 180),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: screens[activeSCreen],
      ),
    );
  }
}
