import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/interview_data.dart';
import '../providers/stats_provider.dart';
import '../theme/app_theme.dart';

class HRScreen extends StatefulWidget {
  const HRScreen({super.key});
  @override
  State<HRScreen> createState() => _HRScreenState();
}

class _HRScreenState extends State<HRScreen> {
  final Set<int> expanded = {};

  @override
  Widget build(BuildContext context) {
    final questions = InterviewData.hrQuestions;

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
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: questions.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (ctx, i) {
          final q      = questions[i];
          final isOpen = expanded.contains(i);

          return GestureDetector(
            onTap: () {
              setState(() {
                if (isOpen) {
                  expanded.remove(i);
                } else {
                  expanded.add(i);
                  context.read<StatsProvider>().addSolved();
                }
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isOpen ? AppColors.orange : AppColors.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Question header
                  Padding(
                    padding: const EdgeInsets.all(14),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 24, height: 24,
                          decoration: BoxDecoration(
                            color: isOpen
                              ? AppColors.orange
                              : AppColors.border,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Center(
                            child: Text('${i+1}',
                              style: TextStyle(
                                color: isOpen ? Colors.black : AppColors.grey,
                                fontSize: 11, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(q['q'] ?? '',
                            style: TextStyle(
                              color: isOpen ? AppColors.orange : AppColors.text,
                              fontWeight: FontWeight.w600, fontSize: 14)),
                        ),
                        Icon(
                          isOpen
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                          color: AppColors.grey, size: 20),
                      ],
                    ),
                  ),

                  // Answer (only when open)
                  if (isOpen) ...[
                    const Divider(color: AppColors.border, height: 1),

                    // Answer section
                    Padding(
                      padding: const EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Answer',
                            style: TextStyle(
                              color: AppColors.green,
                              fontWeight: FontWeight.bold, fontSize: 12)),
                          const SizedBox(height: 8),
                          Text(q['a'] ?? '',
                            style: const TextStyle(
                              color: AppColors.text,
                              fontSize: 13, height: 1.6)),

                          if ((q['tip'] ?? '').isNotEmpty) ...[
                            const SizedBox(height: 14),
                            const Text('💡 Tip',
                              style: TextStyle(
                                color: AppColors.orange,
                                fontWeight: FontWeight.bold, fontSize: 12)),
                            const SizedBox(height: 8),
                            Text(q['tip'] ?? '',
                              style: const TextStyle(
                                color: AppColors.grey,
                                fontSize: 13, height: 1.6)),
                          ],
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// Daily Practice (kept simple)
class DailyPracticeScreen extends StatefulWidget {
  const DailyPracticeScreen({super.key});
  @override
  State<DailyPracticeScreen> createState() => _DailyPracticeScreenState();
}

class _DailyPracticeScreenState extends State<DailyPracticeScreen> {
  final tasks = [
    {'title': 'Solve 2 DSA Problems', 'done': false},
    {'title': 'Read System Design', 'done': false},
    {'title': 'Practice HR Answers', 'done': false},
    {'title': 'Revise DBMS', 'done': false},
    {'title': 'Mock Interview Practice', 'done': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(title: const Text('Daily Practice')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: tasks.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (ctx, i) {
          final done = tasks[i]['done'] as bool;
          return CheckboxListTile(
            tileColor: AppColors.card,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(color: AppColors.border)),
            activeColor: AppColors.green,
            checkColor: Colors.black,
            title: Text(tasks[i]['title'] as String,
              style: TextStyle(
                color: done ? AppColors.grey : AppColors.text,
                fontWeight: FontWeight.w600,
                decoration: done ? TextDecoration.lineThrough : null)),
            value: done,
            onChanged: (_) {
              setState(() => tasks[i]['done'] = !done);
              if (!done) context.read<StatsProvider>().addStreak();
            },
          );
        },
      ),
    );
  }
}
