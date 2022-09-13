import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

enum Player { x, o }

class _TicTacToeState extends State<TicTacToe> {
  Player current = Player.o;
  var items = <Player?>[
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
  Player? winner;
  bool endGame = false;
  int counter = 0;

  handleWinner() {
    const winnerCase = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];
    for (var element in winnerCase) {
      final fItem = items[element[0]];
      final sItem = items[element[1]];
      final tItem = items[element[2]];
      if (fItem == sItem && fItem == tItem && fItem != null) {
        print(element);
        winner = fItem;
        endGame = true;
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("current player is ${current.name}"),
              ),
              if (winner != null) Text("the winner is ${winner!.name}"),
              if (endGame && winner == null) const Text("no winner"),
              Board(
                items: items,
                onClick: (i) {
                  if (endGame) return;

                  if (items[i] != null) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("please select empty location")));
                    return;
                  }

                  setState(() {
                    counter++;
                    items[i] = current;
                    current = current == Player.o ? Player.x : Player.o;
                    handleWinner();
                    if (winner == null && !items.contains(null)) {
                      endGame = true;
                    }
                  });
                },
              ),
            ],
          )),
    );
  }
}

class Board extends StatelessWidget {
  final List<Player?> items;
  final void Function(int) onClick;
  const Board({super.key, required this.items, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10, crossAxisSpacing: 10, crossAxisCount: 3),
      children: [
        for (int i = 0; i < items.length; i++)
          InkWell(
            onTap: () {
              onClick(i);
            },
            child: Container(
              color: Colors.blue,
              child: BoardItem(item: items[i]),
            ),
          )
      ],
    );
  }
}

class BoardItem extends StatelessWidget {
  final Player? item;
  const BoardItem({super.key, this.item});

  @override
  Widget build(BuildContext context) {
    if (item == null) return const SizedBox();
    return Center(
      child: Text(
        item!.name,
        style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
      ),
    );
  }
}
