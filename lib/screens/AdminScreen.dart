import 'package:flutter/material.dart';

class Adminscreen extends StatelessWidget {
  const Adminscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar with back
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.black87,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Users Management',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 46,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(18, 0, 0, 0),
                            blurRadius: 10,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: const [
                          Icon(Icons.search, color: Colors.black54),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search by name...',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    height: 46,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(18, 0, 0, 0),
                          blurRadius: 10,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Row(
                      children: const [
                        Text('All'),
                        SizedBox(width: 6),
                        Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(bottom: 100),
                  children: const [
                    UserCard(
                      initials: 'F',
                      name: 'fatima cali ',
                      email: 'fatima.cali@gmail.com',
                      notes: '86 notes',
                      status: 'Active',
                      statusColor: Color(0xFFDFF8EE),
                    ),
                    SizedBox(height: 12),
                    UserCard(
                      initials: 'M',
                      name: 'Mushtaq AbdiNour',
                      email: 'Mushtaq.AbdiNour@gmail.com',
                      notes: '60 notes',
                      status: 'Active',
                      statusColor: Color(0xFFDFF8EE),
                    ),
                    SizedBox(height: 12),
                    UserCard(
                      initials: 'M',
                      name: 'Mahad Mohammett',
                      email: 'Mahad.Mohammett@gmail.com',
                      notes: '12 notes',
                      status: 'Invited',
                      statusColor: Color(0xFFFFF0D9),
                    ),
                    SizedBox(height: 12),
                    UserCard(
                      initials: 'K',
                      name: 'Kowthar Ali',
                      email: 'Kowthar.Ali@gmail.com',
                      notes: '55 notes',
                      status: 'Active',
                      statusColor: Color(0xFFDFF8EE),
                    ),
                    SizedBox(height: 12),
                    UserCard(
                      initials: 'K',
                      name: 'Kaafiso cisman',
                      email: 'Kaafiso.cisman@gmail.com',
                      notes: '55 notes',
                      status: 'Active',
                      statusColor: Color(0xFFDFF8EE),
                    ),
                    SizedBox(height: 12),
                    UserCard(
                      initials: 'Q',
                      name: 'qaali maxamed',
                      email: 'qaali.maxamed@gmail.com',
                      notes: '55 notes',
                      status: 'Active',
                      statusColor: Color(0xFFDFF8EE),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.person_add),
        label: const Text('Invite user'),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4B6BFF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          elevation: 8,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class UserCard extends StatelessWidget {
  final String initials;
  final String name;
  final String email;
  final String notes;
  final String status;
  final Color statusColor;

  const UserCard({
    super.key,
    required this.initials,
    required this.name,
    required this.email,
    required this.notes,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // card
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(18, 0, 0, 0),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      child: Row(
        children: [
          // avatar circle
          CircleAvatar(
            backgroundColor: const Color(0xFFEEF2FF),
            child: Text(
              initials,
              style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: 12),
          // details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  style: TextStyle(color: Colors.grey[500], fontSize: 13),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      notes,
                      style: TextStyle(color: Colors.grey[500], fontSize: 12),
                    ),
                    const SizedBox(width: 8),
                    Text('·', style: TextStyle(color: Colors.grey[400])),
                    const SizedBox(width: 8),
                    Text(
                      'Just now',
                      style: TextStyle(color: Colors.grey[500], fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // status badge and overflow
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(
                  status,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
            ],
          ),
        ],
      ),
    );
  }
}
