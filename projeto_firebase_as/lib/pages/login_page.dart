import 'package:flutter/material.dart';
import 'package:projeto_firebase_as/widgets/my_button.dart';
import 'package:projeto_firebase_as/widgets/my_textfield.dart';

import '../auth/auth_service.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final void Function()? onTap;
  LoginPage({super.key, required this.onTap});

  void login(BuildContext context) async {
    final authService = AuthService();

    if (_emailController.text == '' || _passwordController == '') {
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Text('Preencha todos os campos!'),
              ));
      return;
    }

    try {
      await authService.signInWithEmailPassword(
          _emailController.text, _passwordController.text);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
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
            Text("Seja bem vindo!",
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
            const SizedBox(height: 20),
            MyButton(
              buttonText: "Login",
              onTap: () => login(context),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: onTap,
              child: Text(
                "Crie a sua conta",
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
