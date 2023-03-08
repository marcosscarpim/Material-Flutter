import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon.dart';
import 'package:pokedex/viewmodel/poke_view_model.dart';
import 'package:provider/provider.dart';

const String URL_IMAGE =
    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/";
const String EXTENSION = ".png";

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => PokeViewModel(),
        child: Scaffold(
          body: PokemonList(),
        ),
      ),
    );
  }
}

class PokemonList extends StatefulWidget {
  const PokemonList({
    super.key,
  });

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late PokeViewModel pokeViewModel;

  @override
  void initState() {
    super.initState();
    pokeViewModel = Provider.of<PokeViewModel>(context, listen: false);
    pokeViewModel.getPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PokeViewModel>(
      builder: (context, model, child) => ListView(
        children: List.generate(pokeViewModel.pokemonList.pokemonList.length,
            (index) {
          return PokemonItem(
              pokemon: pokeViewModel.pokemonList.pokemonList[index],
              index: index);
        }),
      ),
    );
  }
}

class PokemonItem extends StatefulWidget {
  final Pokemon pokemon;
  final int index;

  const PokemonItem({
    required this.pokemon,
    required this.index,
    super.key,
  });

  @override
  State<PokemonItem> createState() => _PokemonItemState();
}

class _PokemonItemState extends State<PokemonItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Column(children: [
        Image.network("$URL_IMAGE${widget.index + 1}$EXTENSION"),
        Text(widget.pokemon.name),
      ]),
    );
  }
}
