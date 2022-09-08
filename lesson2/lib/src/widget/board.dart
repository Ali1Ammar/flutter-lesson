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

class Board extends StatelessWidget {
  final List<Player?> items;
  final void Function(int) onClick;
  const Board({super.key, required this.items, required this.onClick});

  @override
  Widget build(BuildContext context) {
    print(items);
    final size = MediaQuery.of(context).size;
    return Wrap(
      children: [
        for (int i = 0; i < items.length; i++)
          SizedBox(
            width: size.width / 3,
            child: AspectRatio(
              aspectRatio: 1,
              child: InkWell(
                onTap: () {
                  onClick(i);
                },
                child: Container(
                  margin: const EdgeInsets.all(8),
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: BoardItem(
                      item: items[i],
                    )),
              ),
            ),
          )
      ],
    );
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
    if (item == null)
      return Text("");
    else
      return Text(
        item!.name,
        style: TextStyle(fontSize: 50),
      );
  }
}
