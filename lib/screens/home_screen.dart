import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, String>> notes = const [
    {
      "title": "Plan for today",
      "content": "Morning walk\nMorning work\nExploration\nGYM",
      "color": "0xFFFFE0B2",
    },
    {
      "title": "Travel-2023",
      "content": "Discovering the Beauty of the World\nSikkim\nNepal\nBhutan",
      "color": "0xFFC8E6C9",
    },
    {
      "title": "Tackle Writers' Block",
      "content": "A random paragraph can also be an excellent...",
      "color": "0xFFFFF9C4",
    },
    {
      "title": "Plan for today",
      "content": "Morning walk\nMorning work\nExploration\nGYM",
      "color": "0xFFFFFFFF",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "My Notes",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: "Search notes",
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.filter_list),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Notes Grid
              Expanded(
                child: GridView.builder(
                  itemCount: notes.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.9,
                  ),
                  itemBuilder: (context, index) {
                    final note = notes[index];
                    return Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Color(int.parse(note["color"]!)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            note["title"]!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Expanded(
                            child: Text(
                              note["content"]!,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
