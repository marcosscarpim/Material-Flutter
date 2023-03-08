import 'package:pokedex/model/pokemon.dart';

class PokemonList {
  late List<Pokemon> pokemonList;

  PokemonList({required this.pokemonList});

  PokemonList.fromJson(Map<String, dynamic> json) {
    List<dynamic> results = json['results'];
    List<Pokemon> pokemons = [];
    for (var element in results) {
      pokemons.add(Pokemon.fromJson(element));
    }
    pokemonList = pokemons;
  }
}
