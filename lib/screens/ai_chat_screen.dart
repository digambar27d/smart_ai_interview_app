import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../theme/app_theme.dart';

class AiChatScreen extends StatefulWidget {
  const AiChatScreen({super.key});
  @override
  State<AiChatScreen> createState() => _AiChatScreenState();
}

class _AiChatScreenState extends State<AiChatScreen> {
  // 🔑 Apni Gemini API key yahan daalo
  static const _apiKey = 'AIzaSyCrRQWUdZJ0JwRjh6GV8AEUcunsfxEMEpw';

  final List<Map<String, String>> _messages = [];
  final List<Map<String, dynamic>> _history = [];
  final _ctrl = TextEditingController();
  final _scroll = ScrollController();
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _messages.add({
      'role': 'bot',
      'text':
          'Namaste! 👋 Main InterviewAI hoon.\n\nKoi bhi question pucho:\n• DSA & Algorithms\n• System Design\n• DBMS, OS, Networks, OOPs\n• ECE / ME / Civil / EEE\n• HR & Interview Tips\n\nMain help karunga! 🎯',
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    _scroll.dispose();
    super.dispose();
  }

  Future<void> _send() async {
    final text = _ctrl.text.trim();
    if (text.isEmpty || _loading) return;
    _ctrl.clear();
    setState(() {
      _messages.add({'role': 'user', 'text': text});
      _loading = true;
    });
    _scrollDown();
    final reply = await _getReply(text);
    if (!mounted) return;
    setState(() {
      _messages.add({'role': 'bot', 'text': reply});
      _loading = false;
    });
    _scrollDown();
  }

  Future<String> _getReply(String question) async {
    // Check if API key is set
    if (_apiKey == 'YOUR_GEMINI_API_KEY' || _apiKey.isEmpty) {
      return '⚠️ API key nahi daali!\n\nai_chat_screen.dart mein line 15 pe apni Gemini key daalo:\nstatic const _apiKey = \'AIzaSy...\';\n\nKey lene ke liye: aistudio.google.com';
    }

    try {
      _history.add({
        'role': 'user',
        'parts': [
          {'text': question},
        ],
      });

      // Use gemini-2.5-flash model
      var url =
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=$_apiKey';

      var resp = await http
          .post(
            Uri.parse(url),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({'contents': _history}),
          )
          .timeout(const Duration(seconds: 20));

      if (resp.statusCode == 200) {
        final data = jsonDecode(resp.body);
        final reply =
            data['candidates'][0]['content']['parts'][0]['text'] as String;
        _history.add({
          'role': 'model',
          'parts': [
            {'text': reply},
          ],
        });
        return reply.trim();
      }

      // Handle specific errors
      _history.removeLast();
      final errorData = jsonDecode(resp.body);
      final errorMsg = errorData['error']?['message'] ?? 'Unknown error';

      if (resp.statusCode == 400)
        return '❌ Bad request: $errorMsg\n\nFallback answer:\n${_fallback(question)}';
      if (resp.statusCode == 401 || resp.statusCode == 403)
        return '❌ API key galat hai ya expire ho gayi!\nStatus: ${resp.statusCode}\nError: $errorMsg\n\nNew key banao: aistudio.google.com';
      if (resp.statusCode == 429)
        return '⏳ Rate limit! 1 minute wait karo phir try karo.\n\nOffline answer:\n${_fallback(question)}';

      return 'Error ${resp.statusCode}: $errorMsg\n\n${_fallback(question)}';
    } catch (e) {
      if (_history.isNotEmpty) _history.removeLast();
      if (e.toString().contains('TimeoutException')) {
        return '⏰ Timeout! Internet slow hai.\n\nOffline answer:\n${_fallback(question)}';
      }
      return 'Connection error: $e\n\nOffline answer:\n${_fallback(question)}';
    }
  }

  String _fallback(String q) {
    final ql = q.toLowerCase();
    if (ql.contains('array') || ql.contains('string'))
      return '• Access O(1), Search O(n)\n• Two pointer: pair sum\n• Sliding window: substrings\n• Kadane\'s: max subarray\n• Famous: Two Sum, Valid Anagram';
    if (ql.contains('tree') || ql.contains('bst'))
      return '• BST: left<root<right\n• Inorder = sorted output\n• BFS: queue, DFS: recursion\n• Famous: Max Depth, LCA';
    if (ql.contains('dp') || ql.contains('dynamic'))
      return '• Memoization (top-down)\n• Tabulation (bottom-up)\n• Classic: Knapsack, LCS, Coin Change';
    if (ql.contains('dbms') || ql.contains('sql'))
      return '• ACID properties\n• Normalization: 1NF→3NF\n• Joins: INNER/LEFT/RIGHT\n• Index: B+ Tree';
    if (ql.contains('os') || ql.contains('deadlock'))
      return '• Process vs Thread\n• Deadlock 4 conditions\n• Scheduling: FCFS, SJF, RR';
    if (ql.contains('oops') || ql.contains('oop'))
      return '• Encapsulation, Inheritance\n• Polymorphism, Abstraction\n• Interface vs Abstract class';
    if (ql.contains('hr') || ql.contains('yourself'))
      return '• Tell me about yourself: 2 min\n• STAR method for behavioral\n• Research company before interview!';
    return 'Internet se connect hone pe full answer milega!\nTopics: Arrays, Trees, DP, DBMS, OS, OOPs, HR Tips';
  }

  void _scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scroll.hasClients) {
        _scroll.animateTo(
          _scroll.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: Row(
          children: const [
            Text('🎯', style: TextStyle(fontSize: 20)),
            SizedBox(width: 8),
            Text(
              'InterviewAI',
              style: TextStyle(
                color: AppColors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // API key warning banner
          if (_apiKey == 'YOUR_GEMINI_API_KEY')
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              color: AppColors.red.withOpacity(0.15),
              child: const Text(
                '⚠️ API key nahi daali — offline mode',
                style: TextStyle(color: AppColors.red, fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),

          Expanded(
            child: ListView.builder(
              controller: _scroll,
              padding: const EdgeInsets.all(12),
              itemCount: _messages.length + (_loading ? 1 : 0),
              itemBuilder: (ctx, i) {
                if (i == _messages.length) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        Text('🤖', style: TextStyle(fontSize: 18)),
                        SizedBox(width: 8),
                        Text(
                          'Thinking...',
                          style: TextStyle(color: AppColors.grey, fontSize: 13),
                        ),
                      ],
                    ),
                  );
                }
                final msg = _messages[i];
                final isUser = msg['role'] == 'user';
                return Align(
                  alignment: isUser
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 8,
                      left: isUser ? 60 : 0,
                      right: isUser ? 0 : 60,
                    ),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isUser ? AppColors.orange : AppColors.card,
                      borderRadius: BorderRadius.circular(8),
                      border: isUser
                          ? null
                          : Border.all(color: AppColors.border),
                    ),
                    child: Text(
                      msg['text']!,
                      style: TextStyle(
                        color: isUser ? Colors.black : AppColors.text,
                        fontSize: 13,
                        height: 1.5,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Row(
              children: [
                for (final chip in [
                  'Arrays',
                  'Trees',
                  'DP',
                  'DBMS',
                  'OS',
                  'OOPs',
                  'HR Tips',
                ])
                  GestureDetector(
                    onTap: () {
                      _ctrl.text = chip;
                      _send();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.card,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Text(
                        chip,
                        style: const TextStyle(
                          color: AppColors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 16),
            color: AppColors.card,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _ctrl,
                    style: const TextStyle(color: AppColors.text),
                    decoration: InputDecoration(
                      hintText: 'Ask anything...',
                      hintStyle: const TextStyle(color: AppColors.grey),
                      filled: true,
                      fillColor: AppColors.surface,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: const BorderSide(color: AppColors.border),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: const BorderSide(color: AppColors.border),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: const BorderSide(color: AppColors.orange),
                      ),
                    ),
                    onSubmitted: (_) => _send(),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: _send,
                  child: Container(
                    width: 42,
                    height: 42,
                    decoration: const BoxDecoration(
                      color: AppColors.orange,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.send,
                      color: Colors.black,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
