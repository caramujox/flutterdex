import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdex/models/pokeapi.dart';
import 'package:flutterdex/stores/pokeapi_store.dart';

class ListViewPoke extends StatefulWidget {
  @override
  _ListViewPokeState createState() => _ListViewPokeState();
}

class _ListViewPokeState extends State<ListViewPoke> {
  PokeApiStore pokeApiStore;

  @override
  void initState() {
    super.initState();
    pokeApiStore = PokeApiStore();
    pokeApiStore.fetchPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    PokeAPI _pokeApi = pokeApiStore.pokeApi;
    return ListView.builder(
      itemCount: _pokeApi.pokemon.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_pokeApi.pokemon[index].name),
        );
      },
    );
  }
}
