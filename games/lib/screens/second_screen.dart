import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ikinci Sayfa"),
        backgroundColor: Colors.indigo.shade200,
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          "Burası İkinci Sayfa",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
