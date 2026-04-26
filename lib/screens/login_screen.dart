import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../theme/app_theme.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailCtrl = TextEditingController();
  final passCtrl  = TextEditingController();
  bool loading    = false;
  bool showPass   = false;

  @override
  void dispose() {
    emailCtrl.dispose();
    passCtrl.dispose();
    super.dispose();
  }

  void login() async {
    if (emailCtrl.text.isEmpty || passCtrl.text.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields correctly')));
      return;
    }
    setState(() => loading = true);
    final ok = await context.read<AuthProvider>().login(
      emailCtrl.text.trim(), passCtrl.text);
    setState(() => loading = false);
    if (!ok && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login failed. Try again.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              // Logo
              Row(children: const [
                Text('🎯', style: TextStyle(fontSize: 32)),
                SizedBox(width: 12),
                Text('InterviewAI',
                  style: TextStyle(
                    color: AppColors.orange,
                    fontSize: 24, fontWeight: FontWeight.bold)),
              ]),

              const SizedBox(height: 48),
              const Text('Sign In',
                style: TextStyle(
                  color: AppColors.text,
                  fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('Welcome back!',
                style: TextStyle(color: AppColors.grey, fontSize: 14)),

              const SizedBox(height: 32),

              // Email
              const Text('Email',
                style: TextStyle(color: AppColors.grey, fontSize: 13)),
              const SizedBox(height: 6),
              TextField(
                controller: emailCtrl,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: AppColors.text),
                decoration: InputDecoration(
                  hintText: 'your@email.com',
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

              const SizedBox(height: 16),

              // Password
              const Text('Password',
                style: TextStyle(color: AppColors.grey, fontSize: 13)),
              const SizedBox(height: 6),
              TextField(
                controller: passCtrl,
                obscureText: !showPass,
                style: const TextStyle(color: AppColors.text),
                decoration: InputDecoration(
                  hintText: 'Min 6 characters',
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
                  suffixIcon: IconButton(
                    icon: Icon(
                      showPass ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.grey),
                    onPressed: () => setState(() => showPass = !showPass),
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // Login button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: loading ? null : login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.orange,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  ),
                  child: loading
                    ? const SizedBox(width: 20, height: 20,
                        child: CircularProgressIndicator(
                          color: Colors.black, strokeWidth: 2))
                    : const Text('Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                ),
              ),

              const SizedBox(height: 20),

              // Sign up link
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text("Don't have an account? ",
                  style: TextStyle(color: AppColors.grey)),
                GestureDetector(
                  onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const SignupScreen())),
                  child: const Text('Sign Up',
                    style: TextStyle(
                      color: AppColors.orange,
                      fontWeight: FontWeight.bold)),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
