import 'package:flutter/material.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({super.key});

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Score",
          style: TextStyle(fontFamily: "Nunito", fontSize: 18),
        ),
      ),
      body: const Center(
          child: Text(
        "No Leaderboard",
        style: TextStyle(fontFamily: "Nunito"),
      )),
    );
  }
}
