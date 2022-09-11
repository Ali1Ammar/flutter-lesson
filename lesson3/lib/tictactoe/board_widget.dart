/*
`AspectRatio` 
ConstrainedBox 
`Expanded` 
`Flexible`
 `FractionallySizedBox` 
 `LayoutBuilder` 
 `MediaQuery`
 */

import 'package:flutter/material.dart';

enum Player { x, o }

class BoardManger extends StatefulWidget {
  const BoardManger({super.key});

  @override
  State<BoardManger> createState() => _BoardMangerState();
}

class _BoardMangerState extends State<BoardManger> {
  Player turn = Player.o;
  bool isEnded = false;
  Player? winner;
  final List<Player?> borard = [
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
  ];
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
                color: Colors.yellow,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("now turn for ${turn.name}"),
                )),
          ),
          if (winner != null) Text("the winner is ${winner!.name}"),
          if (winner == null && isEnded) Text("end game with no winner"),
          Expanded(
            child: Board(
              items: borard,
              onClick: (index) {
                if (isEnded) return;
                if (borard[index] != null) {
                  print("select empty location");
                  return;
                }
                setState(() {
                  borard[index] = turn;
                  turn = turn == Player.o ? Player.x : Player.o;
                });
                checkIfThereWinner();
                if (counter == 8 && winner == null) {
                  isEnded = true;
                }
                counter++;
              },
            ),
          )
        ],
      ),
    );
  }

  void checkIfThereWinner() {
    final winCase = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];
    for (var element in winCase) {
      final firstItem = borard[element[0]];
      final secItem = borard[element[1]];
      final thirdItem = borard[element[2]];
      if (firstItem == secItem && secItem == thirdItem && secItem != null) {
        winner = firstItem;
        isEnded = true;
        ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
            content: Text("ok"),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.back_hand))
            ]));

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("winner")));
        break;
      }
    }
    return null; // no one win yet
  }
}

class Board extends StatelessWidget {
  final List<Player?> items;
  final void Function(int) onClick;
  const Board({super.key, required this.items, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 30, crossAxisSpacing: 30, crossAxisCount: 3),
        children: [
          for (int i = 0; i < items.length; i++)
            InkWell(
              onTap: () {
                onClick(i);
              },
              child: Container(
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: BoardItem(
                    item: items[i],
                  )),
            )
        ],
      ),
    );
  }
}

class BoardItem extends StatelessWidget {
  final Player? item;
  const BoardItem({super.key, this.item});

  @override
  Widget build(BuildContext context) {
    if (item == null) {
      return const Text("");
    } else {
      return Text(
        item!.name,
        style: const TextStyle(fontSize: 50),
      );
    }
  }
}
