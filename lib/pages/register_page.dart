import 'package:flutter/material.dart';

import '../utils/validators.dart';
import '../widgets/auth_scaffold.dart';
import '../widgets/auth_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  bool _loading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);
    await Future.delayed(const Duration(seconds: 1)); // fake network call
    if (!mounted) return;
    setState(() => _loading = false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text('Account created for ${_nameController.text.trim()}!'),
      ),
    );
    Navigator.pop(context); // back to login
  }

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: 'Create account ✨',
      subtitle: 'Join LUMINA in just a few steps.',
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            AuthTextField(
              controller: _nameController,
              label: ' Name',
              icon: Icons.badge_outlined,
              validator: Validators.fullName,
            ),
            const SizedBox(height: 16),
            AuthTextField(
              controller: _emailController,
              label: 'Email',
              icon: Icons.mail_outline,
              keyboardType: TextInputType.emailAddress,
              validator: Validators.email,
            ),
            const SizedBox(height: 16),
            AuthTextField(
              controller: _passwordController,
              label: 'Password',
              icon: Icons.lock_outline,
              isPassword: true,
              validator: Validators.password,
            ),
            const SizedBox(height: 16),
            AuthTextField(
              controller: _confirmController,
              label: 'Confirm Password',
              icon: Icons.lock_reset_outlined,
              isPassword: true,
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => _register(),
              validator: (v) =>
                  Validators.confirmPassword(v, _passwordController.text),
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: _loading ? null : _register,
              child: _loading
                  ? const SizedBox(
                height: 22,
                width: 22,
                child: CircularProgressIndicator(
                    strokeWidth: 2.5, color: Colors.white),
              )
                  : const Text('Create Account'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?'),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Login',
                      style: TextStyle(fontWeight: FontWeight.w700)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
