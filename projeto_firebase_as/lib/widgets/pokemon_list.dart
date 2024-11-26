import 'package:flutter/material.dart';
import 'package:projeto_firebase_as/widgets/pokemon_card.dart';
import '../models/pokemon.dart';
import '../service/api_service.dart';

class PokemonListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: fetchPokemons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erro: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final pokemons = snapshot.data!;
          return ListView.builder(
            itemCount: pokemons.length,
            itemBuilder: (context, index) {
              final pokemon = pokemons[index];
              return PokemonCard(
                  pokemon: pokemon, index: index + 1); // Card customizado
            },
          );
        } else {
          return Center(child: Text('Nenhum dado encontrado.'));
        }
      },
    );
  }
}
