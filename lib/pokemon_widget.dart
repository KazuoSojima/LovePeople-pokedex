import 'package:flutter/material.dart';
import 'package:pokedex/pokemon.dart';

import 'detail.dart';

class PokemonWidget extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonWidget({Key key, this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        contentPadding: EdgeInsets.all(15),
        title: Text(
          pokemon.name,
          style: TextStyle(fontSize: 18),
        ),
        leading: Image.network(pokemon.thumbnailImage),
        trailing: Text(
          "#${pokemon.number}",
          style: TextStyle(color: Colors.grey),
        ),
        onTap: () {
          detailPage(context, pokemon);
        },
      ),
    );
  }

  void detailPage(context, pokemon) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Detail(pokemon: pokemon),
      ),
    );
  }
}
