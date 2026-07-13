import 'package:flutter/material.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RadioListTile Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<String> _options = [
    'Paris',
    'London',
    'Rome',
    'Berlin',
  ];
  final String _correctAnswer = 'Paris';

  // ATTRIBUTE 1 (part of it): groupValue — the single source of truth
  // shared by every RadioListTile in this group.
  String? _selectedAnswer;

  String? _feedback;

  // ATTRIBUTE 2: activeColor — color of the selected radio button.
  Color _activeColor = Colors.deepPurple;

  // ATTRIBUTE 3: controlAffinity — position of the radio circle.
  ListTileControlAffinity _affinity = ListTileControlAffinity.leading;

  void _submit() {
    if (_selectedAnswer == null) return;
    setState(() {
      _feedback = _selectedAnswer == _correctAnswer
          ? '✅ Correct!'
          : '❌ Not quite — try again!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trivia Quiz')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'What is the capital of France?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // One RadioListTile per answer option — all sharing groupValue.
            ..._options.map((option) {
              return RadioListTile<String>(
                // ATTRIBUTE 1: value — this tile's own value.
                value: option,
                // ATTRIBUTE 1 (cont.): groupValue — shared across the group.
                groupValue: _selectedAnswer,
                onChanged: (value) {
                  setState(() {
                    _selectedAnswer = value;
                    _feedback = null;
                  });
                },
                title: Text(option),
                activeColor: _activeColor,
                controlAffinity: _affinity,
              );
            }),

            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _selectedAnswer == null ? null : _submit,
              child: const Text('Submit'),
            ),

            if (_feedback != null) ...[
              const SizedBox(height: 12),
              Text(
                _feedback!,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],

            const Divider(height: 40),
            const Text(
              'Try changing these:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                const Text('Active color:'),
                const SizedBox(width: 12),
                _colorDot(Colors.deepPurple),
                _colorDot(Colors.green),
                _colorDot(Colors.orange),
              ],
            ),
            SwitchListTile(
              title: const Text('Radio on the right (trailing)'),
              value: _affinity == ListTileControlAffinity.trailing,
              onChanged: (value) {
                setState(() {
                  _affinity = value
                      ? ListTileControlAffinity.trailing
                      : ListTileControlAffinity.leading;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _colorDot(Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: GestureDetector(
        onTap: () => setState(() => _activeColor = color),
        child: CircleAvatar(
          radius: 14,
          backgroundColor: color,
          child: _activeColor == color
              ? const Icon(Icons.check, size: 16, color: Colors.white)
              : null,
        ),
      ),
    );
  }
}