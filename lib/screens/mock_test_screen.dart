import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class MockTestScreen extends StatefulWidget {
  const MockTestScreen({super.key});
  @override
  State<MockTestScreen> createState() => _MockTestScreenState();
}

class _MockTestScreenState extends State<MockTestScreen> {
  int _current  = 0;
  int _score    = 0;
  bool _done    = false;
  int? _selected;
  bool _answered = false;

  // All MCQ questions from various topics
  final List<Map<String, dynamic>> _questions = [
    // DSA
    {
      'q': 'What is the time complexity of accessing an element in an array by index?',
      'options': ['O(n)', 'O(log n)', 'O(1)', 'O(n²)'],
      'answer': 2,
      'explanation': 'Array mein index se direct access hota hai — O(1) constant time.',
    },
    {
      'q': 'Which data structure uses LIFO (Last In First Out) principle?',
      'options': ['Queue', 'Stack', 'Array', 'Linked List'],
      'answer': 1,
      'explanation': 'Stack LIFO follow karta hai — last mein daala gaya element pehle niklega.',
    },
    {
      'q': 'What is the worst case time complexity of Quick Sort?',
      'options': ['O(n log n)', 'O(n)', 'O(n²)', 'O(log n)'],
      'answer': 2,
      'explanation': 'Quick Sort ka worst case O(n²) hota hai jab pivot always smallest/largest element ho.',
    },
    {
      'q': 'In a Binary Search Tree, where is the smallest element?',
      'options': ['Root', 'Rightmost node', 'Leftmost node', 'Middle node'],
      'answer': 2,
      'explanation': 'BST mein leftmost node (left subtree ka deepest node) sabse chota element hota hai.',
    },
    {
      'q': 'Which traversal of BST gives elements in sorted order?',
      'options': ['Preorder', 'Postorder', 'Inorder', 'Level order'],
      'answer': 2,
      'explanation': 'Inorder traversal (Left→Root→Right) BST ke elements sorted order mein deta hai.',
    },
    {
      'q': 'What does BFS use to traverse a graph?',
      'options': ['Stack', 'Queue', 'Array', 'Heap'],
      'answer': 1,
      'explanation': 'BFS Queue use karta hai — level by level traverse karta hai.',
    },
    {
      'q': 'What is the space complexity of Merge Sort?',
      'options': ['O(1)', 'O(log n)', 'O(n)', 'O(n²)'],
      'answer': 2,
      'explanation': 'Merge Sort O(n) extra space use karta hai merging ke liye.',
    },
    // DBMS
    {
      'q': 'Which of the following is NOT an ACID property?',
      'options': ['Atomicity', 'Consistency', 'Independence', 'Durability'],
      'answer': 2,
      'explanation': 'ACID = Atomicity, Consistency, Isolation, Durability. Independence ACID property nahi hai.',
    },
    {
      'q': 'Which SQL clause is used to filter groups?',
      'options': ['WHERE', 'HAVING', 'GROUP BY', 'ORDER BY'],
      'answer': 1,
      'explanation': 'HAVING clause GROUP BY ke baad groups ko filter karta hai. WHERE rows filter karta hai.',
    },
    {
      'q': 'What is a Primary Key?',
      'options': [
        'A key that can have NULL values',
        'A key that uniquely identifies each row',
        'A key that references another table',
        'A key used for sorting'
      ],
      'answer': 1,
      'explanation': 'Primary Key har row ko uniquely identify karta hai aur NULL nahi ho sakta.',
    },
    // OS
    {
      'q': 'What is a Deadlock?',
      'options': [
        'When CPU is idle',
        'When two processes wait for each other indefinitely',
        'When memory is full',
        'When a process is terminated'
      ],
      'answer': 1,
      'explanation': 'Deadlock tab hota hai jab do ya zyada processes ek dusre ke resources ka wait karte hain.',
    },
    {
      'q': 'Which scheduling algorithm gives minimum average waiting time?',
      'options': ['FCFS', 'Round Robin', 'SJF', 'Priority'],
      'answer': 2,
      'explanation': 'SJF (Shortest Job First) minimum average waiting time deta hai.',
    },
    {
      'q': 'What is the difference between process and thread?',
      'options': [
        'No difference',
        'Process is faster than thread',
        'Thread shares memory with other threads of same process',
        'Thread has its own memory space'
      ],
      'answer': 2,
      'explanation': 'Thread same process ke dusre threads ke saath memory share karta hai. Process ka apna memory space hota hai.',
    },
    // Networks
    {
      'q': 'How many layers are in OSI model?',
      'options': ['4', '5', '6', '7'],
      'answer': 3,
      'explanation': 'OSI model mein 7 layers hoti hain: Physical, Data Link, Network, Transport, Session, Presentation, Application.',
    },
    {
      'q': 'Which protocol is used for sending emails?',
      'options': ['HTTP', 'FTP', 'SMTP', 'DNS'],
      'answer': 2,
      'explanation': 'SMTP (Simple Mail Transfer Protocol) email bhejne ke liye use hota hai.',
    },
    // OOPs
    {
      'q': 'Which OOP concept allows a class to inherit properties from multiple classes?',
      'options': ['Encapsulation', 'Multiple Inheritance', 'Polymorphism', 'Abstraction'],
      'answer': 1,
      'explanation': 'Multiple Inheritance se ek class multiple parent classes se properties inherit kar sakti hai.',
    },
    {
      'q': 'What is method overloading?',
      'options': [
        'Same method name, same parameters',
        'Same method name, different parameters',
        'Different method name, same parameters',
        'Overriding parent method'
      ],
      'answer': 1,
      'explanation': 'Method Overloading = same name, different parameters. Compile time pe resolve hota hai.',
    },
    {
      'q': 'Which keyword is used to prevent a class from being inherited in Java?',
      'options': ['static', 'abstract', 'final', 'private'],
      'answer': 2,
      'explanation': 'final keyword se class ko inherit nahi kiya ja sakta.',
    },
    // ECE
    {
      'q': 'Which gate is called Universal Gate?',
      'options': ['AND', 'OR', 'NAND', 'XOR'],
      'answer': 2,
      'explanation': 'NAND gate universal gate hai — isse koi bhi other gate bana sakte hain.',
    },
    {
      'q': 'What is the output of XOR gate when both inputs are same?',
      'options': ['1', '0', 'Undefined', 'Depends on input'],
      'answer': 1,
      'explanation': 'XOR gate: same inputs (00 or 11) → output 0. Different inputs → output 1.',
    },
    // HR
    {
      'q': 'What is the STAR method used for in interviews?',
      'options': [
        'Technical problem solving',
        'Answering behavioral questions',
        'Salary negotiation',
        'Code review'
      ],
      'answer': 1,
      'explanation': 'STAR = Situation, Task, Action, Result. HR behavioral questions ke answers ke liye use hota hai.',
    },
    {
      'q': 'What should you do at the end of an interview?',
      'options': [
        'Leave immediately',
        'Ask about salary only',
        'Ask thoughtful questions about the role',
        'Tell them you need time to decide'
      ],
      'answer': 2,
      'explanation': 'Interview ke end mein thoughtful questions poochho — role, team, growth ke baare mein. Curiosity dikhata hai.',
    },
    // ME
    {
      'q': 'What is the efficiency of Carnot engine?',
      'options': ['η = W/Q1', 'η = 1 - T2/T1', 'η = Q2/Q1', 'η = T1/T2'],
      'answer': 1,
      'explanation': 'Carnot efficiency η = 1 - T_cold/T_hot. Yeh maximum possible efficiency hai.',
    },
    // Civil
    {
      'q': 'What is the maximum bending moment in a simply supported beam with UDL?',
      'options': ['wL²/4', 'wL²/8', 'wL²/12', 'wL²/2'],
      'answer': 1,
      'explanation': 'Simply supported beam with UDL: Max BM = wL²/8 at center.',
    },
    // System Design
    {
      'q': 'What is the purpose of a Load Balancer?',
      'options': [
        'To store data',
        'To distribute incoming traffic across servers',
        'To encrypt data',
        'To compress files'
      ],
      'answer': 1,
      'explanation': 'Load Balancer incoming requests ko multiple servers mein distribute karta hai — high availability ke liye.',
    },
  ];

  void _selectAnswer(int index) {
    if (_answered) return;
    setState(() {
      _selected  = index;
      _answered  = true;
      if (index == _questions[_current]['answer']) _score++;
    });
  }

  void _next() {
    if (_current >= _questions.length - 1) {
      setState(() => _done = true);
    } else {
      setState(() {
        _current++;
        _selected  = null;
        _answered  = false;
      });
    }
  }

  void _restart() {
    setState(() {
      _current   = 0;
      _score     = 0;
      _done      = false;
      _selected  = null;
      _answered  = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_done) return _buildResult();
    return _buildQuestion();
  }

  Widget _buildQuestion() {
    final q          = _questions[_current];
    final options    = q['options'] as List;
    final correct    = q['answer'] as int;
    final explanation = q['explanation'] as String;

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: Row(children: const [
          Text('🎯', style: TextStyle(fontSize: 20)),
          SizedBox(width: 8),
          Text('Mock Test',
            style: TextStyle(color: AppColors.orange,
              fontWeight: FontWeight.bold, fontSize: 18)),
        ]),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: Center(child: Text(
              '${_current + 1}/${_questions.length}',
              style: const TextStyle(
                color: AppColors.orange, fontWeight: FontWeight.bold))),
          ),
        ],
      ),
      body: Column(children: [
        // Progress bar
        LinearProgressIndicator(
          value: (_current + 1) / _questions.length,
          backgroundColor: AppColors.border,
          color: AppColors.orange, minHeight: 3),

        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Score
                Row(children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.green.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.green.withOpacity(0.3))),
                    child: Text('Score: $_score',
                      style: const TextStyle(
                        color: AppColors.green,
                        fontWeight: FontWeight.bold, fontSize: 13)),
                  ),
                ]),

                const SizedBox(height: 16),

                // Question
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.card,
                    borderRadius: BorderRadius.circular(8),
                    border: const Border(
                      left: BorderSide(color: AppColors.orange, width: 3))),
                  child: Text(q['q'] as String,
                    style: const TextStyle(
                      color: AppColors.text,
                      fontSize: 15, fontWeight: FontWeight.w600, height: 1.5)),
                ),

                const SizedBox(height: 16),

                // Options
                ...List.generate(options.length, (i) {
                  Color bgColor    = AppColors.card;
                  Color borderColor = AppColors.border;
                  Color textColor  = AppColors.text;
                  IconData? icon;

                  if (_answered) {
                    if (i == correct) {
                      bgColor     = AppColors.green.withOpacity(0.15);
                      borderColor = AppColors.green;
                      textColor   = AppColors.green;
                      icon        = Icons.check_circle;
                    } else if (i == _selected && _selected != correct) {
                      bgColor     = AppColors.red.withOpacity(0.15);
                      borderColor = AppColors.red;
                      textColor   = AppColors.red;
                      icon        = Icons.cancel;
                    }
                  } else if (_selected == i) {
                    bgColor     = AppColors.orange.withOpacity(0.15);
                    borderColor = AppColors.orange;
                  }

                  return GestureDetector(
                    onTap: () => _selectAnswer(i),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: borderColor)),
                      child: Row(children: [
                        Container(
                          width: 28, height: 28,
                          decoration: BoxDecoration(
                            color: borderColor.withOpacity(0.2),
                            shape: BoxShape.circle),
                          child: Center(
                            child: Text(
                              String.fromCharCode(65 + i), // A, B, C, D
                              style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.bold, fontSize: 13))),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(options[i] as String,
                            style: TextStyle(
                              color: textColor,
                              fontSize: 14, fontWeight: FontWeight.w500)),
                        ),
                        if (icon != null)
                          Icon(icon, color: textColor, size: 20),
                      ]),
                    ),
                  );
                }),

                // Explanation
                if (_answered) ...[
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.orange.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppColors.orange.withOpacity(0.3))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('💡 ', style: TextStyle(fontSize: 16)),
                        Expanded(
                          child: Text(explanation,
                            style: const TextStyle(
                              color: AppColors.text,
                              fontSize: 13, height: 1.5)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity, height: 46,
                    child: ElevatedButton(
                      onPressed: _next,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.orange,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                      child: Text(
                        _current >= _questions.length - 1
                          ? 'View Results' : 'Next Question →',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Widget _buildResult() {
    final pct = (_score / _questions.length * 100).round();
    final grade = pct >= 80 ? '🎉 Excellent!' :
                  pct >= 60 ? '👍 Good!' :
                  pct >= 40 ? '📚 Keep Studying!' : '💪 Try Again!';

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: Row(children: const [
          Text('🎯', style: TextStyle(fontSize: 20)),
          SizedBox(width: 8),
          Text('Test Result',
            style: TextStyle(color: AppColors.orange,
              fontWeight: FontWeight.bold, fontSize: 18)),
        ]),
        automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(children: [

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.border)),
            child: Column(children: [
              Text('$pct%',
                style: TextStyle(
                  color: pct >= 60 ? AppColors.green : AppColors.orange,
                  fontWeight: FontWeight.bold, fontSize: 56)),
              const SizedBox(height: 8),
              Text('$_score / ${_questions.length} Correct',
                style: const TextStyle(color: AppColors.grey, fontSize: 16)),
              const SizedBox(height: 12),
              Text(grade,
                style: const TextStyle(
                  color: AppColors.text,
                  fontSize: 18, fontWeight: FontWeight.bold)),
            ]),
          ),

          const SizedBox(height: 24),

          // Stats
          Row(children: [
            _ResultCard('✅', '$_score', 'Correct', AppColors.green),
            const SizedBox(width: 12),
            _ResultCard('❌', '${_questions.length - _score}', 'Wrong', AppColors.red),
            const SizedBox(width: 12),
            _ResultCard('📊', '$pct%', 'Score', AppColors.orange),
          ]),

          const SizedBox(height: 24),

          // Retry button
          SizedBox(
            width: double.infinity, height: 48,
            child: ElevatedButton(
              onPressed: _restart,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.orange,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
              child: const Text('Try Again 🔄',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity, height: 48,
            child: OutlinedButton(
              onPressed: () => Navigator.pop(context),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.text,
                side: const BorderSide(color: AppColors.border),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
              child: const Text('Back to Home',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ),
        ]),
      ),
    );
  }
}

class _ResultCard extends StatelessWidget {
  final String icon, value, label;
  final Color color;
  const _ResultCard(this.icon, this.value, this.label, this.color);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withOpacity(0.3))),
        child: Column(children: [
          Text(icon, style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 4),
          Text(value,
            style: TextStyle(color: color,
              fontWeight: FontWeight.bold, fontSize: 18)),
          Text(label,
            style: const TextStyle(color: AppColors.grey, fontSize: 11)),
        ]),
      ),
    );
  }
}
