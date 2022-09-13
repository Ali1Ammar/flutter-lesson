import 'package:flutter/material.dart';
import 'package:testing/src/material_app.dart';

void main() => runApp(MyApp());

class PositionedTiles extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PositionedTilesState();
}

class PositionedTilesState extends State<PositionedTiles> {
  List<Widget> tiles = [
    StatelessColorfulTile(),
    StatelessColorfulTile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: tiles),
      floatingActionButton: FloatingActionButton(
          onPressed: swapTiles,
          child: const Icon(Icons.sentiment_very_satisfied)),
    );
  }

  swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}

class StatelessColorfulTile extends StatelessWidget {
  const StatelessColorfulTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: const Padding(padding: EdgeInsets.all(70.0)));
  }
}
