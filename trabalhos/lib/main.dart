// import 'dart:ffi';
//
// import 'package:flutter/material.dart';
// import 'package:trabalhos/services/character_service.dart';
//
// import 'models/character.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   CharacterService service = CharacterService();
//
//   late Future<List<Character>> _charactersFuture;
//   late List<Character> _characters;
//   late List<Character> _filteredCharacters;
//
//   @override
//   void initState() {
//     super.initState();
//     _charactersFuture = _getCharacters();
//   }
//
//   Future<List<Character>> _getCharacters() async {
//     _characters = await service.getCharacters();
//     _filteredCharacters = _characters;
//     return _characters;
//   }
//
//   _filterCharacters(String filter) {
//     setState(() {
//       _filteredCharacters = _characters
//           .where(
//               (item) => item.name.toLowerCase().contains(filter.toLowerCase()))
//           .toList();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//       appBar: AppBar(title: const Text("Personagens")),
//       body: Column(
//         children: [
//           TextField(
//               onChanged: (value) {
//                 _filterCharacters(value);
//               },
//               decoration: const InputDecoration(
//                   border: OutlineInputBorder(), labelText: "Filtro")),
//           FutureBuilder<List<Character>>(
//               future: _charactersFuture,
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   return ListView.separated(
//                       itemBuilder: (context, index) {
//                         return ListTile(
//                           title: Text(_filteredCharacters[index].name),
//                           leading:
//                               Image.network(_filteredCharacters[index].image),
//                         );
//                       },
//                       separatorBuilder: (_, __) {
//                         return const Divider();
//                       },
//                       itemCount: _filteredCharacters.length);
//                 }
//
//                 if (snapshot.hasError) {
//                   return Text("Error");
//                 }
//
//                 return CircularProgressIndicator();
//               }),
//         ],
//       ),
//     ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:trabalhos/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: HomePage());
  }
}
