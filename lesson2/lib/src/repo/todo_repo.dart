import 'dart:convert';

import 'package:testing/src/data/todo.dart';
import 'package:http/http.dart' as http;

class TodoRepo {
  var uri = Uri.parse("https://jsonplaceholder.typicode.com/todos");

  Future<List<Todo>> getTodo() async {
    final res = await http.get(uri);
    print(res.statusCode);
    if (res.statusCode != 200) {
      throw Exception("");
    }
    final data = jsonDecode(res.body) as List;
    return data.map((e) => Todo.fromJson(e)).toList();
  }

  Future<void> createTodo(Todo todo) async {
    final json = todo.toJson();
    final res = await http.post(uri, body: jsonEncode(json));
    print(res.body);
    print(res.statusCode);
    /*
    200 ok 
    400 error client  request
    500 internal server error
     */
  }
}
