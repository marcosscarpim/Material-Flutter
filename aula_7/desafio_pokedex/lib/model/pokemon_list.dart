import 'package:desafio_pokedex/model/pokemon.dart';

List<Pokemon> getPokemonList(Map<String, dynamic> json) {
  List<Pokemon> pokemonList;
  List<dynamic> results = json['results'];
  var pokemons = <Pokemon>[];

  for (var pokemon in results) {
    pokemons.add(Pokemon.fromJson(pokemon));
  }

  pokemonList = pokemons;
  return pokemonList;
}
