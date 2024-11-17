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

final User? user = Auth().loggedUser;

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (user?.email != null)
            ? Text(
                "User : ${user?.email}",
                style: TextStyle(fontFamily: "Nunito"),
              )
            : Text(
                "User : ${user?.phoneNumber}",
                style: TextStyle(fontFamily: "Nunito"),
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
                width: 180,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.verified),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Win Certificate",
                      style: TextStyle(fontFamily: "Nunito"),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
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
