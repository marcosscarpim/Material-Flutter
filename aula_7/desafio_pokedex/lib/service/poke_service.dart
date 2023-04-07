import 'package:desafio_pokedex/api/custom_dio.dart';
import 'package:flutter/foundation.dart';
import 'package:desafio_pokedex/model/pokemon.dart';
import 'package:desafio_pokedex/model/pokemon_list.dart';

Future<List<Pokemon>> getPokemonListData() async {
  var pokeList = <Pokemon>[];
  final dio = CustomDio();

  try {
    final response = await dio.get('/pokemon?limit=150');
    if (response.statusCode == 200) {
      final item = response.data;
      pokeList = getPokemonList(item);
    } else {
      if (kDebugMode) {
        print("Error");
      }
    }
  } catch (err) {
    if (kDebugMode) {
      print("Error happens - $err");
    }
  }

  return pokeList;
}
