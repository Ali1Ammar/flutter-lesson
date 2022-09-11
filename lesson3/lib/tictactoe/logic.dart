import 'dart:io';




// void main(List<String> args) {
//   print("tictactoe playing");
//   Player currentPlayer = Player.o;
//   for (var i = 0; i < 9; i++) {
//     print("now is turn for ${currentPlayer.name}");
//     printBorard();

//     int numInp = inputNUmber();
//     borard[numInp] = currentPlayer;
//     final checkWinner = checkIfThereWinner();
//     if (checkWinner != null) break;
//     currentPlayer = currentPlayer == Player.o ? Player.x : Player.o;
//   }
//   final checkWinner = checkIfThereWinner();
//   if (checkWinner == null) {
//     print("there are no winner");
//   } else {
//     print("the winner is ${currentPlayer.name} ");
//   }
//   printBorard();
// }



enum Player { x, o }
