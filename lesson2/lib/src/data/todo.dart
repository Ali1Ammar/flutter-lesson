import 'package:json_annotation/json_annotation.dart';

part 'todo.g.dart';

@JsonSerializable()
class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;
  final String? desc;

  Todo(
      {required this.userId,
      required this.desc, 
      required this.id,
      required this.title,
      required this.completed});
  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  Map<String, dynamic> toJson() => _$TodoToJson(this);
}

