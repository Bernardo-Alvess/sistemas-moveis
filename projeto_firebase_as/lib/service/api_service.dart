import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/pokemon.dart';

Future<List<Pokemon>> fetchPokemons() async {
  const url = 'https://pokeapi.co/api/v2/pokemon?limit=151';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final List results = data['results'];

    return Future.wait(results.map((json) async {
      final detailResponse = await http.get(Uri.parse(json['url']));

      if (detailResponse.statusCode == 200) {
        final detailData = jsonDecode(detailResponse.body);

        return Pokemon(
          name: detailData['name'],
          sprite: detailData['sprites']['front_default'],
          types: (detailData['types'] as List)
              .map((type) => type['type']['name'] as String)
              .toList(),
        );
      } else {
        throw Exception('Erro ao carregar detalhes do Pokémon');
      }
    }));
  } else {
    throw Exception('Falha ao carregar Pokémon');
  }
}
