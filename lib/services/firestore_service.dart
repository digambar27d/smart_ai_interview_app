import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Save user stats
  Future<void> saveUserStats(String uid, int streak, int solved) async {
    await _db.collection('users').doc(uid).set({
      'streak': streak,
      'solved': solved,
    }, SetOptions(merge: true));
  }

  // Get user stats
  Future<Map<String, dynamic>?> getUserStats(String uid) async {
    final doc = await _db.collection('users').doc(uid).get();
    return doc.data();
  }

  // Save a chat message for AI Chat history
  Future<void> saveChatMessage(String uid, String role, String text) async {
    await _db.collection('users').doc(uid).collection('chats').add({
      'role': role,
      'text': text,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}
