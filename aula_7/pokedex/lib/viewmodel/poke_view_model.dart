import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon.dart';
import '../service/poke_service.dart';

class PokeViewModel with ChangeNotifier {
  List<Pokemon> _pokemonList = [];

  List<Pokemon> get pokemonList => _pokemonList;

  getPokemonData() async {
    print("Getting pokemons...");
    _pokemonList = (await getPokemonListData())!;
    print("Finish getting - ${_pokemonList.length} pokemons!");
    notifyListeners();
  }
}
