import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  AuthProvider() {
    _auth.authStateChanges().listen((User? user) {
      _user = user;
      notifyListeners();
    });
  }

  bool get isLoggedIn => _user != null;
  String get name => _user?.displayName ?? (_user?.email?.split('@').first ?? '');
  String get email => _user?.email ?? '';
  String? get uid => _user?.uid;

  Future<bool> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      debugPrint("Login error: $e");
      return false;
    }
  }

  Future<bool> signup(String name, String email, String password) async {
    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
          
      // Update display name
      await cred.user?.updateDisplayName(name);
      
      // Reload user to get the updated name and notify the UI
      await cred.user?.reload();
      _user = _auth.currentUser;
      notifyListeners();
      
      // Initialize an empty user document in Firestore with a timeout
      // This prevents the app from hanging forever if Firestore is not enabled.
      if (cred.user != null) {
        await FirebaseFirestore.instance.collection('users').doc(cred.user!.uid).set({
          'name': name,
          'email': email,
          'streak': 0,
          'solved': 0,
          'createdAt': FieldValue.serverTimestamp(),
        }).timeout(const Duration(seconds: 5));
      }
      return true;
    } catch (e) {
      debugPrint("Signup error: $e");
      return false;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
