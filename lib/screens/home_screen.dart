import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../providers/stats_provider.dart';
import '../theme/app_theme.dart';
import 'branch_screen.dart';
import 'hr_screen.dart';
import 'ai_chat_screen.dart';
import 'mock_test_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth  = context.watch<AuthProvider>();
    final stats = context.watch<StatsProvider>();

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: Row(children: const [
          Text('🎯', style: TextStyle(fontSize: 20)),
          SizedBox(width: 8),
          Text('InterviewAI',
            style: TextStyle(
              color: AppColors.orange,
              fontWeight: FontWeight.bold, fontSize: 18)),
        ]),
        actions: [
          // Profile icon
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () => _showProfile(context, auth, stats),
              child: CircleAvatar(
                backgroundColor: AppColors.orange,
                radius: 16,
                child: Text(
                  auth.name.isNotEmpty ? auth.name[0].toUpperCase() : 'U',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold, fontSize: 14)),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context,
          MaterialPageRoute(builder: (_) => const AiChatScreen())),
        backgroundColor: AppColors.orange,
        child: const Text('🤖', style: TextStyle(fontSize: 22)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Greeting
            Text('Hey ${auth.name} 👋',
              style: const TextStyle(
                color: AppColors.text,
                fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text('Practice makes perfect!',
              style: TextStyle(color: AppColors.grey, fontSize: 14)),

            const SizedBox(height: 20),

            // Stats
            Row(children: [
              _StatCard('🔥', '${stats.streak}', 'Streak'),
              const SizedBox(width: 12),
              _StatCard('✅', '${stats.solved}', 'Solved'),
            ]),

            const SizedBox(height: 24),

            // Section title
            const Text('PREPARE',
              style: TextStyle(
                color: AppColors.grey,
                fontSize: 11, fontWeight: FontWeight.bold,
                letterSpacing: 1.2)),
            const SizedBox(height: 10),

            // Menu items
            _MenuItem(
              icon: Icons.school_outlined,
              title: 'Branch Interview',
              subtitle: 'CSE, ECE, ME, Civil...',
              onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const BranchScreen())),
            ),
            const SizedBox(height: 8),
            _MenuItem(
              icon: Icons.psychology_outlined,
              title: 'HR Questions',
              subtitle: 'Behavioral & soft skills',
              onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const HRScreen())),
            ),
            const SizedBox(height: 8),
            _MenuItem(
              icon: Icons.quiz_outlined,
              title: 'Mock Test',
              subtitle: 'MCQ test — all topics',
              color: AppColors.green,
              onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const MockTestScreen())),
            ),
            const SizedBox(height: 8),
            _MenuItem(
              icon: Icons.chat_outlined,
              title: 'Ask AI',
              subtitle: 'Chat with AI coach',
              color: AppColors.orange,
              onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const AiChatScreen())),
            ),

          ],
        ),
      ),
    );
  }

  void _showProfile(BuildContext context, AuthProvider auth, StatsProvider stats) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.card,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.orange,
              radius: 30,
              child: Text(
                auth.name.isNotEmpty ? auth.name[0].toUpperCase() : 'U',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold, fontSize: 24)),
            ),
            const SizedBox(height: 12),
            Text(auth.name,
              style: const TextStyle(
                color: AppColors.text,
                fontWeight: FontWeight.bold, fontSize: 18)),
            Text(auth.email,
              style: const TextStyle(color: AppColors.grey, fontSize: 13)),
            const SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              _StatPill('🔥 ${stats.streak}', 'Streak'),
              const SizedBox(width: 24),
              _StatPill('✅ ${stats.solved}', 'Solved'),
            ]),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                  auth.logout();
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.red,
                  side: const BorderSide(color: AppColors.red),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Logout'),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String icon, value, label;
  const _StatCard(this.icon, this.value, this.label);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(children: [
          Text('$icon $value',
            style: const TextStyle(
              color: AppColors.orange,
              fontWeight: FontWeight.bold, fontSize: 20)),
          const SizedBox(height: 4),
          Text(label,
            style: const TextStyle(color: AppColors.grey, fontSize: 12)),
        ]),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String title, subtitle;
  final Color? color;
  final VoidCallback onTap;
  const _MenuItem({required this.icon, required this.title,
    required this.subtitle, required this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    final c = color ?? AppColors.text;
    return Material(
      color: AppColors.card,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(children: [
            Icon(icon, color: c, size: 22),
            const SizedBox(width: 14),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                  style: TextStyle(
                    color: c, fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 2),
                Text(subtitle,
                  style: const TextStyle(color: AppColors.grey, fontSize: 12)),
              ],
            )),
            const Icon(Icons.chevron_right, color: AppColors.grey, size: 18),
          ]),
        ),
      ),
    );
  }
}

class _StatPill extends StatelessWidget {
  final String value, label;
  const _StatPill(this.value, this.label);
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(value,
        style: const TextStyle(
          color: AppColors.text, fontWeight: FontWeight.bold, fontSize: 18)),
      Text(label, style: const TextStyle(color: AppColors.grey, fontSize: 11)),
    ]);
  }
}
