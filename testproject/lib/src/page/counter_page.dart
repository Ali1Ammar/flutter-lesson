import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  String title = "Counter Page";
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    print("Hello build running");
    return Scaffold(
      appBar: AppBar(
        title: Text("$title $counter"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
            title = "This ANother Okkkk";
          });
        },
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
