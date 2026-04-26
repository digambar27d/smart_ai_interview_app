import 'package:flutter/material.dart';
import '../data/interview_data.dart';
import '../theme/app_theme.dart';
import 'topic_interview_screen.dart';

// Screen 1 - Branch Select
class BranchScreen extends StatelessWidget {
  const BranchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(title: Row(children: const [
          Text('🎯', style: TextStyle(fontSize: 20)),
          SizedBox(width: 8),
          Text('InterviewAI',
            style: TextStyle(
              color: AppColors.orange,
              fontWeight: FontWeight.bold, fontSize: 18)),
        ])),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.3,
        ),
        itemCount: InterviewData.branches.length,
        itemBuilder: (ctx, i) {
          final b = InterviewData.branches[i];
          return GestureDetector(
            onTap: () => Navigator.push(ctx,
              MaterialPageRoute(builder: (_) => SubjectScreen(branch: b))),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(b['icon']!, style: const TextStyle(fontSize: 30)),
                  const SizedBox(height: 8),
                  Text(b['name']!,
                    style: const TextStyle(
                      color: AppColors.orange,
                      fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 2),
                  Text(b['full']!,
                    style: const TextStyle(color: AppColors.grey, fontSize: 9),
                    textAlign: TextAlign.center),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// Screen 2 - Subject Select
class SubjectScreen extends StatelessWidget {
  final Map<String, String> branch;
  const SubjectScreen({super.key, required this.branch});

  @override
  Widget build(BuildContext context) {
    final subjects = InterviewData.subjects[branch['name']] ?? [];
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(title: Text(branch['name']!)),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: subjects.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (ctx, i) {
          final s = subjects[i];
          return ListTile(
            tileColor: AppColors.card,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(color: AppColors.border)),
            leading: Text(s['icon']!, style: const TextStyle(fontSize: 22)),
            title: Text(s['name']!,
              style: const TextStyle(
                color: AppColors.text, fontWeight: FontWeight.w600)),
            trailing: const Icon(Icons.chevron_right, color: AppColors.grey),
            onTap: () => Navigator.push(ctx,
              MaterialPageRoute(builder: (_) => TopicScreen(
                branch: branch['name']!,
                subject: s))),
          );
        },
      ),
    );
  }
}

// Screen 3 - Topic Select
class TopicScreen extends StatelessWidget {
  final String branch;
  final Map<String, String> subject;
  const TopicScreen({super.key, required this.branch, required this.subject});

  @override
  Widget build(BuildContext context) {
    final topics = InterviewData.topics[subject['name']] ?? [];
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(title: Text(subject['name']!)),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: topics.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (ctx, i) {
          return ListTile(
            tileColor: AppColors.card,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(color: AppColors.border)),
            leading: CircleAvatar(
              backgroundColor: AppColors.border,
              radius: 14,
              child: Text('${i+1}',
                style: const TextStyle(
                  color: AppColors.grey, fontSize: 12,
                  fontWeight: FontWeight.bold)),
            ),
            title: Text(topics[i],
              style: const TextStyle(
                color: AppColors.text, fontWeight: FontWeight.w600)),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.orange.withOpacity(0.15),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text('Start',
                style: TextStyle(
                  color: AppColors.orange,
                  fontWeight: FontWeight.bold, fontSize: 11)),
            ),
            onTap: () => Navigator.push(ctx,
              MaterialPageRoute(builder: (_) => TopicInterviewScreen(
                branch: branch,
                subject: subject['name']!,
                topic: topics[i]))),
          );
        },
      ),
    );
  }
}
