import 'package:flutter/material.dart';
import '../models/character.dart';

class Characterlist extends StatelessWidget {
  final List<Character> characters;

  const Characterlist({super.key, required this.characters});

  // @override
  // Widget build(BuildContext context) {
  //   return ListView.separated(
  //       itemBuilder: (context, index) {
  //         return ListTile(
  //           title: Text(characters[index].name),
  //           leading: Image.network(characters[index].image),
  //         );
  //       },
  //       separatorBuilder: (_, __) {
  //         return const Divider();
  //       },
  //       itemCount: characters.length);
  // }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.9,
        ),
        padding: const EdgeInsets.all(16.0),
        itemCount: characters.length,
        itemBuilder: (_, index) {
          return GridTile(
              child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    characters[index].image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Text(characters[index].name)
            ],
          ));
        });
  }
}
