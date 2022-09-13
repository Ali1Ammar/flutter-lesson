import 'dart:io';

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

printBorard() {
  for (var i = 0; i < 9; i += 3) {
    print(
        "${printBetter(borard[i], i)} ${printBetter(borard[i + 1], i + 1)} ${printBetter(borard[i + 2], i + 2)} ");
  }
}

String printBetter(Player? val, int i) {
  if (val == null)
    return "$i";
  else
    return val.name;
}

void main(List<String> args) {
  print("tictactoe playing");
  Player currentPlayer = Player.o;
  for (var i = 0; i < 9; i++) {
    print("now is turn for ${currentPlayer.name}");
    printBorard();

    int numInp = inputNUmber();
    borard[numInp] = currentPlayer;
    final checkWinner = checkIfThereWinner();
    if (checkWinner != null) break;
    currentPlayer = currentPlayer == Player.o ? Player.x : Player.o;
  }
  final checkWinner = checkIfThereWinner();
  if (checkWinner == null) {
    print("there are no winner");
  } else {
    print("the winner is ${currentPlayer.name} ");
  }
  printBorard();
}

int inputNUmber() {
  while (true) {
    final input = stdin.readLineSync()!;
    final numInp = int.parse(input);
    if (numInp > 8 || borard[numInp] != null) {
      print("enter emtpy place from 0 - 8 ");
      continue;
    }
    return numInp;
  }
}

Player? checkIfThereWinner() {
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
      return firstItem; // there are winner
    }
  }
  return null; // no one win yet
}

enum Player { x, o }