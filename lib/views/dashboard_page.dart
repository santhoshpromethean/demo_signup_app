import 'package:demo_login_app/auth.dart';
import 'package:demo_login_app/custom%20widgets/custom_navigation_bar.dart';
import 'package:demo_login_app/views/profile_page.dart';
import 'package:demo_login_app/views/signin_with_email.dart';
import 'package:demo_login_app/views/sign_in_page.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const CustomBottomNavigationBar();
          } else {
            return const SignInPage();
          }
        });
  }
}
