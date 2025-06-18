import 'package:flutter/material.dart';
import 'quiz_screen.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  double _rating = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Fullscreen background image
          Image.asset(
            "assets/img_2.jpeg",
            fit: BoxFit.cover, // Cover the entire screen
          ),

          // Semi-transparent black overlay
          Container(
            color: Colors.black.withOpacity(0.7),
          ),

          // UI elements in center
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Rate Yourself!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'On a scale of 1 to 10, how smart do you think you are?',
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  Slider(
                    value: _rating,
                    min: 1,
                    max: 10,
                    divisions: 9,
                    label: _rating.round().toString(),
                    onChanged: (value) {
                      setState(() {
                        _rating = value;
                      });
                    },
                  ),
                  Text(
                    _rating.round().toString(),
                    style: const TextStyle(
                      color: Colors.deepPurpleAccent,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => QuizScreen(userRating: _rating.round()),
                        ),
                      );
                    },
                    child: const Text(
                      'Start Game',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
