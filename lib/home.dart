import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/pokemon.dart';
import 'pokemon_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Pokemon> pokemons = [];
  bool loading = true;

  @override
  void initState() {
    download();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedex"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              "assets/pokebola_img.png",
              width: 40,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
              itemCount: pokemons.length,
              itemBuilder: (context, index) {
                return PokemonWidget(
                  pokemon: pokemons[index],
                );
              }),
          if (loading)
            Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }

  void download() {
    setState(() {
      loading = true;
    });
    var url = Uri.parse('http://104.131.18.84/pokemon/?limit=50&page=0');
    http.get(url).then((resposta) {
      if (resposta.statusCode == 200) {
        Map json = JsonDecoder().convert(resposta.body);

        setState(() {
          pokemons = json["data"].map<Pokemon>((item) {
            return Pokemon.fromJson(item);
          }).toList();
        });
      }
    });
    setState(() {
      loading = false;
    });
  }
}
