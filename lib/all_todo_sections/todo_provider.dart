import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'todo_model.dart';

class TodoProvider extends ChangeNotifier {
  List<MyTodo> _todos = [];
  bool _isLoading = true;
  TodoCategory? _selectedFilter;
  bool get isLoading => _isLoading;
  TodoCategory? get filter => _selectedFilter;

  List<MyTodo> get todos {
    if(_selectedFilter == null) {
      return _todos;
    }
    return _todos.where((todo) => todo.category == _selectedFilter).toList();
  }

  void setFilter(TodoCategory? category){
    _selectedFilter = category;
    notifyListeners();
  }


  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> listString = prefs.getStringList('my_todo_list') ?? [];

    _todos = listString
        .map((item) => MyTodo.fromJson(jsonDecode(item)))
        .toList();

    _isLoading = false;
    notifyListeners();
  }


  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> listString = _todos
        .map((todo) => jsonEncode(todo.toJson()))
        .toList();

    prefs.setStringList('my_todo_list', listString);
  }

  void addTodo(MyTodo todo) {
    _todos.add(todo);
    _saveData();
    notifyListeners();
  }


  void toggleTodoStatus(int index, bool value) {
    final todoToUpdate = todos[index];
    todoToUpdate.completed = value;
    _saveData();
    notifyListeners();
  }


  void deleteCompleted() {
    if (_selectedFilter != null) {
      _todos.removeWhere((todo) => todo.completed && todo.category == _selectedFilter);
    } else {
      _todos.removeWhere((todo) => todo.completed);
    }
    _saveData();
    notifyListeners();
  }
}