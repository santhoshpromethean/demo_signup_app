import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'views/dashboard_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: 'AIzaSyB5hJnoG6LNRjBthUrKAntE0T0BslPo5Xc',
    appId: '1:610213625650:android:80e538d2866bf1aedfe12b',
    projectId: 'demologinapp-58753',
    storageBucket: 'demologinapp-58753.firebasestorage.app',
    messagingSenderId: '610213625650',
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo Login App',
      home: DashboardPage(),
    );
  }
}
