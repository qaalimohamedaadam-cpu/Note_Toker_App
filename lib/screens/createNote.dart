import 'package:flutter/material.dart';

class CreateNoteScreen extends StatefulWidget {
  const CreateNoteScreen({super.key});

  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
  final titleController = TextEditingController();
  final noteController = TextEditingController();
  int selectedColor = 0;

  final List<Color> noteColors = [
    const Color(0xFFFFE5B4), // Orange
    const Color(0xFFD8F3DC), // Green
    const Color(0xFFFFF3B0), // Yellow
    const Color(0xFFFAD2E1), // Pink
    const Color(0xFFEAEAEA), // Grey
    const Color(0xFFE0E7FF), // Light Blue
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // ✅ important
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          // ✅ fixes overflow
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back & Profile icons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black87,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const CircleAvatar(
                    radius: 18,
                    backgroundColor: Color(0xFFF3F4F6),
                    child: Icon(Icons.person, color: Colors.blueAccent),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              const Text(
                "Create Note",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 25),

              // Title Field
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: "Title",
                  filled: true,
                  fillColor: const Color(0xFFF3F4F6),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // Note Field
              TextField(
                controller: noteController,
                maxLines: 8,
                decoration: InputDecoration(
                  hintText: "Write your note...",
                  filled: true,
                  fillColor: const Color(0xFFF3F4F6),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                "Choose color",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),

              //  Color Selector
              SizedBox(
                height: 45,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: noteColors.length,
                  itemBuilder: (context, index) {
                    final color = noteColors[index];
                    final isSelected = index == selectedColor;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedColor = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 12),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(12),
                          border:
                              isSelected
                                  ? Border.all(
                                    color: Colors.blueAccent,
                                    width: 2,
                                  )
                                  : null,
                        ),
                        child:
                            isSelected
                                ? const Icon(Icons.check, color: Colors.white)
                                : null,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),

              // Save Note Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  minimumSize: const Size(double.infinity, 55),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Note saved successfully!")),
                  );
                },
                child: const Text(
                  "Save note",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
