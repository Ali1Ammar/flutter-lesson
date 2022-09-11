
import 'package:flutter/material.dart';

class PositionedTiles extends StatefulWidget {
  const PositionedTiles({super.key});

  @override
  State<StatefulWidget> createState() => PositionedTilesState();
}

class PositionedTilesState extends State<PositionedTiles> {
  List<Widget> tiles = [
    StatelessColorfulTile(),
    StatelessColorfulTile(),
  ];
  final key = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      key: key,
      body: Row(children: tiles),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
          },
          child: const Icon(Icons.sentiment_very_satisfied)),
    );
  }

  swapTiles() {
    setState(() {
      tiles = tiles.reversed.toList();
    });
  }
}

class StatelessColorfulTile extends StatefulWidget {
  const StatelessColorfulTile({super.key});

  @override
  State<StatelessColorfulTile> createState() => _StatelessColorfulTileState();
}

class _StatelessColorfulTileState extends State<StatelessColorfulTile> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: Text(counter.toString()),
      ),
    );
  }
}

int x = 0;
