import 'package:flutter/material.dart';
import 'package:testproject/src/page/counter_page.dart';
import 'package:testproject/src/page/tictactoe.dart';

import 'src/page/home_page.dart';

void main() {
  runApp(const MyApp2());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(
        msg: "ali",
        bottom: const Text("from main app"),
        onButtonClick: () {
          print("this called from other widget");
        },
      ),
    );
  }
}

class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page', counter: 10),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.counter});

  final String title;
  final int counter;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int _counter;
  late final TextEditingController counterController;
  @override
  void initState() {
    counterController = TextEditingController();
    _counter = 5 + widget.counter;
    print("init Home Widget");
    super.initState();
  }

  @override
  void dispose() {
    counterController.dispose();
    print("this widget removed");
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decCounter() {
    if (_counter < 1) return;
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: [
          IconButton(icon: Icon(Icons.remove), onPressed: _decCounter),
          IconButton(icon: Icon(Icons.remove), onPressed: _decCounter)
        ],
        leading: IconButton(icon: Icon(Icons.remove), onPressed: _decCounter),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Circle(), Circle(), Circle(), Circle(),
            TicTacToe(
              backgroundColor: Colors.red ,
              lineColor: Colors.white,
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    final value = counterController.text;
                    final x = int.tryParse(value);
                    print(x);
                    if (x == null) return;
                    _counter = x;
                  });
                },
                child: Text("submit")),
            TextField(
              controller: counterController,
              // onChanged: (str) {
              //   // print(str);
              // },
              // onSubmitted: (a) {
              //   setState(() {
              //     final x = int.tryParse(a);
              //     print(x);
              //     if (x == null) return;
              //     _counter = x;
              //   });
              // },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
