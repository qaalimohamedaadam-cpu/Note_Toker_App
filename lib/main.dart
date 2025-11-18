import 'package:flutter/material.dart';
import 'package:note_toker_app/screens/login_screen.dart';

void main() {
  runApp(const NoteTakerApp());
}

class NoteTakerApp extends StatelessWidget {
  const NoteTakerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note Taker App',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
