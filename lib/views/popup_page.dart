import 'dart:async';
import 'package:flutter/material.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  late Timer _timer;
  int _timeRemaining = 30;
  bool _isInputEnabled = true;
  final TextEditingController _answerController = TextEditingController();

  @override
  void initState() {
    super.initState();
    timerStart();
  }

  @override
  void dispose() {
    _timer.cancel();
    _answerController.dispose();
    super.dispose();
  }

  void timerStart() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeRemaining > 0) {
          _timeRemaining--;
        } else {
          _isInputEnabled = false;
          _timer.cancel();
        }
      });
    });
  }

  void _submitAnswer() {
    final about = _answerController.text;
    if (about.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
          "Answer submitted.",
          style: TextStyle(fontFamily: "Nunito"),
        )),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
          "Write something before submitting.",
          style: TextStyle(fontFamily: "Nunito"),
        )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Win Certificate",
          style: TextStyle(fontFamily: "Nunito"),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Tell me about yourself?",
              style: TextStyle(fontFamily: "Nunito", fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: height * 0.02),
            TextField(
              controller: _answerController,
              maxLines: 4,
              style: TextStyle(fontFamily: "Nunito"),
              enabled: _isInputEnabled,
              decoration: InputDecoration(
                hintText: "Write here",
                hintStyle: TextStyle(fontFamily: "Nunito"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            Text(
              "$_timeRemaining seconds remaining.",
              style: const TextStyle(
                fontFamily: "Nunito",
                fontSize: 16,
                color: Colors.red,
              ),
            ),
            SizedBox(height: height * 0.02),
            ElevatedButton(
              onPressed: _isInputEnabled ? null : _submitAnswer,
              child: const Text(
                "Submit Answer",
                style: TextStyle(fontFamily: "Nunito"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
