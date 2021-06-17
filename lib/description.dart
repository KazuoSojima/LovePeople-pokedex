import 'package:flutter/material.dart';
import 'package:pokedex/pokemon.dart';

class Description extends StatelessWidget {
  final Pokemon item;
  const Description(Pokemon pokemon, {Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("titulo"),
      ),
      body: Card(
        child: Image.network(item.thumbnailImage),
      ),
    );
  }
}
