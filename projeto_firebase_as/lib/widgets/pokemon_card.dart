import 'package:flutter/material.dart';
import '../models/pokemon.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  final int index;

  const PokemonCard({required this.pokemon, required this.index});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 356,
        maxHeight: 241,
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        color: _getTypeBackgroundColor(pokemon.types[0]),
        child: Stack(
          children: [
            Positioned(
              top: 8,
              right: 8,
              child: Text(
                '#$index',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          pokemon.name.toUpperCase(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          direction: Axis.vertical,
                          spacing: 8,
                          children: pokemon.types.map((type) {
                            return Chip(
                              label: Text(
                                type,
                                style: const TextStyle(color: Colors.white),
                              ),
                              backgroundColor: _getTypeColor(type),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 125,
                            width: 125,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              shape: BoxShape.circle,
                            ),
                          ),
                          Image.network(
                            pokemon.sprite,
                            height: 150,
                            width: 150,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'grass':
        return Color.fromRGBO(8, 103, 0, 0.70);
      case 'poison':
        return Color.fromRGBO(36, 2, 70, 0.70);
      case 'fire':
        return Color.fromRGBO(255, 138, 0, 0.70);
      case 'water':
        return Color.fromRGBO(0, 123, 255, 0.70);
      case 'electric':
        return Color.fromRGBO(255, 204, 0, 0.70);
      case 'psychic':
        return Color.fromRGBO(255, 85, 151, 0.70);
      case 'ice':
        return Color.fromRGBO(109, 208, 255, 0.70);
      case 'rock':
        return Color.fromRGBO(182, 158, 90, 0.70);
      case 'ground':
        return Color.fromRGBO(220, 181, 95, 0.70);
      case 'ghost':
        return Color.fromRGBO(112, 88, 152, 0.70);
      case 'dark':
        return Color.fromRGBO(112, 88, 72, 0.70);
      case 'fairy':
        return Color.fromRGBO(238, 153, 172, 0.70);
      case 'bug':
        return Color.fromRGBO(168, 184, 32, 0.70);
      case 'dragon':
        return Color.fromRGBO(118, 61, 255, 0.70);
      case 'steel':
        return Color.fromRGBO(184, 184, 208, 0.70);
      case 'flying':
        return Color.fromRGBO(168, 144, 240, 0.70);
      case 'fighting':
        return Color.fromRGBO(194, 46, 40, 0.70);
      default:
        return Color.fromRGBO(128, 128, 128, 0.70);
    }
  }

  Color _getTypeBackgroundColor(String type) {
    switch (type.toLowerCase()) {
      case 'grass':
        return Color.fromRGBO(8, 103, 0, 0.5);
      case 'poison':
        return Color.fromRGBO(36, 2, 70, 0.50);
      case 'fire':
        return Color.fromRGBO(255, 138, 0, 0.50);
      case 'water':
        return Color.fromRGBO(0, 123, 255, 0.50);
      case 'electric':
        return Color.fromRGBO(255, 204, 0, 0.50);
      case 'psychic':
        return Color.fromRGBO(255, 85, 151, 0.50);
      case 'ice':
        return Color.fromRGBO(109, 208, 255, 0.50);
      case 'rock':
        return Color.fromRGBO(182, 158, 90, 0.50);
      case 'ground':
        return Color.fromRGBO(220, 181, 95, 0.50);
      case 'ghost':
        return Color.fromRGBO(112, 88, 152, 0.50);
      case 'dark':
        return Color.fromRGBO(112, 88, 72, 0.50);
      case 'fairy':
        return Color.fromRGBO(238, 153, 172, 0.50);
      case 'bug':
        return Color.fromRGBO(168, 184, 32, 0.50);
      case 'dragon':
        return Color.fromRGBO(118, 61, 255, 0.50);
      case 'steel':
        return Color.fromRGBO(184, 184, 208, 0.50);
      case 'flying':
        return Color.fromRGBO(168, 144, 240, 0.50);
      case 'fighting':
        return Color.fromRGBO(194, 46, 40, 0.50);
      default:
        return Color.fromRGBO(128, 128, 128, 0.50);
    }
  }
}
