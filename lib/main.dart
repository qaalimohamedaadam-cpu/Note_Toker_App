import 'package:flutter/material.dart';
import 'package:note_toker_app/presentation/admin/screens/admin_screen.dart';
import 'package:note_toker_app/presentation/auth/screens/login_screen.dart';
import 'package:note_toker_app/presentation/client/screens/home_screen.dart';
import 'package:note_toker_app/provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],

      child: const NoteTakerApp(),
    ),
  );
}

class NoteTakerApp extends StatefulWidget {
  const NoteTakerApp({super.key});

  @override
  State<NoteTakerApp> createState() => _NoteTakerAppState();
}

class _NoteTakerAppState extends State<NoteTakerApp> {
  bool isLoggedIn = false;
  String role = "user";

  @override
  void initState() {
    super.initState();
    verify();
  }

  Future<void> verify() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final loggedIn = pref.getBool("isLoggedIn") ?? false;
    final savedRole = pref.getString("role") ?? "user";
    setState(() {
      isLoggedIn = loggedIn;
      role = savedRole;
    });
  }
   @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note Taker App',
      debugShowCheckedModeBanner: false,
      home:
          isLoggedIn
              ? (role == "admin" ? const Adminscreen() : const HomeScreen())
              : const LoginScreen(),
    );
  }
}
