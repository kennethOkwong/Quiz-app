import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          color: const Color.fromARGB(150, 255, 255, 255),
          width: 250,
        ),
        const SizedBox(height: 40),
        const Text(
          'Learn Flutter the fun way!',
          style: TextStyle(fontSize: 17, color: Colors.white),
        ),
        const SizedBox(height: 40),
        OutlinedButton.icon(
          onPressed: () {
            onPressed();
          },
          label: const Text('Start Quiz'),
          icon: const Icon(Icons.arrow_circle_right_outlined),
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
          ),
        )
      ],
    );
  }
}
