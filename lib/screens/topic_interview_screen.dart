import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../data/interview_data.dart';
import '../providers/stats_provider.dart';
import '../theme/app_theme.dart';

class TopicInterviewScreen extends StatefulWidget {
  final String branch, subject, topic;
  const TopicInterviewScreen({
    super.key,
    required this.branch,
    required this.subject,
    required this.topic,
  });
  @override
  State<TopicInterviewScreen> createState() => _TopicInterviewScreenState();
}

class _TopicInterviewScreenState extends State<TopicInterviewScreen> {
  // 🔑 Get API key from .env file
  static String get _apiKey => dotenv.env['GEMINI_API_KEY'] ?? '';

  late final List<Map<String, String>> _questions;
  int _index = 0;
  bool _loading = false;
  bool _done = false;
  bool? _correct;
  String? _feedback;
  final _ctrl = TextEditingController();
  final List<Map<String, dynamic>> _history = [];

  @override
  void initState() {
    super.initState();
    _questions = InterviewData.getQuestions(widget.topic);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_ctrl.text.trim().isEmpty) return;
    setState(() => _loading = true);
    final result = await _evaluate(_ctrl.text.trim());
    setState(() {
      _loading = false;
      _feedback = result;
    });
  }

  Future<String> _evaluate(String answer) async {
    try {
      final q = _questions[_index]['q']!;
      final a = _questions[_index]['a']!;

      final prompt =
          'Evaluate this B.Tech student answer.\n'
          'Question: $q\n'
          'Student Answer: $answer\n'
          'Reference: $a\n\n'
          'Reply in EXACTLY this format:\n'
          'CORRECT: true\n'
          'FEEDBACK: (what was good)\n'
          'OR\n'
          'CORRECT: false\n'
          'FEEDBACK: (correct answer briefly)';

      final resp = await http
          .post(
            Uri.parse(
              'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=$_apiKey',
            ),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'contents': [
                {
                  'role': 'user',
                  'parts': [
                    {'text': prompt},
                  ],
                },
              ],
              'generationConfig': {'temperature': 0.3, 'maxOutputTokens': 200},
            }),
          )
          .timeout(const Duration(seconds: 12));

      print('Topic eval status: ${resp.statusCode}');

      if (resp.statusCode == 200) {
        final data = jsonDecode(resp.body);
        final text =
            data['candidates'][0]['content']['parts'][0]['text'] as String;
        final lines = text.trim().split('\n');
        bool isCorrect = false;
        String feedback = '';
        for (final line in lines) {
          if (line.startsWith('CORRECT:')) isCorrect = line.contains('true');
          if (line.startsWith('FEEDBACK:'))
            feedback = line.replaceFirst('FEEDBACK:', '').trim();
        }
        setState(() => _correct = isCorrect);
        return feedback.isNotEmpty
            ? feedback
            : (isCorrect ? 'Good answer! ✅' : a);
      }
      return _localCheck(answer);
    } catch (e) {
      return _localCheck(answer);
    }
  }

  String _localCheck(String answer) {
    final correctAns = _questions[_index]['a']!;
    final words = correctAns
        .toLowerCase()
        .split(' ')
        .where((w) => w.length > 4)
        .take(5)
        .toList();
    final matches = words.where((w) => answer.toLowerCase().contains(w)).length;
    final ok = matches >= 2 || answer.length > 60;
    setState(() => _correct = ok);
    return ok ? 'Good answer! ✅' : 'Correct answer: $correctAns';
  }

  void _next() {
    _history.add({'q': _questions[_index]['q'], 'correct': _correct});
    if (_index >= _questions.length - 1) {
      context.read<StatsProvider>().addSolved();
      setState(() => _done = true);
    } else {
      setState(() {
        _index++;
        _ctrl.clear();
        _correct = null;
        _feedback = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_done) return _buildReport();
    final q = _questions[_index];

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: Row(
          children: const [
            Text('🎯', style: TextStyle(fontSize: 16)),
            SizedBox(width: 6),
            Text(
              'InterviewAI',
              style: TextStyle(
                color: AppColors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: Center(
              child: Text(
                '${_index + 1}/${_questions.length}',
                style: const TextStyle(
                  color: AppColors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: (_index + 1) / _questions.length,
            backgroundColor: AppColors.border,
            color: AppColors.orange,
            minHeight: 3,
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Question
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.card,
                      borderRadius: BorderRadius.circular(8),
                      border: const Border(
                        left: BorderSide(color: AppColors.orange, width: 3),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '🤖 AI Interviewer',
                          style: TextStyle(
                            color: AppColors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          q['q']!,
                          style: const TextStyle(
                            color: AppColors.text,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Answer input
                  if (_feedback == null) ...[
                    const Text(
                      'Your Answer',
                      style: TextStyle(color: AppColors.grey, fontSize: 13),
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      controller: _ctrl,
                      maxLines: 5,
                      style: const TextStyle(color: AppColors.text),
                      decoration: InputDecoration(
                        hintText: 'Type your answer here...',
                        hintStyle: const TextStyle(color: AppColors.grey),
                        filled: true,
                        fillColor: AppColors.card,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: AppColors.border),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: AppColors.border),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: AppColors.orange),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      height: 46,
                      child: ElevatedButton(
                        onPressed: _loading ? null : _submit,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.orange,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: _loading
                            ? const SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(
                                  color: Colors.black,
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text(
                                'Submit',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                      ),
                    ),
                  ],

                  // Feedback
                  if (_feedback != null) ...[
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        margin: const EdgeInsets.only(left: 40, bottom: 12),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.orange,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          _ctrl.text,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: _correct == true
                            ? AppColors.green.withOpacity(0.1)
                            : AppColors.red.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: _correct == true
                              ? AppColors.green
                              : AppColors.red,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _correct == true ? '✅ Correct!' : '❌ Incorrect',
                            style: TextStyle(
                              color: _correct == true
                                  ? AppColors.green
                                  : AppColors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _feedback!,
                            style: const TextStyle(
                              color: AppColors.text,
                              fontSize: 13,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      height: 46,
                      child: ElevatedButton(
                        onPressed: _next,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.orange,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          _index >= _questions.length - 1
                              ? 'View Report'
                              : 'Next Question',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReport() {
    final correct = _history.where((h) => h['correct'] == true).length;
    final total = _history.length;
    final pct = total > 0 ? (correct * 100 / total).round() : 0;

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: const Text('Report'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                children: [
                  Text(
                    '$pct%',
                    style: TextStyle(
                      color: pct >= 70 ? AppColors.green : AppColors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 48,
                    ),
                  ),
                  Text(
                    '$correct / $total correct',
                    style: const TextStyle(color: AppColors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    pct >= 80
                        ? '🎉 Excellent!'
                        : pct >= 60
                        ? '👍 Good job!'
                        : '💪 Keep practicing!',
                    style: const TextStyle(color: AppColors.text, fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ..._history.asMap().entries.map((e) {
              final ok = e.value['correct'] == true;
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: ok ? AppColors.green : AppColors.red,
                  ),
                ),
                child: Row(
                  children: [
                    Text(ok ? '✅' : '❌', style: const TextStyle(fontSize: 16)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Q${e.key + 1}: ${e.value['q']}',
                        style: const TextStyle(
                          color: AppColors.text,
                          fontSize: 13,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            }),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 46,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context)
                  ..pop()
                  ..pop()
                  ..pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.orange,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Back to Home',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
