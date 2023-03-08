import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon.dart';

import '../model/pokemon_list.dart';
import '../service/poke_service.dart';

class PokeViewModel with ChangeNotifier {
  PokemonList _pokemonList = PokemonList(pokemonList: List.empty());

  PokemonList get pokemonList => _pokemonList;

  getPokemonData() async {
    print("Getting Pokemons");
    _pokemonList = (await getPokemonListData())!;
    print("Finish getting - ${_pokemonList.pokemonList[0].name}");
    notifyListeners();
  }
}
