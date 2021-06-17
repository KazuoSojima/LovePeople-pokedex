import 'package:flutter/material.dart';
import 'package:pokedex/pokemon.dart';

class Detail extends StatelessWidget {
  final Pokemon pokemon;

  const Detail({Key key, this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.thumbnailAltText),
      ),
      body: Card(
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "#${pokemon.number}",
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Image.network(
                          pokemon.thumbnailImage,
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  pokemon.description,
                ),
                divisor(),
                Align(
                  alignment: Alignment(-1.0, 0),
                  child: Text(
                    "Tipo:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 8),
                Align(
                  alignment: Alignment(-1.0, 0),
                  child: Text(
                    pokemon.type.join("   "),
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                divisor(),
                Align(
                  alignment: Alignment(-1.0, 0),
                  child: Text(
                    "Fraquezas:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 8),
                Align(
                  alignment: Alignment(-1.0, 0),
                  child: Text(
                    pokemon.weakness.join("   "),
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Divider divisor() {
    return Divider(
      height: 40,
      thickness: 1,
      indent: 10,
      endIndent: 10,
    );
  }
}
