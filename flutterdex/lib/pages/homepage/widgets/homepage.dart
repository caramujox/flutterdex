import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutterdex/consts/consts_app.dart';
import 'package:flutterdex/models/pokeapi.dart';
import 'package:flutterdex/pages/homepage/widgets/appbar_home.dart';
import 'package:flutterdex/pages/homepage/widgets/poke_item.dart';
import 'package:flutterdex/pages/samplepage.dart';
import 'package:flutterdex/stores/pokeapi_store.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PokeApiStore pokeApiStore;

  @override
  void initState() {
    super.initState();
    pokeApiStore = PokeApiStore();
    pokeApiStore.fetchPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double statusWidth = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Positioned(
            child: Opacity(
              child: Image.asset(
                ConstsApp.darkPokeball,
                height: 240,
                width: 240,
              ),
              opacity: 0.1,
            ),
            top: -(240 / 3.8),
            left: screenWidth - (240 / 1.6),
          ),
          Container(
              child: Column(children: <Widget>[
            Container(
              height: statusWidth,
              color: Colors.red,
            ),
            AppBarHome(),
            Expanded(
              child: Observer(
                name: 'ListaHomePage',
                builder: (context) {
                  PokeAPI _pokeApi = pokeApiStore.pokeApi;
                  if (_pokeApi != null) {
                    return AnimationLimiter(
                      child: GridView.builder(
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.all(12),
                          gridDelegate:
                              new SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemCount: _pokeApi.pokemon.length,
                          itemBuilder: (context, index) {
                            Pokemon pokemon = pokeApiStore.getPokemon(index: index);
                            return AnimationConfiguration.staggeredGrid(
                                position: index,
                                duration: const Duration(milliseconds: 375),
                                columnCount: 2,
                                child: ScaleAnimation(
                                  child: GestureDetector(
                                    child: PokeItem(
                                        index: index,
                                        name: pokemon.name,
                                        image: pokeApiStore.getImage(
                                            numero: pokemon.num)),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SamplePage()));
                                    },
                                  ),
                                ));
                          }),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ]))
        ],
      ),
    );
  }
}
