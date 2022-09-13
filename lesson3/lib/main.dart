
import 'package:flutter/material.dart';


import 'login.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  const MainApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: 
LoginPage()
// Animate()    // ??
    // Builder(builder: (context) {
    //   return MediaQuery(
    //       data: MediaQuery.of(context).copyWith(size: Size(800, 300)),
    //       child: LoginPage());
    // })
    );
  }
}
