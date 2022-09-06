import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testproject/src/page/counter_page.dart';

class HomePage extends StatelessWidget {
  const HomePage(
      {Key? key,
      this.msg = "",
      required this.bottom,
      required this.onButtonClick})
      : super(key: key);
  final String msg;
  final Widget bottom;
  final void Function() onButtonClick;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pressed,
      ),
      body: Column(
        children: [
          Image.network(
            "https://pbs.twimg.com/profile_images/1187814172307800064/MhnwJbxw_400x400.jpg",
            height: 200,
            width: 100,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigator.of(context).pop();
                    Navigator.of(context).push(
                        // CupertinoPageRoute(builder: (context) => CounterPage()));
                        //   required Widget Function(BuildContext) builder,

                        MaterialPageRoute(builder: (context) => CounterPage()));
                  },
                  child: Text(msg),
                ),
                TextButton(onPressed: pressed, child: const Text("hii")),
                OutlinedButton(
                    onPressed: onButtonClick, child: const Text("aaa"))
              ],
            ),
          ),
          bottom
        ],
      ),
    );
  }

  void pressed() {
    print(msg);
  }
}
