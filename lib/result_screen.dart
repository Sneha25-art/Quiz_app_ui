import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final List<Map<String, dynamic>> questions;
  final List<String?> userAnswers;
  final int userRating;

  const ResultScreen({
    super.key,
    required this.score,
    required this.questions,
    required this.userAnswers,
    required this.userRating,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> incorrectAnswers = [];

    for (int i = 0; i < questions.length; i++) {
      if (userAnswers[i] != questions[i]['answer']) {
        incorrectAnswers.add({
          'question': questions[i]['question'],
          'yourAnswer': userAnswers[i] ?? 'No answer',
          'correctAnswer': questions[i]['answer'],
        });
      }
    }

    

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Your Results'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'You scored $score out of ${questions.length}!',
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              if (score == questions.length && userRating >= 3)
                   const Text(
                             '🎉 Wow! You know yourself well!',
                              style: TextStyle(fontSize: 18, color: Colors.greenAccent),
                             )
              else if (score == questions.length && userRating < 3)
                          const Text(
                              '🤔 You answered all questions correctly, but rated yourself low.\nGive yourself more credit—you did great!',
                                 style: TextStyle(fontSize: 18, color: Colors.lightBlueAccent),
                                    )
              else
                           const Text(
                                  '💡 Better luck next time! Keep learning and stay sharp!',
                                  style: TextStyle(fontSize: 18, color: Colors.orangeAccent),
                                      ),

              if (incorrectAnswers.isNotEmpty)
                const Text(
                  'Questions you missed:',
                  style: TextStyle(fontSize: 20, color: Colors.white70),
                ),
              const SizedBox(height: 10),
              ...incorrectAnswers.map((e) {
                return Card(
                  color: Colors.deepPurple.withOpacity(0.2),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    title: Text(
                      e['question'] ?? '',
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      'Your answer: ${e['yourAnswer']}\nCorrect answer: ${e['correctAnswer']}',
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ),
                );
              }),
              const SizedBox(height: 40),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  ),
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  child: const Text(
                    'Play Again',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
