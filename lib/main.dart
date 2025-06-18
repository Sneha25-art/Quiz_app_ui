import 'package:flutter/material.dart';
import 'splash_screen.dart';  
import 'intro_screen.dart';


void main() {
  runApp(const SmartQuizApp());
}

class SmartQuizApp extends StatelessWidget {
  const SmartQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Are You Smart?',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const SplashScreen(), 
      routes:
        {
          '/intro': (context) => const IntroScreen(),
        },
    );
  }
}
