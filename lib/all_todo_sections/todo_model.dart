import 'dart:convert';

class MyTodo{
  int id;
  String name;
  bool completed;
  TodoPriority priority;
  DateTime timestamp;
  TodoCategory category;

  MyTodo({
    required this.id,
    required this.name,
    this.completed = false,
    required this.priority,
    required this.timestamp,
    this.category = TodoCategory.General
  });



  Map<String, dynamic> toJson(){
    return{
      'id': id,
      'name': name,
      'completed': completed,
      'priority' : priority.index,
      'timestamp': timestamp.toIso8601String(),
      'category': category.name,
    };
  }

  factory MyTodo.fromJson(Map<String, dynamic> json){
    return MyTodo(
      id: json['id'],
      name: json['name'],
      completed: json['completed'],
      priority: TodoPriority.values[json['priority']],
      timestamp: json['timestamp'] != null ? DateTime.parse(json['timestamp']).toLocal() : DateTime.now(),
      category: TodoCategory.values.firstWhere((e) => e.name == json['category'] ,orElse: () => TodoCategory.General)
    );
  }

}

enum TodoPriority {Low, Normal, High}

enum TodoCategory { General, Work, Personal, Shopping, Health }