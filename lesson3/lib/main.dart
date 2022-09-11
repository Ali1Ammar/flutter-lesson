import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lesson3/animate.dart';
import 'package:lesson3/key.dart';

import 'login.dart';
import 'tictactoe/board_widget.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  const MainApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: 
    
Animate()    // ??
    // Builder(builder: (context) {
    //   return MediaQuery(
    //       data: MediaQuery.of(context).copyWith(size: Size(800, 300)),
    //       child: LoginPage());
    // })
    );
  }
}
