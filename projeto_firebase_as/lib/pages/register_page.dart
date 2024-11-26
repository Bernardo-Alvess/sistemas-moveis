import 'package:flutter/material.dart';
import 'package:projeto_firebase_as/widgets/my_button.dart';
import 'package:projeto_firebase_as/widgets/my_textfield.dart';

import '../auth/auth_service.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  void register(BuildContext context) {
    final authService = AuthService();
    if (_passwordController.text == _confirmPasswordController.text) {
      try {
        authService.signUpWithEmailPassword(
          _emailController.text,
          _passwordController.text,
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(title: Text(e.toString())),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) =>
            const AlertDialog(title: Text("Passwords don't match")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/pokeball.png',
              width: 60,
              height: 60,
            ),
            const SizedBox(height: 50),
            Text("Crie a sua conta",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16)),
            const SizedBox(height: 50),
            MyTextField(
              hintText: "Email",
              obscureText: false,
              controller: _emailController,
            ),
            const SizedBox(height: 10),
            MyTextField(
              hintText: "Senha",
              obscureText: true,
              controller: _passwordController,
            ),
            const SizedBox(height: 10),
            MyTextField(
              hintText: "Repetir senha",
              obscureText: true,
              controller: _confirmPasswordController,
            ),
            const SizedBox(height: 20),
            MyButton(
              buttonText: "Registrar",
              onTap: () => register(context),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: onTap,
              child: Text(
                "Já tem uma conta?",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary),
              ),
            )
          ],
        ),
      ),
    );
  }
}
