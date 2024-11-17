// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import '../auth.dart';
//
// class SignInWithEmail extends StatefulWidget {
//   const SignInWithEmail({super.key});
//
//   @override
//   State<SignInWithEmail> createState() => _SignInWithEmailState();
// }
//
// class _SignInWithEmailState extends State<SignInWithEmail> {
//   bool loggedIn = true;
//   String? errorMessage = "";
//   final TextEditingController _controllerEmail = TextEditingController();
//   final TextEditingController _controllerPassword = TextEditingController();
//
//   Future<void> signInWithEmailAndPassword() async {
//     try {
//       await Auth().signInWithEmailAndPassword(
//         email: _controllerEmail.text.trim(),
//         password: _controllerPassword.text.trim(),
//       );
//       setState(() {
//         errorMessage = null;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Logged in successfully!")),
//       );
//     } on FirebaseAuthException catch (e) {
//       setState(() {
//         errorMessage = e.message;
//       });
//     }
//   }
//
//   Future<void> createUserWithEmailAndPassword() async {
//     try {
//       await Auth().createUserWithEmailAndPassword(
//         email: _controllerEmail.text.trim(),
//         password: _controllerPassword.text.trim(),
//       );
//       setState(() {
//         errorMessage = null;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Account created successfully!")),
//       );
//     } on FirebaseAuthException catch (e) {
//       setState(() {
//         errorMessage = e.message;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Demo Auth"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextField(
//               controller: _controllerEmail,
//               decoration: const InputDecoration(labelText: "Enter Email"),
//               keyboardType: TextInputType.emailAddress,
//             ),
//             TextField(
//               controller: _controllerPassword,
//               decoration: const InputDecoration(labelText: "Enter Password"),
//               obscureText: true,
//             ),
//             const SizedBox(height: 16),
//             if (errorMessage != null && errorMessage!.isNotEmpty)
//               Padding(
//                 padding: const EdgeInsets.only(top: 8.0),
//                 child: Text(
//                   errorMessage!,
//                   style: const TextStyle(color: Colors.red),
//                 ),
//               ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () async {
//                 if (_controllerEmail.text.isEmpty ||
//                     _controllerPassword.text.isEmpty) {
//                   setState(() {
//                     errorMessage = "Email and password cannot be empty.";
//                   });
//                 } else {
//                   loggedIn
//                       ? await signInWithEmailAndPassword()
//                       : await createUserWithEmailAndPassword();
//                 }
//               },
//               child: Text(loggedIn ? "Log In" : "Sign Up"),
//             ),
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   loggedIn = !loggedIn;
//                   errorMessage == null;
//                 });
//               },
//               child: Text(loggedIn ? "Register Here" : "Log In Here"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
