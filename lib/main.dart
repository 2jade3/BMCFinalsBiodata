import 'package:flutter/material.dart';

void main() {
  runApp(const BiodataApp());
}

class BiodataApp extends StatelessWidget {
  const BiodataApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biodata',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
        fontFamily: 'Roboto',
      ),
      home: const BiodataPage(),
    );
  }
}

class BiodataPage extends StatelessWidget {
  const BiodataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),

              // ---------- Profile Photo ----------
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.indigo.withOpacity(0.2),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  radius: 65,
                  backgroundColor: Colors.indigo,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      'https://i.pravatar.cc/300?img=12',
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // ---------- Name & Title ----------
              const Text(
                'Waje, Andrei Jade A.',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A2E),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Student at Global Reciprocal Colleges',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.indigo.shade400,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 25),

              // ---------- Personal Information Card ----------
              _buildSectionCard(
                title: 'Personal Information',
                icon: Icons.person_outline,
                children: [
                  _buildInfoRow(Icons.cake_outlined, 'Date of Birth', '23 Jan 2004'),
                  _buildInfoRow(Icons.wc_outlined, 'Gender', 'Male'),
                  _buildInfoRow(Icons.bloodtype_outlined, 'Blood Group', 'O+'),
                  _buildInfoRow(Icons.flag_outlined, 'Nationality', 'Filipino'),
                  _buildInfoRow(Icons.home_outlined, 'Address', 'Malanday, Valenzuela'),
                ],
              ),

              const SizedBox(height: 16),

              // ---------- Contact Card ----------
              _buildSectionCard(
                title: 'Contact',
                icon: Icons.contact_phone_outlined,
                children: [
                  _buildInfoRow(Icons.phone_outlined, 'Phone', '09933253103'),
                  _buildInfoRow(Icons.email_outlined, 'Email', 'andreiwaje75@gmail.com'),
                  _buildInfoRow(Icons.language_outlined, 'Website', ''),
                ],
              ),

              const SizedBox(height: 16),

              // ---------- Education Card ----------
              _buildSectionCard(
                title: 'Education',
                icon: Icons.school_outlined,
                children: [
                  _buildInfoRow(Icons.computer_outlined, 'B.Tech CSE', 'IIT Bombay (2016-2020)'),
                  _buildInfoRow(Icons.school_outlined, 'Higher Secondary', 'Delhi Public School'),
                ],
              ),

              const SizedBox(height: 16),

              // ---------- Skills Card ----------
              _buildSectionCard(
                title: 'Skills',
                icon: Icons.star_outline,
                children: [
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: const [
                      _SkillChip('Flutter'),
                      _SkillChip('Dart'),
                      _SkillChip('Firebase'),
                      _SkillChip('REST API'),
                      _SkillChip('Git'),
                      _SkillChip('UI/UX'),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // ---------- Reusable Section Card ----------
  Widget _buildSectionCard({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 22, color: Colors.indigo),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A2E),
                ),
              ),
            ],
          ),
          const Divider(height: 24),
          ...children,
        ],
      ),
    );
  }

  // ---------- Reusable Info Row ----------
  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: Colors.grey.shade500),
          const SizedBox(width: 10),
          SizedBox(
            width: 110,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1A1A2E),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------- Skill Chip Widget ----------
class _SkillChip extends StatelessWidget {
  final String label;
  const _SkillChip(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.indigo.shade50,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.indigo.shade100),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.indigo.shade700,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}