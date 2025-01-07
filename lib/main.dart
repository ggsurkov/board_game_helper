import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(BoardGameHelper());
}

class BoardGameHelper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainMenu(),
    );
  }
}

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Menu'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DiceScreen()),
                );
              },
              child: Text('Finger Dice'),
            ),
            ElevatedButton(
              onPressed: () {
                // Add navigation to another page here
              },
              child: Text('Other Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class DiceScreen extends StatefulWidget {
  @override
  _DiceScreenState createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  int _diceNumber = 1; // Initial dice value

  void _rollDice() {
    setState(() {
      _diceNumber = Random().nextInt(6) + 1; // Random number between 1 and 6
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Finger Dice'),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: _rollDice,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tap the screen to roll the dice!',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Image.asset(
                'assets/dice_$_diceNumber.png',
                height: 150,
                width: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
