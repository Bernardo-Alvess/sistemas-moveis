import 'package:flutter/material.dart';
import 'package:trabalhos/widgets/Filter.dart';

import '../models/character.dart';
import '../services/character_service.dart';
import '../widgets/CharacterList.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CharacterService service = CharacterService();

  late Future<List<Character>> _charactersFuture;
  List<Character> _characters = [];
  List<Character> _filteredCharacters = [];

  @override
  void initState() {
    super.initState();
    _charactersFuture = _getCharacters();
  }

  Future<List<Character>> _getCharacters() async {
    _characters = await service.getCharacters();
    _filteredCharacters = _characters;
    return _characters;
  }

  _filterCharacters(String filter) {
    setState(() {
      _filteredCharacters = _characters
          .where(
              (item) => item.name.toLowerCase().contains(filter.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Personagens")),
      body: Column(
        children: [
          Filter(
            characters: _filteredCharacters,
            onFilter: _filterCharacters,
          ),
          Expanded(
            child: FutureBuilder<List<Character>>(
                future: _charactersFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Characterlist(characters: _filteredCharacters);
                  }
                  if (snapshot.hasError) {
                    return const Text("Error");
                  }
                  return const Center(child: CircularProgressIndicator());
                }),
          ),
        ],
      ),
    );
  }
}
