import 'package:flutter/material.dart';
import 'todo_model.dart';

class TodoItem extends StatelessWidget {
  final MyTodo todo;
  final Function(bool) onChanged;
  const TodoItem({super.key, required this.todo, required this.onChanged});

  @override
  Widget build(BuildContext context) {

    String dateTime = "${todo.timestamp.day}/${todo.timestamp.month}/${todo.timestamp.year} "
        "${todo.timestamp.hour}:${todo.timestamp.minute.toString().padLeft(2, '0')}";

    return CheckboxListTile(
        title: Text(todo.name),
        subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.circle_outlined,size: 12,color: _getPriorityColor(todo.priority),),
                SizedBox(width: 4,),
                Text('Priority: ${todo.priority.name}'),
                SizedBox(width: 10),
                Text("|", style: TextStyle(color: Colors.grey)),
                SizedBox(width: 10),
                Icon(Icons.folder, size: 12, color: Colors.grey),
                SizedBox(width: 4),
                Text(todo.category.name, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey),),
              ],
            ),
            Text('Created: $dateTime',style: TextStyle(color: Colors.grey),),
          ],
        ),
        value: todo.completed,
        onChanged: (value) {
          onChanged(value!);
        });
  }

  Color _getPriorityColor(TodoPriority priority) {
    switch (priority) {
      case TodoPriority.High:
        return Colors.redAccent;
      case TodoPriority.Normal:
        return Colors.orangeAccent;
      case TodoPriority.Low:
        return Colors.green;
    }
  }
}