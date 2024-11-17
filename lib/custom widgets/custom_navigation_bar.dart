import 'package:flutter/material.dart';

import '../views/certificate_page.dart';
import '../views/chats_page.dart';
import '../views/profile_page.dart';
import '../views/score_page.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int currentTab = 1;

  final List<Widget> pageList = [
    CertificatePage(),
    ProfilePage(),
    ChatsPage(),
    ScorePage(),
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: pageList[currentTab],
        bottomNavigationBar: BottomAppBar(
          // height: height * 0.1,
          child: Padding(
            padding: EdgeInsets.only(top: height * 0.007),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildNavigatingItem(
                  icon: Icons.verified_outlined,
                  index: 0,
                  text: "Certificate",
                ),
                buildNavigatingItem(
                  icon: Icons.person,
                  index: 1,
                  text: "Profile",
                ),
                buildNavigatingItem(
                  icon: Icons.chat,
                  index: 2,
                  text: "Chats",
                ),
                buildNavigatingItem(
                  icon: Icons.leaderboard,
                  text: "Score",
                  index: 3,
                ),
              ],
            ),
          ),
        ));
  }

  Widget buildNavigatingItem({
    required IconData icon,
    required int index,
    required String text,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentTab = index;
        });
      },
      child: Column(
        children: [
          Icon(
            size: 20,
            icon,
            color: currentTab == index ? Color(0xffFF5722) : Colors.black54,
          ),
          Text(
            text,
            style: TextStyle(
              fontFamily: "Nunito",
              color: currentTab == index ? Color(0xffFF5722) : Colors.black54,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
