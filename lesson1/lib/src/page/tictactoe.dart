import 'package:flutter/material.dart';

class TicTacToe extends StatelessWidget {
  const TicTacToe(
      {super.key, required this.lineColor, required this.backgroundColor});
  final Color lineColor;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 240,
      color: backgroundColor,
      child: Stack(
        children: [
          Positioned(
              bottom: 70,
              child: Line(
                color: lineColor,
                isHort: false,
              )),
          Positioned(
              top: 70,
              child: Line(
                color: lineColor,
                isHort: false,
              )
              ),
          Positioned(
              right: 70,
              child: Line(
                color: lineColor,
                isHort: true,
              )),
          Positioned(
              left: 70,
              child: Line(
                color: lineColor,
                isHort: true,
              )),
        ],
      ),
    );
  }
}

class Line extends StatelessWidget {
  const Line({super.key, required this.color, required this.isHort});
  final Color color;
  final bool isHort;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: isHort ? 10 : 240,
      height: isHort ? 240 : 10,
    );
  }
}

class Circle extends StatelessWidget {
  const Circle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("O",style: TextStyle(fontSize: 50) ,);
    // return Container(
    //   margin: EdgeInsets.all(100.0),
    //   width: 50,
    //   height: 50,
    //   decoration: BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
    // );
  }
}
