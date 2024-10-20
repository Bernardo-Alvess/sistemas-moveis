import 'package:flutter/material.dart';

import '../models/character.dart';

class Filter extends StatefulWidget {
  final List<Character> characters;
  final Function(String) onFilter;
  const Filter({super.key, required this.characters, required this.onFilter});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        onChanged: (value) {
          widget.onFilter(value);
        },
        decoration: const InputDecoration(
            border: OutlineInputBorder(), labelText: "Filtro"));
  }
}
