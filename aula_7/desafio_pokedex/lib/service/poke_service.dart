import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:desafio_pokedex/model/pokemon.dart';
import 'package:desafio_pokedex/model/pokemon_list.dart';

Future<List<Pokemon>?> getPokemonListData() async {
  List<Pokemon>? pokeList;
  try {
    final response = await http.get(
      Uri.parse("https://pokeapi.co/api/v2/pokemon?limit=150"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
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
