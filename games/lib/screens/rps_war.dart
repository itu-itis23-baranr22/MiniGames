import 'package:flutter/material.dart';

class RpsWar extends StatelessWidget {
  const RpsWar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RPS War"),
        backgroundColor: Colors.indigo.shade200,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCard(Icons.mobile_friendly, "Rock"),
                _buildCard(Icons.description, "Paper"),
                _buildCard(Icons.content_cut, "Scissors"),
              ],
            ),

            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCard(Icons.whatshot, "Fire"),
                _buildCard(Icons.water_drop, "Water"),
                _buildCard(Icons.air, "Air"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildCard(IconData icon, String text) {
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        debugPrint("$text tapped");
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 40),
            const SizedBox(width: 12),
            Text(text, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    ),
  );
}
