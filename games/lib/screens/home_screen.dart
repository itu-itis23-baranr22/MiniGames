import 'package:flutter/material.dart';
import 'package:proje1/screens/second_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(221, 255, 255, 255),
      appBar: AppBar(
        title: const Text(
          "Uygulamam",
          style: TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
        ),
        backgroundColor: Colors.indigo.shade200,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Bana Tikla",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text("Merhaba Dünya"),
            Image.asset('assets/images/logo.png', width: 200, height: 200),
            Image.network(
              "https://images.pdimagearchive.org/collections/edith-wharton-italian-villas/italianvillast00whar_0299-edit.jpeg?width=1580&height=800",
              width: 300,
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.thumb_up)),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondScreen()),
                );
              },
              icon: Icon(Icons.travel_explore_sharp),
            ),
          ],
        ),
      ),
    );
  }
}
