import 'package:flutter/material.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  final int userRating;

  const QuizScreen({super.key, required this.userRating});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  List<String?> _userAnswers = List.filled(10, null);

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What can be broken but never held?',
      'options': ['A secret', 'A promise', 'A glass', 'A code'],
      'answer': 'A promise'
    },
    {
      'question': 'What has keys but can’t open locks?',
      'options': ['Map', 'Piano', 'Keyboard', 'Clock'],
      'answer': 'Piano'
    },
    {
      'question': 'The more of me you take, the more you leave behind. What am I?',
      'options': ['Time', 'Memories', 'Footsteps', 'Shadow'],
      'answer': 'Footsteps'
    },
    {
      'question': 'I speak without a mouth and hear without ears. What am I?',
      'options': ['Wind', 'Echo', 'Thought', 'Ghost'],
      'answer': 'Echo'
    },
    {
      'question': 'What has a head, a tail, but no body?',
      'options': ['Snake', 'Coin', 'Comet', 'Thread'],
      'answer': 'Coin'
    },
    {
      'question': 'What comes once in a minute, twice in a moment, but never in a thousand years?',
      'options': ['Eternity', 'Time', 'Letter M', 'Second'],
      'answer': 'Letter M'
    },
    {
      'question': 'What is always in front of you but can’t be seen?',
      'options': ['Air', 'Future', 'Light', 'Horizon'],
      'answer': 'Future'
    },
    {
      'question': 'I have cities but no houses, forests but no trees, and rivers but no water. What am I?',
      'options': ['Dream', 'Imagination', 'Map', 'Desert'],
      'answer': 'Map'
    },
    {
      'question': 'What can fill a room but takes up no space?',
      'options': ['Sound', 'Hope', 'Light', 'Air'],
      'answer': 'Light'
    },
    {
      'question': 'What gets wetter the more it dries?',
      'options': ['Sponge', 'Cloth', 'Towel', 'Rain'],
      'answer': 'Towel'
    },
  ];

  String? _selectedOption;

  void _nextQuestion() {
    if (_selectedOption == null) return;

    _userAnswers[_currentQuestionIndex] = _selectedOption;

    if (_selectedOption == _questions[_currentQuestionIndex]['answer']) {
      _score++;
    }

    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedOption = null;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ResultScreen(
            score: _score,
            questions: _questions,
            userAnswers: _userAnswers,
            userRating: widget.userRating,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentQuestionIndex];

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
         
          Image.asset(
            "assets/img_2.jpeg", 
            fit: BoxFit.cover,
          ),
          // Overlay
          Container(
            color: Colors.black.withOpacity(0.7),
          ),
          // Quiz Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Question ${_currentQuestionIndex + 1}/${_questions.length}',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    question['question'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ...(question['options'] as List<String>).map((option) {
                    return RadioListTile<String>(
                      activeColor: Colors.deepPurpleAccent,
                      title: Text(option, style: const TextStyle(color: Colors.white)),
                      value: option,
                      groupValue: _selectedOption,
                      onChanged: (value) {
                        setState(() {
                          _selectedOption = value;
                        });
                      },
                    );
                  }),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                      ),
                      onPressed: _nextQuestion,
                      child: Text(
                        _currentQuestionIndex == _questions.length - 1
                            ? 'Finish'
                            : 'Next',
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
