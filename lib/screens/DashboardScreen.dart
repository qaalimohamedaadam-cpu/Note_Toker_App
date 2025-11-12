import 'package:flutter/material.dart';
import 'AdminScreen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFFDF8FF,
      ), // Background-ka ayaa la dhigay mid light ah si dashboard-ku u muuqdo nadiif ah
      appBar: AppBar(
        backgroundColor:
            Colors.transparent, //  AppBar aan midab lahayn (transparent)
        elevation: 0,
        leading:
            const SizedBox.shrink(), //  Meesha 'back arrow' kasoo muuqan lahayd waa la tirtiray
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_outlined),
            color: Colors.black87, //  Color icon si cad ugu muuqda
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_outlined),
            color: Colors.black87,
          ),
        ],
        toolbarHeight:
            70, // \ Height yar oo la kordhiyay si design-ku u furan yahay
        title: const Text(
          'Admin Dashboard',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: false, //  Title-ka dhinac bidix ah
        titleSpacing: 20, //  Spacing u dhexeeya geeska iyo title-ka
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          //  ScrollView ayaa lagu daray si overflow uusan u dhicin marka screen-yar la isticmaalo
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Overview',
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Monitor key metrics and recent activity across the workspace.',
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                  ),
                  const SizedBox(width: 10),

                  //  "Manage users" button la hagaajiyay (midab, shape, size, icon)
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const Adminscreen()),
                      );
                    },
                    icon: const Icon(Icons.group_add_outlined, size: 18),
                    label: const Text(
                      'Manage users',
                      style: TextStyle(fontSize: 13),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(
                        0xFFE8E7FF,
                      ), // 💬 Midab purple soft ah
                      foregroundColor: Colors.deepPurple,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),

              //  GridView si responsive ah loo dhigay oo aan la scrollin si uu Column-ka ugu dhex jiro
              GridView.count(
                crossAxisCount: 2, // Laba column oo card ah
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(), // Scroll-ka Grid-ka la damiyay
                childAspectRatio:
                    1.05, //Ratio lagu hagaajiyay si card-yadu u siman yihiin
                children: const [
                  // 💬 InfoCard waa widget custom ah oo aan hoos ku sameynay
                  InfoCard(
                    icon: Icons.note_alt_outlined,
                    title: 'Total Notes',
                    value: '1,248',
                  ),
                  InfoCard(
                    icon: Icons.person_outline,
                    title: 'Active Users',
                    value: '312',
                    iconBg: Color(0xFFE8FBF2),
                  ),
                  InfoCard(
                    icon: Icons.star_border_outlined,
                    title: 'New Today',
                    value: '48',
                    iconBg: Color(0xFFFFF5E6),
                  ),
                  InfoCard(
                    icon: Icons.error_outline,
                    title: 'Flagged',
                    value: '3',
                    iconBg: Color(0xFFFFEBEE),
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),

      // 💬 Bottom bar yar oo qurxin ah (iOS style)
      bottomNavigationBar: const SizedBox(
        height: 20,
        child: Center(
          child: SizedBox(
            width: 140,
            height: 6,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// 💬 InfoCard waa widget loo sameeyay si dashboard-ka uusan code badan ugu noqonin
class InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color? iconBg;

  const InfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    this.iconBg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // 💬 Card background caddaan ah
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          // 💬 Shadow yar si card-ku u muuqdo
          BoxShadow(
            color: Color.fromARGB(25, 0, 0, 0),
            blurRadius: 8,
            offset: Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 💬 Icon-ka card-ka kore
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color:
                  iconBg ??
                  const Color(0xFFEEF2FF), // 💬 Midab background ah icon-ka
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 22, color: Colors.black54),
          ),
          const Spacer(),
          Text(title, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 26,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
