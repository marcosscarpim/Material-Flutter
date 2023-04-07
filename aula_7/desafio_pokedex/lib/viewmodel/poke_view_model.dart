import 'package:desafio_pokedex/service/poke_service.dart';
import 'package:flutter/foundation.dart';
import 'package:desafio_pokedex/model/pokemon.dart';

class PokeViewModel with ChangeNotifier {
  List<Pokemon> _pokemonList = [];

  List<Pokemon> get pokemonList => _pokemonList;

  getPokemonData() async {
    if (kDebugMode) {
      print("Getting pokemons...");
    }

    _pokemonList = (await getPokemonListData());

    if (kDebugMode) {
      print("Finish getting - ${_pokemonList.length} pokemons!");
    }

    notifyListeners();
  }
}
