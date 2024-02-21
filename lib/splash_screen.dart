import 'package:flutter/material.dart';
import 'package:emo/gemini_chatbot_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ChatbotIntegration()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue, // GoldenBrown color
      body: Center(
        child: Text(
          'EMO',
          style: TextStyle(
            color: Color(0xFFDAA520), // Custom text color
            fontSize: 40,
            fontWeight: FontWeight.bold,
             // Specify your preferred font family
          ),
        ),
      ),
    );
  }
}
