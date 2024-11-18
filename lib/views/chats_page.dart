import 'package:flutter/material.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Chats",
          style: TextStyle(fontFamily: "Nunito", fontSize: 18),
        ),
      ),
      body: const Center(
        child: Text(
          "No New Messages.",
          style: TextStyle(fontFamily: "Nunito"),
        ),
      ),
    );
  }
}
