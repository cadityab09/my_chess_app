import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_chess_app/View/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _currentIndex = 0;
  List<String> _images = [
    'assets/chess_icons/black/king.png',
    'assets/chess_icons/black/queen.png',
    'assets/chess_icons/black/rook.png',
    'assets/chess_icons/black/bishop.png',
    'assets/chess_icons/black/left_knight.png',
    'assets/chess_icons/black/pawn.png',

  ];

  @override
  void initState() {
    super.initState();
    _startSplashSequence();
  }

  void _startSplashSequence() {
    Timer imageTimer = Timer.periodic(const Duration(milliseconds: 500), (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _images.length;
      });
    });

    Timer(Duration(seconds: 5), () {
      imageTimer.cancel(); // Stop the image sequence timer
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 1),
              child: Container(
                height: MediaQuery.of(context).size.height *0.19,
                width: MediaQuery.of(context).size.width *0.19,
                child: Image.asset(
                  color: Colors.white,
                  _images[_currentIndex],
                  key: ValueKey<int>(_currentIndex),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text("My Chess", style: TextStyle(color: Colors.greenAccent, fontSize: 30, fontWeight: FontWeight.w500),)
        ],
      ),
    );
  }
}
