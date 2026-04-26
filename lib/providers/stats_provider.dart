import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/firestore_service.dart';

class StatsProvider extends ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();
  String? _uid;

  int streak = 0;
  int solved = 0;

  StatsProvider() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        _uid = user.uid;
        _loadStats();
      } else {
        _uid = null;
        streak = 0;
        solved = 0;
        notifyListeners();
      }
    });
  }

  void _loadStats() async {
    if (_uid == null) return;
    final data = await _firestoreService.getUserStats(_uid!);
    if (data != null) {
      streak = data['streak'] ?? 0;
      solved = data['solved'] ?? 0;
      notifyListeners();
    }
  }

  void addSolved() {
    solved++;
    if (solved % 5 == 0) streak++;
    notifyListeners();
    _saveStats();
  }

  void addStreak() {
    streak++;
    notifyListeners();
    _saveStats();
  }

  void _saveStats() {
    if (_uid != null) {
      _firestoreService.saveUserStats(_uid!, streak, solved);
    }
  }
}
