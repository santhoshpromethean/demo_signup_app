import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../auth.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _phoneController =
      TextEditingController(text: "+91");
  final TextEditingController _otpController = TextEditingController();
  String? _verificationId;
  String? _errorMessage;

  void sendOTP() async {
    try {
      await Auth().verifyPhoneNumber(
        phoneNumber: _phoneController.text.trim(),
        onCodeSent: (String verificationId) {
          setState(() {
            _verificationId = verificationId;
          });
        },
        onError: (FirebaseAuthException e) {
          setState(() {
            _errorMessage = "Enter Valid Phone Number";
          });
        },
        onVerified: (credential) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text(
              "Verified.",
              style: TextStyle(fontFamily: "Nunito"),
            )),
          );
        },
      );
    } catch (e) {
      setState(() {
        _errorMessage = "Enter Valid Phone Number";
      });
    }
  }

  void verifyOTP() async {
    try {
      if (_verificationId != null) {
        await Auth().signInWithOTP(
          verificationId: _verificationId!,
          otp: _otpController.text.trim(),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
            "Log in success.",
            style: TextStyle(fontFamily: "Nunito"),
          )),
        );
      }
    } catch (e) {
      setState(() {
        _errorMessage = "Invalid OTP";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sign up",
          style: TextStyle(fontFamily: "Nunito"),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _phoneController,
                style: const TextStyle(fontFamily: "Nunito"),
                decoration: InputDecoration(
                    labelText: "Phone Number",
                    labelStyle: const TextStyle(fontFamily: "Nunito"),
                    suffix: TextButton(
                        onPressed: sendOTP,
                        child: const Text(
                          "Send OTP",
                          style: TextStyle(fontFamily: "Nunito"),
                        ))),
                keyboardType: TextInputType.phone,
                maxLength: 13,
                onChanged: (value) {
                  if (!value.startsWith("+91")) {
                    _phoneController.text = "+91";
                    _phoneController.selection = TextSelection.fromPosition(
                      TextPosition(offset: _phoneController.text.length),
                    );
                  }
                },
              ),
              if (_verificationId != null)
                Padding(
                  padding: EdgeInsets.only(top: height * 0.02),
                  child: TextField(
                    controller: _otpController,
                    maxLength: 6,
                    style: const TextStyle(fontFamily: "Nunito"),
                    decoration: InputDecoration(
                        labelText: "Enter OTP",
                        labelStyle: const TextStyle(fontFamily: "Nunito"),
                        suffix: TextButton(
                            onPressed: verifyOTP,
                            child: const Text(
                              "Verify OTP",
                              style: TextStyle(fontFamily: "Nunito"),
                            ))),
                    keyboardType: TextInputType.number,
                  ),
                ),
              SizedBox(height: height * 0.01),
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    _errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              SizedBox(height: height * 0.01),
              const Text(
                "Or",
                style: TextStyle(fontFamily: "Nunito"),
              ),
              SizedBox(height: height * 0.02),
              ElevatedButton(
                onPressed: () async {
                  User? user = await Auth().signInWithGoogle();
                  print("logged in with ${user?.email}");
                },
                child: SizedBox(
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 25,
                        child: Image.asset(
                          "assets/images/googlelogo.png",
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "Continue with Google",
                        style: TextStyle(fontFamily: "Nunito"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
