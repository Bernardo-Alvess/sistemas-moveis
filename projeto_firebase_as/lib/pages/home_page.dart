import 'package:flutter/material.dart';
import 'package:projeto_firebase_as/auth/auth_service.dart';

import '../widgets/pokemon_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void logout() {
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/pokedex.png',
          height: 60,
        ),
        centerTitle: true,
        actions: [IconButton(onPressed: logout, icon: Icon(Icons.logout))],
      ),
      body: PokemonListView(),
    );
  }
}
