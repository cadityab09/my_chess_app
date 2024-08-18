import 'package:flutter/material.dart';
import 'package:my_chess_app/View/home_screen.dart';
import 'package:my_chess_app/View/match_view.dart';
import 'package:my_chess_app/View/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      home: SplashScreen(),
    );
  }
}
