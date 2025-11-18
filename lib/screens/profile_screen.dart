import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Profile",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Avatar + Name + Email
              Row(
                children: [
                  const CircleAvatar(
                    radius: 35,
                    backgroundColor: Color(0xFFE0E0E0),
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Abdi",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "abdi@gmail.com",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),

              const Text(
                "Settings",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 15),

              // Setting options
              ListTile(
                leading: const Icon(Icons.notifications),
                title: const Text("Notifications"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.lock),
                title: const Text("Privacy"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.color_lens),
                title: const Text("Theme"),
                onTap: () {},
              ),

              const Spacer(),
              Center(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    side: const BorderSide(color: Colors.blueAccent),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Log out",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
