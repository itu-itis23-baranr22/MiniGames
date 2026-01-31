import 'dart:collection';
import 'package:flutter/material.dart';

class Xo extends StatefulWidget {
  const Xo({super.key});

  @override
  State<Xo> createState() => _XoState();
}

class _XoState extends State<Xo> {
  final List<bool> tapped = List.filled(9, false);
  final List<String> board = List.filled(9, '');
  bool isXTurn = true;
  bool iswin = false;
  final Queue<int> xQueue = Queue<int>();
  final Queue<int> oQueue = Queue<int>();

  static const int maxMovesPerPlayer = 3;

  void resetGame() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        board[i] = '';
        tapped[i] = false;
      }

      xQueue.clear();
      oQueue.clear();

      isXTurn = true;
      iswin = false;
    });
  }

  bool checkwin() {
    for (int i = 0; i < 9; i += 3) {
      if (board[i] == board[i + 1] &&
          board[i + 1] == board[i + 2] &&
          board[i].isNotEmpty) {
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (board[i].isNotEmpty &&
          board[i] == board[i + 3] &&
          board[i + 3] == board[i + 6]) {
        return true;
      }
    }
    if ((board[0] == board[4] && board[4] == board[8] && board[0].isNotEmpty) ||
        (board[2] == board[4] && board[4] == board[6] && board[2].isNotEmpty)) {
      return true;
    }
    return false;
  }

  void handleTap(int index) {
    if (board[index].isNotEmpty) return;

    setState(() {
      final currentQueue = isXTurn ? xQueue : oQueue;
      final symbol = isXTurn ? 'X' : 'O';

      if (currentQueue.length == maxMovesPerPlayer) {
        final oldIndex = currentQueue.removeFirst();
        board[oldIndex] = '';
        tapped[oldIndex] = false;
      }

      currentQueue.addLast(index);
      board[index] = symbol;
      tapped[index] = true;

      if (checkwin()) {
        iswin = true;
        return;
      }
      isXTurn = !isXTurn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Xo Screen"),
        backgroundColor: Colors.indigo.shade200,
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          children: [
            Image.asset('assets/images/tick_tac_toe.jpg'),

            Positioned(left: 90, top: 55, child: tap(0)),
            Positioned(left: 210, top: 55, child: tap(1)),
            Positioned(left: 330, top: 55, child: tap(2)),
            Positioned(left: 90, top: 175, child: tap(3)),
            Positioned(left: 210, top: 175, child: tap(4)),
            Positioned(left: 330, top: 175, child: tap(5)),
            Positioned(left: 90, top: 290, child: tap(6)),
            Positioned(left: 210, top: 290, child: tap(7)),
            Positioned(left: 330, top: 290, child: tap(8)),
            if (iswin) Positioned.fill(child: win(resetGame)),
          ],
        ),
      ),
    );
  }

  Widget tap(int index) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => handleTap(index),
      child: SizedBox(
        width: 100,
        height: 100,
        child: Center(
          child: Text(
            board[index],
            style: TextStyle(
              fontSize: 80,
              fontWeight: FontWeight.bold,
              color: board[index] == 'X'
                  ? const Color.fromARGB(255, 165, 0, 0)
                  : const Color.fromARGB(255, 0, 90, 180),
            ),
          ),
        ),
      ),
    );
  }
}

Widget win(VoidCallback onRestart) {
  return Container(
    color: Colors.black54,
    child: Center(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "YOU WIN 🎉",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: onRestart, child: const Text("Restart")),
          ],
        ),
      ),
    ),
  );
}
