import 'package:flutter/material.dart';

class CertificatePage extends StatefulWidget {
  const CertificatePage({super.key});

  @override
  State<CertificatePage> createState() => _CertificatePageState();
}

class _CertificatePageState extends State<CertificatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Certificate",
          style: TextStyle(fontFamily: "Nunito"),
        ),
      ),
      body: const Center(
        child: Text(
          "You're yet to win a Certificate",
          style: TextStyle(fontFamily: "Nunito"),
        ),
      ),
    );
  }
}
