import 'package:flutter/material.dart';
import 'package:note_toker_app/screens/DashboardScreen.dart';
import 'package:note_toker_app/screens/AdminScreen.dart';
import 'package:note_toker_app/screens/HomeScreen.dart';
import 'package:note_toker_app/screens/LoginScreen.dart';
import 'package:note_toker_app/screens/ProfileScreen.dart';
import 'package:note_toker_app/screens/createNote.dart';
import 'package:note_toker_app/screens/main_navigation_Screen.dart';

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
