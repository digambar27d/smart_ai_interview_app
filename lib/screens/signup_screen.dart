import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../theme/app_theme.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nameCtrl  = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl  = TextEditingController();
  bool loading    = false;
  bool showPass   = false;

  @override
  void dispose() {
    nameCtrl.dispose(); emailCtrl.dispose(); passCtrl.dispose();
    super.dispose();
  }

  void signup() async {
    if (nameCtrl.text.isEmpty || emailCtrl.text.isEmpty || passCtrl.text.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields correctly')));
      return;
    }
    setState(() => loading = true);
    final ok = await context.read<AuthProvider>().signup(
      nameCtrl.text.trim(), emailCtrl.text.trim(), passCtrl.text);
    
    if (!mounted) return;
    setState(() => loading = false);
    
    if (ok) {
      // Signup successful, AuthWrapper will now show HomeScreen.
      // We just need to remove this SignupScreen from the top.
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Signup failed. Check Firestore database is created.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: const Text('Create Account'),
        backgroundColor: AppColors.surface,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Sign Up',
                style: TextStyle(
                  color: AppColors.text,
                  fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('Create your account',
                style: TextStyle(color: AppColors.grey, fontSize: 14)),
              const SizedBox(height: 32),

              _label('Name'),
              _field(nameCtrl, 'Your name', false),
              const SizedBox(height: 16),

              _label('Email'),
              _field(emailCtrl, 'your@email.com', false,
                type: TextInputType.emailAddress),
              const SizedBox(height: 16),

              _label('Password'),
              TextField(
                controller: passCtrl,
                obscureText: !showPass,
                style: const TextStyle(color: AppColors.text),
                decoration: _deco('Min 6 characters').copyWith(
                  suffixIcon: IconButton(
                    icon: Icon(
                      showPass ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.grey),
                    onPressed: () => setState(() => showPass = !showPass),
                  ),
                ),
              ),
              const SizedBox(height: 28),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: loading ? null : signup,
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
                    : const Text('Create Account',
                        style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _label(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 6),
    child: Text(text, style: const TextStyle(color: AppColors.grey, fontSize: 13)),
  );

  Widget _field(TextEditingController ctrl, String hint, bool obs,
      {TextInputType? type}) {
    return TextField(
      controller: ctrl,
      obscureText: obs,
      keyboardType: type,
      style: const TextStyle(color: AppColors.text),
      decoration: _deco(hint),
    );
  }

  InputDecoration _deco(String hint) => InputDecoration(
    hintText: hint,
    hintStyle: const TextStyle(color: AppColors.grey),
    filled: true,
    fillColor: AppColors.card,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.border)),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.border)),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.orange)),
  );
}
