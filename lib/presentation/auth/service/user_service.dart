import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:note_toker_app/presentation/admin/screens/admin_screen.dart';
import 'package:note_toker_app/presentation/client/screens/home_screen.dart';
import 'package:note_toker_app/provider.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  String baseUrl = "https://note-toker-app.onrender.com";

  Future<void> login({
    required BuildContext ctx,
    required String email,
    required String password,
  }) async {
    try {
      print("calling login api...");
      final http.Response response = await http.post(
        Uri.parse("$baseUrl/api/auth/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );

      print(response.body);

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        final role = responseData["data"]?["role"] ?? "user";
        final token = responseData["Token"] ?? "";

        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setBool("isLoggedIn", true);
        pref.setString("role", role);

        if (token.isNotEmpty) {
          pref.setString("token", token);
        }

        // Save user data in Provider
        Map<String, dynamic> data = responseData["data"] ?? {};
        String dataString = jsonEncode(data);
        Provider.of<UserProvider>(ctx, listen: false).setUser(dataString);

        // Navigate
        if (role == "admin") {
          Navigator.of(ctx).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => Adminscreen()),
            (route) => false,
          );
        } else {
          Navigator.of(ctx).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => HomeScreen()),
            (route) => false,
          );
        }
      } else {
        final message = jsonDecode(response.body)["message"] ?? "Login failed";
        ScaffoldMessenger.of(
          ctx,
        ).showSnackBar(SnackBar(content: Text(message)));
        print(response.body);
      }
    } catch (e) {
      print("Login error: $e");
      ScaffoldMessenger.of(ctx).showSnackBar(
        const SnackBar(content: Text("Failed to login. Try again.")),
      );
    }
  }

  Future<void> logOut(BuildContext contex) async {
    try {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      pref.clear();
      Provider.of<UserProvider>(contex, listen: false).logOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
