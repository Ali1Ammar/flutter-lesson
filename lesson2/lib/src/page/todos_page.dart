import 'package:flutter/material.dart';
import 'package:testing/src/repo/todo_repo.dart';
import 'package:testing/src/widget/board.dart';
import 'package:testing/src/widget/todo_item.dart';

import '../data/todo.dart';

class TodosPage extends StatefulWidget {
  const TodosPage({super.key});

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  final todoRepo = TodoRepo();
  Future<List<Todo>>? data;
  final set = <Todo>{};

  @override
  void initState() {
    // TODO: implement initState
    data = todoRepo.getTodo();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("todo page"),
        actions: [
          IconButton(
              onPressed: () {
                todoRepo.createTodo(Todo(
                    userId: 2,
                    desc: "desc",
                    id: 1000,
                    title: "title",
                    completed: true));
              },
              icon: Icon(Icons.start))
        ],
      ),
      body: 
          FutureBuilder(
              future: data,
              builder: (context, snap) {
                if (snap.connectionState == ConnectionState.none)
                  return Text("please press button");
                if (snap.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                if (snap.hasData) {
                  // return GridView.builder(
                  //   gridDelegate:
                  //       const SliverGridDelegateWithMaxCrossAxisExtent(
                  //     maxCrossAxisExtent: 150,
                  //   ),
                  //   itemCount: snap.data!.length,
                  //   itemBuilder: (context, index) {
                  //     final item = snap.data![index];
                  //     return TodoItemWidget(
                  //         todo: item,
                  //         value: set.contains(item),
                  //         onCheck: () {
                  //           onCheck(item);
                  //         });
                  //   },
                  // );
                  return ListView.builder(
                    itemCount: snap.data!.length,
                    itemBuilder: (context, index) {
                      final item = snap.data![index];
                      return TodoItemWidget(
                          todo: item,
                          value: set.contains(item),
                          onCheck: () {
                            onCheck(item);
                          });
                    },
                  );
                }
                return Text("done");
              }),
    );
  }

  onCheck(Todo item) {
    setState(() {
      if (set.contains(item)) {
        set.remove(item);
      } else {
        set.add(item);
      }
    });
  }
}
