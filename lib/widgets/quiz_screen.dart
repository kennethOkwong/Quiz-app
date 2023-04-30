import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/option_button.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen(
      {super.key,
      required this.onPressed,
      required this.question,
      required this.options});

  final String question;
  final List<String> options;
  final void Function(String text) onPressed;

  List<String> get getShuffledOptions {
    var shuffledOptions = List.of(options);
    shuffledOptions.shuffle();
    return shuffledOptions;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              question,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ...getShuffledOptions.map((option) {
              return OptionButton(
                text: option,
                onPressed: () => onPressed(option),
              );
            })
          ],
        ));
  }
}
