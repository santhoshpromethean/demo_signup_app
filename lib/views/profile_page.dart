import 'dart:async';

import 'package:demo_login_app/views/popup_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

// User? user = Auth().loggedUser;

class _ProfilePageState extends State<ProfilePage> {
  User? user;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    FirebaseAuth.instance.authStateChanges().listen((User? newUser) {
      setState(() {
        user = newUser;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: (user?.email != null)
            ? Text(
                "User : ${user?.email}",
                style: TextStyle(fontFamily: "Nunito", fontSize: 18),
              )
            : Text(
                "User : ${user?.phoneNumber}",
                style: TextStyle(fontFamily: "Nunito", fontSize: 18),
              ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // (user?.email != null)
            //     ? Text(
            //         "User : ${user?.email}",
            //         style: TextStyle(fontFamily: "Nunito"),
            //       )
            //     : Text(
            //         "User : ${user?.phoneNumber}",
            //         style: TextStyle(fontFamily: "Nunito"),
            //       ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuestionPage()),
                );
              },
              child: const SizedBox(
                width: 250,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.verified,
                      size: 40,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Win Certificate",
                      style: TextStyle(fontFamily: "Nunito", fontSize: 22),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () async {
                  await Auth().signOut();
                  (user?.email != null)
                      ? print("User ${user?.email} logged out")
                      : print("User ${user?.phoneNumber} logged out");
                },
                child: const Text(
                  "Log Out",
                  style: TextStyle(fontFamily: "Nunito"),
                ))
          ],
        ),
      ),
    );
  }
}
