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
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
      child: TextField(
          onChanged: (value) {
            widget.onFilter(value);
          },
          decoration: const InputDecoration(
              border: OutlineInputBorder(), labelText: "Filtro")),
    );
  }
}
